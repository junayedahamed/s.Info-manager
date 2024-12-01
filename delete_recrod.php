<?php


$servername = "localhost";
$username = "root";
$password = "";
$dbname = "temp";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
// Check if the request method is DELETE
if ($_SERVER['REQUEST_METHOD'] === 'DELETE') {
    parse_str(file_get_contents("php://input"), $_DELETE);
    
    if (isset($_DELETE['id'])) {
        $id = $_DELETE['id'];
        $stmt = $conn->prepare("DELETE FROM info WHERE id = ?");
        $stmt->bind_param("i", $id);
        $stmt->execute();

        if ($stmt->affected_rows > 0) {
            echo json_encode(["success" => "Record deleted successfully"]);
        } else {
            echo json_encode(["error" => "Record not found or already deleted"]);
        }

        $stmt->close();
    } else {
        echo json_encode(["error" => "ID parameter is required"]);
    }
} else {
    echo json_encode(["error" => "Invalid request method"]);
}

$conn->close();
?>