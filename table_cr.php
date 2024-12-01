<?php
// Database connection details
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "temp";

// Create a connection to the database
$conn = new mysqli($servername, $username, $password, $dbname);

// Check the connection
if ($conn->connect_error) {
    die(json_encode(["status" => "error", "message" => "Connection failed: " . $conn->connect_error]));
}

// Check if user_id is provided
if (isset($_GET['user_id'])) {
    $userId = $_GET['user_id'];

    // Sanitize the user_id to prevent SQL injection
    $userId = $conn->real_escape_string($userId);

    // Generate the table name dynamically based on the user_id
    $tableName = "table" . $userId; // e.g., table1, table2, etc.

    // SQL query to create the table if it doesn't already exist
    $sql = "CREATE TABLE IF NOT EXISTS `$tableName` (
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

// Close the database connection
$conn->close();
?>
