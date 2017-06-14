<?php
include "header.php"

?>
		<div class="row">
			<div class="col-md-10">
				<h1>Filme</h1>
			</div>	
			<div class="col-md-2 text-right">
				<h1><a href="../controller/addFilme.php" class="btn btn-primary"> <span class="glyphicon glyphicon-file" aria-hidden="true"></span>Cadastrar um novo</a></h1>
				<a href="../index.php" class="btn btn-primary"> <span class="glyphicon glyphicon-home" aria-hidden="true"></span>Inicio</a>
			</div>
		</div>
		</br>
		<table class="table table-bordere table-striped">
			<thead>
				<tr>
					<th width="20">ID</th>
					<th>Nome do Filme</th>	
					<th>Número de Copias</th>
					<th>Duração</th>	
					<th>Gênero</th>	
					<th>Observações</th>	
					<th width="100">Ação</th>				
				</tr>
			</thead>
			<tbody>
			<?php
				$query= $mysqli->query("SELECT * FROM vwfilme");
				$no=1;
				while ($row = $query->fetch_assoc())
				{
					?>
				
			
				<tr>
					<td><?php echo $no++?></td>
					<td><?php echo $row['nomeFilme']?></td>
					<td><?php echo $row['numeroCopia']?></td>
					<td><?php echo $row['duracao']?></td>
					<td><?php echo $row['nomeGenero']?></td>
					<td><?php echo $row['obs']?></td>
					<td>
						<a href="../controller/updateSetor.php?id=<?php echo $row['idGenero']?>" class "btn btn-warning btn-sm"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></a>
						<a onclick="return confirm('Deseja excluir o item ?')" href="../controller/deleteSetor.php?id=<?php echo $row['idGenero']?>" class "btn btn-danger btn-sm"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a>
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