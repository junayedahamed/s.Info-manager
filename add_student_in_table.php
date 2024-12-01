<?php
header('Content-Type: application/json');

// Database connection configuration
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "temp";

// Connect to the database
$conn = new mysqli($servername, $username, $password, $dbname);

// Check the connection
if ($conn->connect_error) {
    echo json_encode(["status" => "error", "message" => "Connection failed: " . $conn->connect_error]);
    exit();
}

// Check if `id` is provided in the query string
if (isset($_GET['id'])) {
    $tableId = $_GET['id']; // ID to create table name
    $tableName = "user_table_" . $tableId; // Construct the table name

    // Check if required POST parameters are provided
    if (isset($_POST['idnumber']) && isset($_POST['name']) && isset($_POST['email']) && isset($_POST['dept'])) {
        $idnumber = $_POST['idnumber'];
        $name = $_POST['name'];
        $email = $_POST['email'];
        $dept = $_POST['dept'];

        // Check if the table exists
        $checkTableQuery = "SHOW TABLES LIKE '$tableName'";
        $checkTableResult = $conn->query($checkTableQuery);

        if ($checkTableResult->num_rows > 0) {
            // Insert the data into the table
            $insertQuery = "INSERT INTO `$tableName` (idnumber, name, email, dept) VALUES (?, ?, ?, ?)";
            $stmt = $conn->prepare($insertQuery);
            $stmt->bind_param("ssss", $idnumber, $name, $email, $dept);

            if ($stmt->execute()) {
                echo json_encode(["status" => "success", "message" => "Data added successfully to table $tableName."]);
            } else {
                echo json_encode(["status" => "error", "message" => "Error inserting data: " . $stmt->error]);
            }
            $stmt->close();
        } else {
            echo json_encode(["status" => "error", "message" => "Table $tableName does not exist."]);
        }
    } else {
        echo json_encode(["status" => "error", "message" => "Required parameters are missing."]);
    }
} else {
    echo json_encode(["status" => "error", "message" => "ID is required in the URL."]);
}

// Close the database connection
$conn->close();
?>
