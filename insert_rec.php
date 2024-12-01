<?php
// Database credentials
$host = 'localhost';
$user = 'root';
$password = '';
$dbname = 'temp';

// Create a MySQL connection
$mysqli = new mysqli($host, $user, $password, $dbname);

// Check connection
if ($mysqli->connect_error) {
    die("Connection failed: " . $mysqli->connect_error);
}

// Get the action (login or insert) from the request
$action = isset($_POST['action']) ? $_POST['action'] : null;

if ($action === 'login') {
    // Handle login functionality
    $email = isset($_POST['email']) ? $_POST['email'] : null;
    $pass = isset($_POST['pass']) ? $_POST['pass'] : null;

    if ($email && $pass) {
        // Prepare the SQL query to get the user's password from the database
        $stmt = $mysqli->prepare("SELECT pass FROM info WHERE email = ?");
        $stmt->bind_param("s", $email); // Bind email as string parameter
        $stmt->execute();
        $stmt->store_result();
        
        // Check if a user with this email exists
        if ($stmt->num_rows > 0) {
            // Bind the result (password) to a variable
            $stmt->bind_result($hashedPassword);
            $stmt->fetch();

            // Verify the provided password with the stored hashed password
            if (password_verify($pass, $hashedPassword)) {
                echo json_encode(["status" => "success", "message" => "Login successful."]);
            } else {
                echo json_encode(["status" => "error", "message" => "Invalid email or password."]);
            }
        } else {
            echo json_encode(["status" => "error", "message" => "User not found."]);
        }

        $stmt->close();
    } else {
        echo json_encode(["status" => "error", "message" => "Email and password are required."]);
    }
} elseif ($action === 'insert') {
    // Handle insert functionality (same as your previous insert functionality)
    $name = isset($_POST['name']) ? $_POST['name'] : null;
    $email = isset($_POST['email']) ? $_POST['email'] : null;
    $pass = isset($_POST['pass']) ? $_POST['pass'] : null;

    if ($name && $email && $pass) {
        // Hash the password before storing it
        $hashedPass = password_hash($pass, PASSWORD_DEFAULT);

        // Prepare the SQL statement to insert data
        $stmt = $mysqli->prepare("INSERT INTO info (name, email, pass) VALUES (?, ?, ?)");
        $stmt->bind_param("sss", $name, $email, $hashedPass);
        
        if ($stmt->execute()) {
            echo json_encode(["status" => "success", "message" => "Record inserted successfully."]);
        } else {
            echo json_encode(["status" => "error", "message" => "Error: " . $stmt->error]);
        }

        $stmt->close();
    } else {
        echo json_encode(["status" => "error", "message" => "All fields (name, email, pass) are required."]);
    }
} 

$mysqli->close();
?>
