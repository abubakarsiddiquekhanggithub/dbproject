<?php
// Connect to the database
$servername = "localhost";
$username = "username";
$password = "password";
$dbname = "clothing_store";

$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$customer_id = 1; 
$item_id = 1; 

// Start a transaction
$conn->begin_transaction();


$sql = "INSERT INTO orders (customer_id) VALUES ('$customer_id')";
$conn->query($sql);

$order_id = $conn->insert_id;

// Insert order item
$sql = "INSERT INTO order_items (order_id, item_id) VALUES ('$order_id', '$item_id')";
$conn->query($sql);

// Commit transaction
$conn->commit();

echo "Order processed successfully";

$conn->close();
?>