<?php
	require_once('database.inc.php');
	require_once("mysql_connect_data.inc.php");
	
	$db = new Database($host, $userName, $password, $database);
	$db->openConnection();
	if (!$db->isConnected()) {
		header("Location: index.php?err=1");
		exit();
	}
	
	$userId = $_REQUEST['username'];
	$userPassword = $_REQUEST['password'];
	if (!$db->userExists($userId)) {
		$db->closeConnection();
		header("Location: index.php?err=2");
		exit();
	} else if (!$db->verifyPassword($userPassword)) {
		db->closeConnection();
		header("Location: index.php?err=3");
		}
	$db->closeConnection();
	
	session_start();
	$_SESSION['db'] = $db;
	$_SESSION['userId'] = $userId;
	header("Location: index.php");
?>
