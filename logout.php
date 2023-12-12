<?php
error_reporting(E_ALL ^ E_NOTICE);
$_SESSION['loggedin'] = FALSE;
session_start();
session_destroy();
?>
<!DOCTYPE html>
<html lang="en">
<meta http-equiv="refresh" content="0;URL=index.php" />
</body>
</html>