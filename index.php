<?php
error_reporting(E_ALL ^ E_NOTICE);
?>
<!DOCTYPE html>
<html lang="en">
<head>
<style>
label{display:inline-block;width:100px;margin-bottom:10px;}
</style>
<title> Home Page Course Enrollment System</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/5.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/5.3.1/css/bootstrap-theme.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/5.3.1/js/bootstrap.min.js"></script>
</head>
<body>
<?php require_once 'config.php';?>
<?php include 'master.php';?>
<?php require_once 'footer.php';?>

<div class="container text-center">
	<?php 
		try {
			$connString = "mysql:host=" . DBHOST . ";dbname=" . DBNAME;
			$pdo = new PDO($connString, DBUSER, DBPASS);
			$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
		} catch (PDOException $e) {
			echo "Database connection failed: " . $e->getMessage();
		}
		if(isset($_SESSION['username'])) {
			$username = $_SESSION['username'];
			$query = "SELECT first_name FROM users WHERE username = :username";
			$stmt = $pdo->prepare($query);
			$stmt->bindParam(':username', $username, PDO::PARAM_STR);
			$stmt->execute();

			if ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
				echo "<h1>Welcome to the School Home Page, ". $row['first_name']."</h1>";
				echo '<h3>Please Enroll Now!</h3>';
				echo '<button><a href="courses.php"><span style="color:darkblue;" class="glyphicon glyphicon-book"></span> Courses</a></button';
			}
		} else {
			echo '<h1 style="color:darkblue;">Welcome to the Home Page</h1>';
			echo '<h3 style="color:yellowgreen;">Login to Enroll Now!</h3>';
			echo '<h3>Please login or register</h3>';
			echo '<button><a href="login.php"><span style="color:darkblue;" class="glyphicon glyphicon-user"></span> Login</a></button';
		}
	?>
</div>

</body>

</html>