
<!DOCTYPE html>
<html lang="en">
<head>
<title>Roles</title>
</head>
<body>
<?php include 'master.php';?>

<div class="container text-center">
<h1>Welcome to the Roles Page!</h1>

<?php

if($_SESSION['role_id'] == 3){
    echo "You are a new applicant. If it has been more than 24 hours go to <li><a href='contact.php'><span class='glyphicon glyphicon-briefcase'></span>Contact Us</a></li> Someone will contact you!";
}
if($_SESSION['role_id'] == 1){
    echo "You are an Under Graduate Student.";
}
if($_SESSION['role_id'] == 2){
    echo "You are a Graduate Student.";
}
if($_SESSION['role_id'] == 4){
    echo "You are a Professor.";
}
if($_SESSION['role_id'] == 5){
    echo "You are an Instructor.";
}
if($_SESSION['role_id'] == 6){
    echo "You are a Teacher's Aide.";
}
if($_SESSION['role_id'] == 7){
    echo "You are a Department Head.";
}
if($_SESSION['role_id'] == 8){
    echo "You are an Advisor.";
}
if($_SESSION['role_id'] == 9){
    echo "You are an Administrator.";
	require_once 'adminpan.php';
}
if($_SESSION['role_id'] == 10){
    echo "You are a Technician.";
}
?>
</div>
<?php include 'footer.php';?>
</body>
</html>
