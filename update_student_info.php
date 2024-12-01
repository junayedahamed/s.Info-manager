<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "temp";

// Create a connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check the connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Check if the required fields are provided
if (isset($_POST['user_id']) && isset($_POST['index']) && isset($_POST['idnumber']) && isset($_POST['name']) && isset($_POST['email']) && isset($_POST['dept'])) {
    $userId = $_POST['user_id'];
    $index = $_POST['index']; // Row index in the table
    $idnumber = $_POST['idnumber'];
    $name = $_POST['name'];
    $email = $_POST['email'];
    $dept = $_POST['dept'];

    // Dynamically determine the table name
    $tableName = "user_table_" . $userId;

    // Prepare the SQL query to update the row
    $sql = "UPDATE `$tableName` SET idnumber = ?, name = ?, email = ?, dept = ? WHERE id = ?";

    // Prepare and execute the query
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ssssi", $idnumber, $name, $email, $dept, $index);

    if ($stmt->execute()) {
        echo json_encode(["status" => "success", "message" => "Record updated successfully."]);
    } else {
        echo json_encode(["status" => "error", "message" => "Error updating record: " . $stmt->error]);
    }

    $stmt->close();
} else {
    echo json_encode(["status" => "error", "message" => "Invalid parameters."]);
}

$conn->close();
?>
