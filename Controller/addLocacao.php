<?php
include "../view/header.php";
$id=$_GET['id'];
$result1= $mysqli->query("select *from filme");	

?>
		<div class="row">
			<div class="col-md-10">
				<h1>Locação</h1>
			</div>	
			<div class="col-md-2 text-right">
				<h1><a href="../view/telaCLiente.php" class="btn btn-primary"> <span class="glyphicon glyphicon-menu-left" aria-hidden="true"></span>Voltar</a></h1>
			</div>
		</div>
		<?php
		if(isset($_POST['submit'])){
			
			$dtEmprestimo=$_POST['dtEmprestimo'];
			$dtPrevDevolucao=$_POST['dtPrevDevolucao'];
			$dtDevolvido=$_POST['dtDevolvido'];
			$valor=$_POST['valor'];
			$Filme=$_POST['Filme'];
			
			
			
		
			
			if($mysqli->query("insert into locacao(dataEmprestimo,dataPrevDevolucao,dataDevolvido,valor,tipoCliente,status,Filme_idFilme,Cliente_idCliente) values ('$dtEmprestimo','$dtPrevDevolucao','$dtDevolvido','$valor','N','A','$Filme','$id')"))
			{
				$mysqli->commit();
				$mysqli->close();
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
					<label for="dtEmprestimo">Data Emprestimo</label>
					<input type="text" class="form-control" id="dtEmprestimo" name="dtEmprestimo" placeholder="Data Emprestimo" requerid>	
				</div>
				<div class="form-group">
					<label for="dtPrevDevolucao">Dara prevista para Devolucao</label>
					<input type="text" class="form-control" id="dtPrevDevolucao" name="dtPrevDevolucao" placeholder="Dara prevista para Devolucao" requerid>	
				</div>
				
				<div class="form-group">
					<label for="dtDevolvido">Data Devolvido </label>
					<input type="text" class="form-control" id="dtDevolvido" name="dtDevolvido" placeholder="Data Devolvido" requerid>	
				</div>
				<div class="form-group">
					<label for="valor">Valor </label>
					<input type="text" class="form-control" id="valor" name="valor" placeholder="Valor" requerid>	
				</div>
								
				<select name="Filme" >
				<option>Selecione</option>
				<?php
					while($row_ge=$Filme= $result1->fetch_assoc())
				{
					?>
					<option value="<?php echo $row_ge['idFilme'];?>" name="Filme"><?php echo $row_ge['nomeFilme'];?></option><?php
				}
					?>		
				</select>
				</br></br>
	
	  <button type="submit" class="btn btn-primary" name="submit">Salvar</button>
	</form>
		
<?php
include "../view/footer.php"
?>