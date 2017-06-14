<?php
include"config.php";
$id=$_GET['id'];

if(isset($id))
{
	$query=$mysqli->query("delete from cliente where idCliente='$id'");
	if($query)
	{
		echo"<script>alert('Excluido com sucesso');location.href='../view/telaCliente.php'</script>";
	}
	else
	{
		header('location : ../view/telaCliente.php');
	}
}
?>