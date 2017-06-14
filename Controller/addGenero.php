<?php
include "../view/header.php";

?>
		<div class="row">
			<div class="col-md-10">
				<h1>Adicionar Gênero</h1>
			</div>	
			<div class="col-md-2 text-right">
				<h1><a href="../view/telaGenero.php" class="btn btn-primary"> <span class="glyphicon glyphicon-menu-left" aria-hidden="true"></span>Voltar</a></h1>
			</div>
		</div>
		<?php
		if(isset($_POST['submit'])){
			
			$nome=$_POST['nome'];
			$obs=$_POST['obs'];
			$mysqli->autocommit(false);
			
			
			if($mysqli->query("insert into genero(nomeGenero,obs) values ('$nome','$obs')"))
			{
				$mysqli->commit();
				$mysqli->close();
				?>
				<div class="alert alert-success alert-dismissible" role="alert">
				  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				  <strong>Sucesso!</strong> Foi salvo com sucesso
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
					<label for="nome">Nome do Gêneronero</label>
					<input type="text" class="form-control" id="nome" name="nome" placeholder="nome" requerid>	
				</div>
				<div class="form-group">
					<label for="obs">Observações</label>
					<input type="text" class="form-control" id="obs" name="obs" placeholder="obs" requerid>	
				</div>
	
	  <button type="submit" class="btn btn-primary" name="submit">Salvar</button>
	</form>
		
<?php
include "../view/footer.php"
?>