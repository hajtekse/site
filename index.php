<!DOCTYPE html>
<html>
	<head>
		<title>
			Hajtek.se dev. v. 0.1
		</title>
		<link type="text/css" rel="stylesheet" href="css/stylesheet.css" />
		<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.1/jquery.min.js"></script>
		<script type="text/javascript" src="script/leanModal/jquery.leanModal.min.js"></script>
		<meta http-equiv='Content-Type' content='text/html; charset=utf-8' />
	</head>	
	<?php
	$url = $_SERVER['REQUEST_URI'];
	$page = $_GET['page'];
	$menu = array("HEM", "FEED", "INFO", "LAG", "SERVRAR", "STREAMS", "FORUM");
	?>
	<body>
	<div id="backgroundborder">
	</div>
	<div id="maincontainer">
		<div id="mainmenu">
			<?php 
			
			//Load correct menu
			if ($page == "index") {
				include_once "indexmenu.php";
			} else if ($page == 'servers'){
				include_once "serversmenu.php";
			} else if($page == "feed"){
				include_once "feedmenu.php";
			} else if ($page == "info") {
				include_once "infomenu.php";	
			} else if ($page == "teams") {
				include_once "teamsmenu.php";
			} else if ($page == "streams") {
				include_once "streamsmenu.php";
			} else if ($page == "forum") {
				include_once "forummenu.php";
			} else {
				header("Location: ?page=index");
			}
		?>
		</div>
		<div id="mainheader">
		</div>
		<div id="toprightbanner">
		<?php 
		$username = "fredden87";
		//echo "INLOGGAD SOM <b>$username</b>";
		?>
		<b><a id="popupexec" name="popup" href="#popup" class="login">LOGGA IN || BLI MEDLEM</a></b>
			
		<script type="text/javascript">
			$("#popupexec").leanModal({ top : 200, overlay : 0.4, closeButton: ".modal_close" });
		</script>
		</div>
		<?php 
			//Load correct page
			if($page == "index") {
				include_once "indexcontent.php";
			} else if ($page == "servers") {
				include_once "servers.php";
			} else if($page == "feed"){
				include_once "feed.php";
			} else if ($page == "info") {
				include_once "info.php";	
			} else if ($page == "teams") {
				include_once "teams.php";
			} else if ($page == "streams") {
				include_once "streams.php";
			} else if ($page == "forum") {
				include_once "forum.php";
			} else {
				header("Location: ?page=index");
			}
		?>
		<div id="footerspacer">
		</div>
		<div id="footercontainer">
		</div>
	</div>
	<div id="popup">
		<div class="contsmallbanner haj">
		Logga in
		</div>
		
	</div>
	</body>
</html>