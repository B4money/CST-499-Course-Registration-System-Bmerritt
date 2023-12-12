<?php
error_reporting(E_ALL ^ E_NOTICE)
?>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Chat Box Page</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/5.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/5.3.1/css/bootstrap-theme.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/5.3.1/js/bootstrap.min.js"></script>
</head>
<body>

<div class="text-center">

<?php
include 'master.php';
if($_SESSION['role_id'] == 3){
    echo "You are a new applicant. If it has been more than 24 hours go to <li><a href='contact.php'><span class='glyphicon glyphicon-briefcase'></span>Contact Us</a></li> Someone will contact you!";
}
if($_SESSION['role_id'] == 1){
    require_once 'chatbox_app.php';
}
if($_SESSION['role_id'] == 2){
    require_once 'chatbox_app.php';
}
if($_SESSION['role_id'] == 4){
    require_once 'chatbox_app.php';
}
if($_SESSION['role_id'] == 5){
    require_once 'chatbox_app.php';
}
if($_SESSION['role_id'] == 6){
    require_once 'chatbox_app.php';
}
if($_SESSION['role_id'] == 7){
    require_once 'chatbox_app.php';
}
if($_SESSION['role_id'] == 8){
    require_once 'chatbox_app.php';
}
if($_SESSION['role_id'] == 9){
	require_once 'chatbox_app.php';
}
if($_SESSION['role_id'] == 10){
	require_once 'chatbox_app.php';
}

?>
</div>

</body>
</html>
