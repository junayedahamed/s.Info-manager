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

// Check if 'user_id' and 'item_index' are provided
if (isset($_GET['user_id']) && isset($_GET['item_index'])) {
    $userId = $_GET['user_id'];
    $itemIndex = $_GET['item_index'];
    
    // Dynamically determine the table name
    $tableName = "user_table_" . $userId;

    // Prepare the SQL query to delete the row
    $sql = "DELETE FROM `$tableName` WHERE `id` = ?";

    // Prepare and execute the query
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $itemIndex);

    if ($stmt->execute()) {
        echo json_encode(["status" => "success", "message" => "Record deleted successfully."]);
    } else {
        echo json_encode(["status" => "error", "message" => "Error deleting record: " . $stmt->error]);
    }

    $stmt->close();
} else {
    echo json_encode(["status" => "error", "message" => "Invalid parameters."]);
}

$conn->close();
?>
