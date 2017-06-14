<?php
include "../view/header.php";

$result1= $mysqli->query("select *from genero");	

?>
		<div class="row">
			<div class="col-md-10">
				<h1>Adicionar Filme</h1>
			</div>	
			<div class="col-md-2 text-right">
				<h1><a href="../view/telaFilme.php" class="btn btn-primary"> <span class="glyphicon glyphicon-menu-left" aria-hidden="true"></span>Voltar</a></h1>
			</div>
		</div>
		<?php
		if(isset($_POST['submit'])){
			
			$nomeFilme=$_POST['nomeFilme'];
			$numeroCopia=$_POST['numeroCopia'];
			$duracao=$_POST['duracao'];
			$genero=$_POST['Genero'];
			$query=$mysqli->query("call addFilmeGenero ('$nomeFilme','$numeroCopia','$duracao','$genero')");
			
			
			
			if($mysqli->query("call addFilmeGenero ('$nomeFilme','$numeroCopia','$duracao','$genero')"))
			{
				
				?>
				<div class="alert alert-success alert-dismissible" role="alert">
				  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				  <strong>Sucesso!</strong> Foi cadastrado com sucesso
				</div>
				<?php
			}else
			{
				$mysqli->rollback();
				$mysqli->close();
				?>
				<div class="alert alert-danger alert-dismissible" role="alert">
			  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			  <strong>Erro!</strong> Ocorreu um erro ao salvar.
			</div>
				<?php
			}
			
		}
		?>
		
		
		</br>	
			<form method="post">
				<div class="form-group">
					<label for="nomeFilme">Nome do Filme</label>
					<input type="text" class="form-control" id="nomeFilme" name="nomeFilme" placeholder="nome do filme" requerid>	
				</div>
				<div class="form-group">
					<label for="duracao">Duração</label>
					<input type="text" class="form-control" id="duracao" name="duracao" placeholder="duracao" requerid>	
				</div>
				<div class="form-group">
					<label for="numeroCopia">Numero de Copia </label>
					<input type="text" class="form-control" id="numeroCopia" name="numeroCopia" placeholder="numero de copia" requerid>	
				</div>
				
				<select name="Genero" >
				<option>Selecione</option>
				<?php
					while($row_ge=$Genero= $result1->fetch_assoc())
				{
					?>
					<option value="<?php echo $row_ge['idGenero'];?>" name="Genero"><?php echo $row_ge['nomeGenero'];?></option><?php
				}
					?>		
				</select>
				</br></br>
	
	  <button type="submit" class="btn btn-primary" name="submit">Salvar</button>
	</form>
		
<?php
include "../view/footer.php"
?>