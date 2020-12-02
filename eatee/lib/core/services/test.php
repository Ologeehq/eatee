<?php
$server = "localhost";
$username = "username";
$password = "password";


if ($_SERVER["REQUEST_METHOD"] == "POST") {
        // collect value of input field
        $fullname = $_POST['fullname'];
        $email = $_POST['email'];
        if (!empty($fullname) && !empty($email)) {
                //after ensuring that both fields are not empty, we can then establish our connection to server
                 
                $conn = new mysqli($server, $username, $password);

                // Check connection
                if ($conn->connect_error) {
                die("Connection failed: " . $conn->connect_error);
                }
                
                echo "Connected successfully"; //and continue
                //write the other code below 



        } else {
                 die("Name is empty");
        }
}
      
?>

<?php
$server = "localhost";
$dbname = "agric";
$password = "";

$conn = new mysqli($server, $dbname, $password);

// Check connection
if ($conn->connect_error) {
die("Connection failed: " . $conn->connect_error);
}

echo "Connected successfully"; //and continue

?>