//Processing an order and updating the database://
<?php

$servername = "localhost";
$username = "username";
$password = "password";
$dbname = "clothing_store";
$conn = new mysqli($servername, $username, $password, $dbname);
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
$customer_id = 1; 
$item_id = 1; 
$conn->begin_transaction();
$sql = "INSERT INTO orders (customer_id) VALUES ('$customer_id')";
$conn->query($sql);
$order_id = $conn->insert_id;
$sql = "INSERT INTO order_items (order_id, item_id) VALUES ('$order_id', '$item_id')";
$conn->query($sql);
$conn->commit();
echo "Order processed successfully";
$conn->close();
?>


//Adding a new customer to the database://

<?php

$servername = "localhost";
$username = "username";
$password = "password";
$dbname = "clothing_store";
$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$name = "John Doe";
$email = "john.doe@example.com";
$sql = "INSERT INTO customers (name, email) VALUES ('$name', '$email')";
if ($conn->query($sql) === TRUE) {
    echo "New customer added successfully";
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}
$conn->close();
?>


//Retrieving clothing items from the database://

<?php

$servername = "localhost";
$username = "username";
$password = "password";
$dbname = "clothing_store";
$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$sql = "SELECT * FROM clothing_items";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        echo "ID: " . $row["id"]. " - Name: " . $row["name"]. " - Price: " . $row["price"]. "<br>";
    }
} else {
    echo "0 results";
}
$conn->close();
?>