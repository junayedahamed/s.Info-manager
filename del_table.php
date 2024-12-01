<?php


// Database connection configuration
$servername = "localhost"; // Replace with your server name if different
$username = "root";        // Replace with your database username
$password = "";            // Replace with your database password
$dbname = "temp"; // Replace with your database name

// Create a connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check the connection
if ($conn->connect_error) {
    die(json_encode(["status" => "error", "message" => "Database connection failed: " . $conn->connect_error]));
}


// Check if user_id is provided
if (isset($_GET['id'])) {
    $id = $_GET['id'];
    $tableName = "user_table_" . $id; // Table name pattern: table{id}

    // Try to delete the table
    $sql = "DROP TABLE `$tableName`";

    if ($conn->query($sql) === TRUE) {
        echo json_encode(["status" => "success", "message" => "Table '$tableName' deleted successfully."]);
    } else {
        echo json_encode(["status" => "error", "message" => "Error deleting table '$tableName': " . $conn->error]);
    }
} else {
    echo json_encode(["status" => "error", "message" => "ID is required."]);
}

// Close the connection
$conn->close();
?>
