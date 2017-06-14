<?php
include "../view/header.php";

$result1= $mysqli->query("select *from estado");	

?>
		<div class="row">
			<div class="col-md-10">
				<h1>Adicionar Filme</h1>
			</div>	
			<div class="col-md-2 text-right">
				<h1><a href="../view/telaCLiente.php" class="btn btn-primary"> <span class="glyphicon glyphicon-menu-left" aria-hidden="true"></span>Voltar</a></h1>
			</div>
		</div>
		<?php
		if(isset($_POST['submit'])){
			
			$nomeCLiente=$_POST['nomeCLiente'];
			$dtNascimento=$_POST['dtNascimento'];
			$CPF=$_POST['CPF'];
			$RG=$_POST['RG'];
			$logradouro=$_POST['logradouro'];
			$numero=$_POST['numero'];
			$cidade=$_POST['cidade'];
			$cep=$_POST['cep'];
			$Estado=$_POST['Estado'];
			$ddd=$_POST['ddd'];
			$telefone=$_POST['telefone'];
			$email=$_POST['email'];
			
			
			
			$query=$mysqli->query("call addCliente ('$cidade','$Estado','$logradouro','$numero','$cep','$ddd','$telefone','$email','$nomeCLiente','$dtNascimento','$CPF','$RG')");
			
			
			
			if($mysqli->query("call addCliente ('$cidade','$Estado','$logradouro','$numero','$cep','$ddd','$telefone','$email','$nomeCLiente','$dtNascimento','$CPF','$RG')"))
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
					<label for="nomeCLiente">Nome do Cliente</label>
					<input type="text" class="form-control" id="nomeCLiente" name="nomeCLiente" placeholder="nome do cliente" requerid>	
				</div>
				<div class="form-group">
					<label for="dtNascimento">Data de Nascimento</label>
					<input type="text" class="form-control" id="dtNascimento" maxlength="10" name="dtNascimento"  placeholder="data de nascimento" requerid >	
				</div>
				<div class="form-group">
					<label for="CPF">CPF </label>
					<input type="text" class="form-control" id="CPF" name="CPF" maxlength="11" placeholder="CPF" requerid>	
				</div>
				<div class="form-group">
					<label for="RG">RG </label>
					<input type="text" class="form-control" id="RG" name="RG" maxlength="12" placeholder="RG" requerid>	
				</div>
				<div class="form-group">
					<label for="logradouro">Logradouro</label>
					<input type="text" class="form-control" id="logradouro" name="logradouro" placeholder="rua/av/praça" requerid>	
				</div>
				<div class="form-group">
					<label for="numero">Número</label>
					<input type="text" class="form-control" id="numero" name="numero" maxlength="6" placeholder="número da casa/apartamento/lote" requerid>	
				</div>
				<div class="form-group">
					<label for="cidade">Cidade</label>
					<input type="text" class="form-control" id="cidade" name="cidade" placeholder="cidade" requerid>	
				</div>
				<div class="form-group">
					<label for="cep">CEP</label>
					<input type="text" class="form-control" id="cep" name="cep" maxlength="10" placeholder="CEP" requerid>	
				</div>
				<select name="Estado" >
				<option>Estado</option>
				<?php
					while($row_es=$Estado= $result1->fetch_assoc())
				{
					?>
					<option value="<?php echo $row_es['idEstado'];?>" name="Estado"><?php echo $row_es['UF'];?></option><?php
				}
					?>		
				</select>
				</br></br>
				
				<div class="form-group">
					<label for="ddd">DDD</label>
					<input type="text" class="form-control" id="ddd" maxlength="2" name="ddd" placeholder="DDD" requerid>	
				</div>
				<div class="form-group">
					<label for="telefone">Telefone/Celular</label>
					<input type="text" class="form-control" id="telefone" maxlength="10" name="telefone" placeholder="telefone, celular,fax" requerid>	
				</div>
				<div class="form-group">
					<label for="email">Email</label>
					<input type="text" class="form-control" id="email" name="email" placeholder="Email" requerid>	
				</div>
				
	
	  <button type="submit" class="btn btn-primary" name="submit">Cadastrar</button>
	</form>
		
<?php
include "../view/footer.php"
?>