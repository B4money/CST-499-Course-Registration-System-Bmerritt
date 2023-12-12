<?php
	error_reporting(E_ALL ^ E_NOTICE);
	require_once('config.php');
	
?>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</head>
<body>

	<div class="container text-center">
		<h2> Admin Panel Update New User Role ID</h2>
		<form class="padding-top" method="post">
			<div>
				<div class="form-group">
					<label for="user_id">User ID:</label>
					<input type="text" role="form" placeholder="Enter A User ID" id="user_id" name="user_id" required>
				</div>
				<div class="form-group">
					<label for="role_id">Role ID:</label>
					<input type="text" role="form" placeholder="Enter A Role ID" id="role_id" name="role_id" required>
				</div>
				
				<p>Roles: Undergrad = 1 Graduate = 2 Applicant = 3 Professor = 4 Instructor  = 5 Aide = 6 Department_Head = 7 Advisor = 8  Administrator = 9 Technician 10 </p>
				<button type="submit" class="btn btn-primary" name="update_user">Update Roles</button>
		</form>

		<h2>Remove User From Database by User ID</h2>
			<form class="padding-top" method="post">
				<div class="form-group">
					<label for="userIDD">User ID:</label>
					<input type="text" role="form" placeholder="Enter A User ID" id="userIDD" name="userIDD" required>
				</div>
				<button type="submit" class="btn btn-primary" name="deleteUser">Delete User</button>
				<br></br>
			</form>
	</div>
</body>
</html>	

<?php
	include 'db.php';

	  if(isset($_POST['update_user'])){
		$role_id = $_POST['role_id'];
		$user_id = $_POST['user_id'];
			if ($stmt = $conn->prepare('SELECT username, `password`, first_name, last_name FROM users WHERE users.user_id = ?')) {
      // Bind parameters (s = string, i = int, b = blob, etc), in our case the username is a string so we use "s"
      $stmt->bind_param('i', $user_id);
      $stmt->execute();
      // Store the result so we can check if the account exists in the database.
      $stmt->store_result();
    
      if ($stmt->num_rows > 0) { 
        $stmt->bind_result($username, $password, $first_name, $last_name);
			   $stmt->fetch();
        $sql_query = "UPDATE `users` SET `role_id` = '$role_id' WHERE `user_id` = $user_id";}
      if(($role_id == 1) or ($role_id == 2)){
        $user_query = "INSERT INTO students (`user_id`, 
        `student_id`, 
        `password`,
        `role_id`, 
        `first_name`, 
        `last_name`)
        VALUES ($user_id, 
        '$username', 
        '$password',
        $role_id, 
        '$first_name', 
        '$last_name')";
	 }
      if(($role_id == 4) or ($role_id == 5) or ($role_id == 6)){
        $user_query = "INSERT INTO teachers (`user_id`, 
        `teacher_id`, 
        `password`,
        `role_id`, 
        `first_name`, 
        `last_name`)
        VALUES ($user_id, 
        '$username', 
        '$password',
        $role_id, 
        '$first_name', 
        '$last_name')";
	   }
		if ((mysqli_query($conn, $sql_query)) && (mysqli_query($conn, $user_query)))
{
		  echo "User profile updated!";
		  $_POST['role_id'] = $role_id; 
		  $_POST['username'] = $username;
		  $_POST['user_id'] = $user_id;
		  $_POST['first_name'] = $first_name;
		  $_POST['last_name'] = $last_name;
		  ?>
		  <meta http-equiv="refresh" content="0;URL=profile.php" /> 
		  <?php
		} 
		else
		{
		  echo "Error: " . $sql . "" . mysqli_error($conn);
		}
		}}		

?>
<?php
	if (isset($_SESSION['username'])) {
		$connString = "mysql:host=" . DBHOST . ";dbname=" . DBNAME;
		$pdo = new PDO($connString, DBUSER, DBPASS);
		$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

		if ($_SERVER['REQUEST_METHOD'] === 'POST') {
			if (isset($_POST['deleteUser'])) {
				$userID = $_POST['userIDD'];

				# Delete from student table
				$sqlDeleteUserRole = "DELETE FROM students WHERE user_id = :userID";
				$stmtDeleteUserRole = $pdo->prepare($sqlDeleteUserRole);
				$stmtDeleteUserRole->bindParam(':userID', $userID);
				$stmtDeleteUserRole->execute();
				
				$sqlDeleteUserRole = "DELETE FROM teachers WHERE user_id = :userID";
				$stmtDeleteUserRole = $pdo->prepare($sqlDeleteUserRole);
				$stmtDeleteUserRole->bindParam(':userID', $userID);
				$stmtDeleteUserRole->execute();
				
				# Delete from user table
				$sqlDeleteTblUser = "DELETE FROM users WHERE user_id = :userID";
				$stmtDeleteTblUser = $pdo->prepare($sqlDeleteTblUser);
				$stmtDeleteTblUser->bindParam(':userID', $userID);
				$stmtDeleteTblUser->execute();


				echo "Rows deleted successfully.";
				exit;
			}
		}
	} else {
		header("Location: index.php");
		exit;
	}
?>