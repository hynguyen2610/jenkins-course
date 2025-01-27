<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Display Data from MySQL with PHP</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f2f2f2;
        margin: 20px;
    }
    table {
        width: 100%;
        border-collapse: collapse;
        background-color: #fff;
        box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
    }
    table th, table td {
        padding: 12px 15px;
        text-align: left;
        border-bottom: 1px solid #ddd;
    }
    table th {
        background-color: #f2f2f2;
    }
    table tbody tr:hover {
        background-color: #f5f5f5;
    }
    .no-results {
        margin-top: 20px;
        padding: 10px;
        background-color: #f44336;
        color: white;
        text-align: center;
    }
</style>
</head>
<body>

<?php
// Database connection parameters
$servername = "db";  // Change this to your MySQL server address if needed
$username = "root";
$password = "1234";
$dbname = "people";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Query to fetch data
$sql = "SELECT id, name, lastname, age FROM register WHERE age = 25";
$result = $conn->query($sql);

// Check if there are results
if ($result->num_rows > 0) {
    // Display table headers
    echo "<table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Last Name</th>
                    <th>Age</th>
                </tr>
            </thead>
            <tbody>";

    // Output data of each row
    while ($row = $result->fetch_assoc()) {
        echo "<tr>
                <td>" . $row["id"] . "</td>
                <td>" . $row["name"] . "</td>
                <td>" . $row["last"] . "</td>
                <td>" . $row["age"] . "</td>
              </tr>";
    }

    echo "</tbody></table>";
} else {
    echo "<div class='no-results'>No results</div>";
}

// Close connection
$conn->close();
?>

</body>
</html>
