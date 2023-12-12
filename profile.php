<?php
error_reporting(E_ALL ^ E_NOTICE)
?>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Profile Page</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/5.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/5.3.1/css/bootstrap-theme.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/5.3.1/js/bootstrap.min.js"></script>
</head>
<body>
<?php include 'master.php';?>

<div class="container text-center">
<h1>Welcome to the Profile page</h1>

<?php

if($_SESSION['role_id'] == 3){
    echo "You are a new applicant. If it has been more than 24 hours go to <li><a href='contact.php'><span class='glyphicon glyphicon-briefcase'></span>Contact Us</a></li> Someone will contact you!";
}
if($_SESSION['role_id'] == 1){
    echo "You are a student.";
    require_once 'profile_student.php';
}
if($_SESSION['role_id'] == 2){
    echo "You are a grad student.";
    require_once 'profile_student.php';
}
if($_SESSION['role_id'] == 4){
    echo "You are a professor.";
    require_once 'profile_teacher.php';
}
if($_SESSION['role_id'] == 5){
    echo "You are an instructor.";
    require_once 'profile_teacher.php';
}
if($_SESSION['role_id'] == 6){
    echo "You are a teacher's aide.";
    require_once 'profile_teacher.php';
}
if($_SESSION['role_id'] == 9){
    echo "You are an Administrator.";
    require_once 'profile_administrator.php';
}

?>
</div>
<?php include 'footer.php';?>
</body>
</html>
