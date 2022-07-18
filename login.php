<?php
session_start(); 
$sname= "localhost";
$unmae= "root";
$password = "";

$db_name = "bridgestonetyrematch";

$conn = mysqli_connect($sname, $unmae, $password, $db_name);
function validate($data){
	$data = trim($data);
	$data = stripslashes($data);
	$data = htmlspecialchars($data);
	return $data;
 }
$uname = validate($_POST['email']);
$pass = validate($_POST['password']);
$sql = "SELECT * FROM users WHERE email='$uname' AND password='$pass'";

$result = mysqli_query($conn, $sql);
$count = mysqli_num_rows($result);

if($count==1){
echo json_encode("Success");
}else{
	echo json_encode("Error");
}