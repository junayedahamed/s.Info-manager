<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "temp";

$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die(json_encode(["error" => "Connection failed: " . $conn->connect_error]));
}

// Check if request method is POST
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Read the input data
    $input = json_decode(file_get_contents("php://input"), true);

    // Validate input data
    if (isset($input['id'], $input['name'], $input['email'])) {
        $id = $input['id'];
        $name = $input['name'];
        $email = $input['email'];

        // Prepare SQL statement to update the record
        $stmt = $conn->prepare("UPDATE info SET name = ?, email = ? WHERE id = ?");
        $stmt->bind_param("ssi", $name, $email, $id);

        // Execute the query
        if ($stmt->execute()) {
            if ($stmt->affected_rows > 0) {
                echo json_encode(["success" => "Record updated successfully"]);
            } else {
                echo json_encode(["error" => "No record found with the given ID"]);
            }
        } else {
            echo json_encode(["error" => "Failed to update record: " . $stmt->error]);
        }

        $stmt->close();
    } else {
        echo json_encode(["error" => "Missing required fields: id, name, or email"]);
    }
} else {
    echo json_encode(["error" => "Invalid request method"]);
}

$conn->close();
?>
