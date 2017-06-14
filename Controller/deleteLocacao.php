<?php
include"config.php";
$id=$_GET['id'];

if(isset($id))
{
	$query=$mysqli->query("delete from locacao where idLocacao='$id'");
	if($query)
	{
		echo"<script>alert('Excluido com sucesso');location.href='../view/telaLocacao.php'</script>";
	}
	else
	{
		header('location : ../view/telaLocacao.php');
	}
}
?>