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
					<th>Cliente</th>	
					<th>Data do emprestimo</th>	
					<th>Data Prevista para devolução</th>	
					<th>Data devolvido</th>	
					<th>Valor</th>	
					<th>Tipo do cliente</th>	
					<th>Filme</th>	
					<th>Status</th>	
					
					<th width="100">Ação</th>				
				</tr>
			</thead>
			<tbody>
			<?php
				$query= $mysqli->query("SELECT * FROM vwlocacao;");
				$no=1;
				while ($row = $query->fetch_assoc())
				{
					?>
				
			
				<tr>
					<td><?php echo $no++?></td>
					<td><?php echo $row['nomePessoa']?></td>
					<td><?php echo $row['dataEmprestimo']?></td>
					<td><?php echo $row['dataPrevDevolucao']?></td>
					<td><?php echo $row['dataDevolvido']?></td>
					<td><?php echo $row['valor']?></td>
					<td><?php echo $row['tipoCliente']?></td>
					<td><?php echo $row['nomeFilme']?></td>
					<td><?php echo $row['status']?></td>
					
					<td>
						<a href="../controller/fecharLocacao.php?id=<?php echo $row['idLocacao']?>" class "btn btn-warning btn-sm"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></a>
						<a onclick="return confirm('Deseja excluir o item ?')" href="../controller/deleteLocacao.php?id=<?php echo $row['idLocacao']?>" class "btn btn-danger btn-sm"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a>
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