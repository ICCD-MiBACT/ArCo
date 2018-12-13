<?php
  
if(isset($_GET["lang"])){
	$lang = $_GET["lang"];
	if($lang == "en") include index-en.html;
	else include index-it.html;
}
else include index-it.html;

?>