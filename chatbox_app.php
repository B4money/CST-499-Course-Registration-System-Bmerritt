<?php
error_reporting(E_ALL ^ E_NOTICE);
session_start();

// Check if the user is logged in
if (!isset($_SESSION['loggedin'])) {
    header('Location: login.php');
    exit;
}

// Include master.php and database connection
include 'db.php';

// Process incoming messages
if (isset($_POST['send_message'])) {
    $user_from = $_SESSION['user_id'];
    $user_to = $_POST['user_to'];
    $message = $_POST['message'];

    // Insert the message into the database
    $insertQuery = "INSERT INTO messages_chat (user_from, user_to, date_send, message) VALUES (?, ?, NOW(), ?)";
    $insertStmt = $conn->prepare($insertQuery);
    $insertStmt->bind_param('iis', $user_from, $user_to, $message);
    $insertStmt->execute();
}

// Update date_read when the user sees a message
if (isset($_POST['see_message'])) {
    $updateQuery = "UPDATE messages_chat SET date_read = NOW() WHERE user_to = ? AND date_send = ?";
    $updateStmt = $conn->prepare($updateQuery);
    $updateStmt->bind_param('is', $_SESSION['user_id'], $_POST['message_date']);
    $updateStmt->execute();
}

// Fetch and display messages
$fetchQuery = "SELECT user_from, message, date_send, date_read FROM messages_chat WHERE user_from = ? OR user_to = ?";
$fetchStmt = $conn->prepare($fetchQuery);
$fetchStmt->bind_param('ii', $_SESSION['user_id'], $_SESSION['user_id']);
$fetchStmt->execute();
$result = $fetchStmt->get_result();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Chat Box</title>
    <!-- Add your CSS styles and JavaScript libraries here -->
</head>
<body>

<div class="container text-center">
    <h1>Welcome to the Chat Box</h1>

    <div class="chat-box">
        <?php
        // Display fetched messages
        while ($row = $result->fetch_assoc()) {
            echo '<p>' . $row['user_from'] . ': ' . $row['message'] . ' (' . $row['date_send'] . ')';
            
            // Display "Read" button only if the message has not been read
            if (!$row['date_read']) {
                echo ' <form method="post" action="chatbox.php" style="display:inline;">';
                echo ' <button type="submit" name="see_message">Read</button>';
                echo ' <input type="hidden" name="message_date" value="' . $row['date_send'] . '">';
                echo ' </form>';
            }
            
            echo '</p>';
        }
        ?>
    </div>

    <form method="post" action="chatbox.php">
        <div class="form-group">
            <label for="user_to">Send to:</label>
            <select name="user_to">
                <?php
                // Fetch usernames from the users table
                $userQuery = "SELECT user_id, username FROM users";
                $userResult = $conn->query($userQuery);

                if ($userResult->num_rows > 0) {
                    while ($row = $userResult->fetch_assoc()) {
                        echo '<option value="' . $row['user_id'] . '">' . $row['username'] . '</option>';
                    }
                }
                ?>
            </select>
        </div>
        <div class="form-group">
            <label for="message">Message:</label>
            <textarea name="message" rows="4" cols="50" placeholder="Type your message here"></textarea>
        </div>
        <button type="submit" name="send_message">Send Message</button>
    </form>
</div>

<?php require_once 'footer.php'; ?>

</body>
</html>
