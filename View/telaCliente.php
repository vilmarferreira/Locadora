<?php
include "header.php"

?>
		<div class="row">
			<div class="col-md-10">
				<h1>Cliente</h1>
			</div>	
			<div class="col-md-2 text-right">
				<h1><a href="../controller/addCliente.php" class="btn btn-primary"> <span class="glyphicon glyphicon-file" aria-hidden="true"></span>Cadastrar um novo</a></h1>
				<a href="../index.php" class="btn btn-primary"> <span class="glyphicon glyphicon-home" aria-hidden="true"></span>Inicio</a>
			</div>
		</div>
		</br>
		<table class="table table-bordere table-striped">
			<thead>
				<tr>
					<th width="20">ID</th>
					<th>Status</th>	
					<th>Nome do Cliente</th>	
					<th>Data de nascimento</th>	
					<th>CPF</th>	
					<th>RG</th>	
					<th>Logradouro</th>	
					<th>Número</th>	
					<th>Cidade</th>	
					<th>Estado</th>
					<th>DDD</th>	
					<th>Telefone</th>	
					<th>Email</th>	
					<th width="100">Ação</th>				
				</tr>
			</thead>
			<tbody>
			<?php
				$query= $mysqli->query("select *from vwCliente");
				$no=1;
				while ($row = $query->fetch_assoc())
				{
					?>
				
			
				<tr>
					<td><?php echo $no++?></td>
					<td><?php echo $row['Status']?></td>
					<td><?php echo $row['nomePessoa']?></td>
					<td><?php echo $row['dataNascimento']?></td>
					<td><?php echo $row['CPF']?></td>
					<td><?php echo $row['rg']?></td>
					<td><?php echo $row['logradouro']?></td>
					<td><?php echo $row['numero']?></td>
					<td><?php echo $row['nomeCidade']?></td>
					<td><?php echo $row['nomeEstado']?></td>
					<td><?php echo $row['DDD']?></td>
					<td><?php echo $row['tel']?></td>
					<td><?php echo $row['email']?></td>
					<td>
						<a href="../controller/addLocacao.php?id=<?php echo $row['idCliente']?>" class "btn btn-warning btn-sm"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></a>
						<a onclick="return confirm('Deseja excluir o item ?')" href="../controller/deleteCliente.php?id=<?php echo $row['idCliente']?>" class "btn btn-danger btn-sm"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a>
					</td>
				</tr>
				<?php
				}
				?>
			</tbody>
		</table>
<?php
include "footer.php"
?>