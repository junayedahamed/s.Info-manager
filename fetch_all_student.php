<?php
header('Content-Type: application/json');

// Database connection configuration
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "temp";

// Connect to the database
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    echo json_encode(["status" => "error", "message" => "Connection failed: " . $conn->connect_error]);
    exit();
}

// Check if `id` is provided in the query string
if (isset($_GET['id'])) {
    $tableId = $_GET['id'];
    $tableName = "user_table_" . $tableId;

    // Check if the table exists
    $checkTableQuery = "SHOW TABLES LIKE '$tableName'";
    $checkTableResult = $conn->query($checkTableQuery);

    if ($checkTableResult->num_rows > 0) {
        // Fetch all data from the table
        $selectQuery = "SELECT * FROM `$tableName`";
        $result = $conn->query($selectQuery);

        if ($result->num_rows > 0) {
            $data = [];
            while ($row = $result->fetch_assoc()) {
                $data[] = $row;
            }
            echo json_encode(["status" => "success", "data" => $data]);
        } else {
            echo json_encode(["status" => "success", "data" => []]); // No data found
        }
    } else {
        echo json_encode(["status" => "error", "message" => "Table $tableName does not exist."]);
    }
} else {
    echo json_encode(["status" => "error", "message" => "ID is required in the URL."]);
}

// Close the database connection
$conn->close();
?>
