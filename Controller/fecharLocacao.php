<?php
include"config.php";
$id=$_GET['id'];

if(isset($id))
{
	$query=$mysqli->query("update locacao set status ='F',dataDevolvido = NOW()  where idLocacao='$id'");
	if($query)
	{
		echo"<script>alert('Fechado com sucesso');location.href='../view/telaLocacao.php'</script>";
	}
	else
	{
		header('location : ../view/telaLocacao.php');
	}
}
?>