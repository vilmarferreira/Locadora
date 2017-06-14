<?php
include"config.php";
$id=$_GET['id'];

if(isset($id))
{
	$query=$mysqli->query("delete from genero where idGenero='$id'");
	if($query)
	{
		echo"<script>alert('Excluido com sucesso');location.href='../view/telaGenero.php'</script>";
	}
	else
	{
		header('location : ../view/telaGenero.php');
	}
}
?>