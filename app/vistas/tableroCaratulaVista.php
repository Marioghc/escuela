<?php include("encabezado.php"); ?>
<div class="table-responsive">
  <table class="table table-striped" width="100%">
  <thead>
    <tr>
    <th>Clave</th>
    <th>Nombre</th>
    <th>Fecha inicio</th>
    <th>Fecha final</th>
  </tr>
  </thead>
  <tbody>
    <?php
    for($i=0; $i<count($datos['cursos']); $i++){
      print "<tr>";
      print "<td class='text-left'>".$datos["cursos"][$i]['clave']."</td>";
      print "<td class='text-left'>".$datos["cursos"][$i]['nombre']."</td>";
      print "<td class='text-left'>".$datos["cursos"][$i]["fechaInicio"]."</td>";
      print "<td class='text-left'>".$datos["cursos"][$i]["fechaFin"]."</td>";
      print "</tr>";
    }
    ?>
  </tbody>
  </table>
</div>
<?php include("piepagina.php"); ?>