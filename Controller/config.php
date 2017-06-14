<?php
$mysqli= new mysqli('localhost','root','3571203','locadora');
	if($mysqli->connect_errno)
	{
		echo "Erro ao conectar :/".$mysqli->connect_error;
	}
?>