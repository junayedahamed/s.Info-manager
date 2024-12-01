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
if (isset($_GET['user_id'])) {
    $userId = $_GET['user_id'];

    // Sanitize the user_id to prevent SQL injection
    $userId = $conn->real_escape_string($userId);

    // Generate the table name using the user ID
    $tableName = "user_table_" . $userId;

    // SQL query to create the table if it doesn't already exist
    $sql = "CREATE TABLE `$tableName` (
                `id` INT(11) AUTO_INCREMENT PRIMARY KEY,
                `idnumber` VARCHAR(255) NOT NULL,
                `name` VARCHAR(255) NOT NULL,
                `email` VARCHAR(255) NOT NULL,
                `dept` VARCHAR(255) NOT NULL
            )";

    // Execute the query
    if ($conn->query($sql) === TRUE) {
        echo json_encode(["status" => "success", "message" => "Table '$tableName' created successfully."]);
    } else {
        echo json_encode(["status" => "error", "message" => "Error creating table: " . $conn->error]);
    }
} else {
    echo json_encode(["status" => "error", "message" => "User ID is required."]);
}

// Close the connection
$conn->close();
?>
