<?php include_once("encabezado.php"); 
function tipoExamen($tipo,$tipoExamen)
{
  $salida = "";
  for ($i=0; $i < count($tipoExamen); $i++) { 
    if ($tipo==$tipoExamen[$i]["clave"]) {
      $salida = $tipoExamen[$i]["descripcion"];
      break;
    }
  }
  return $salida;
}
function buscarAsistencia($clase,$asistecias)
{
  $a = 0;
  for ($i=0; $i < count($asistecias); $i++) { 
    if ($clase==$asistecias[$i]["idClase"]) {
      $a = $asistecias[$i]["estado"];
      break;
    }
  }
  return $a;
}
?>
  <div class="table-responsive">
  <table class="table table-striped" width="100%">
  <thead>
    <tr>
    <th>#</th>
    <th>Fecha</th>
    <th>Observación</th>
    <th>Examen</th>
    <th>Calificación</th>
  </tr>
  </thead>
  <tbody>
    <?php
    for($i=0; $i<count($datos['data']); $i++){
      print "<tr>";
      $ii = (($datos["pag"]["pagina"]-1)*TAMANO_PAGINA)+($i+1);
      print "<td class='text-left'>".($ii)."</td>";
      print "<td class='text-left'>".$datos["data"][$i]['fecha']."</td>";
      print "<td class='text-left'>".$datos["data"][$i]['observacion']."</td>";
      if ($datos["data"][$i]["tipoExamen"]==0) {
        print "<td class='text-left'>---</td>";
        print "<td class='text-left'></td>";
      } else {
        print "<td class='text-left'>".tipoExamen($datos["data"][$i]["tipoExamen"],$datos["tipoExamen"])."</td>";
        print "<td class='text-left'>".$datos["data"][$i]["calificacion"]."</td>";
      }
      $a = buscarAsistencia($ii,$datos["asistencias"]);
      if ($a==0) {
        //No existe
        print "<td><a href='".RUTA."profesores/actualizarAsistencia/".$datos["data"][$i]["id"]."/".$datos["curso"]["id"]."/".$datos["usuario"]["id"]."/".$datos["pag"]["pagina"]."' class='btn btn-warning' style='width:100px;'>Asistencia</a></td>";
        //
        print "<td><a href='".RUTA."profesores/actualizarFalta/".$datos["data"][$i]["id"]."/".$datos["curso"]["id"]."/".$datos["usuario"]["id"]."/".$datos["pag"]["pagina"]."' class='btn btn-danger' style='width:100px;'>Falta</a></td>";
      } else if($a==1){
        print "<td><a href='' class='btn btn-success disabled' style='width:100px;'>Asistencia</a></td>";
        //
        print "<td><a href='".RUTA."profesores/quitarAsistencia";
        print "/".$datos["data"][$i]["id"]; //identificador de clase
        print "/".$datos["curso"]["id"];    //identificador de curso
        print "/".$datos["usuario"]["id"];  //identificador de usuario
        print "/".$datos["pag"]["pagina"];  //numero página
        print "' class='btn btn-secondary' style='width:100px;'>Quitar</a></td>";
      } else {
        print "<td><a href='' class='btn btn-danger disabled' style='width:100px;'>Falta</a></td>";
        //
        print "<td><a href='".RUTA."profesores/quitarAsistencia";
        print "/".$datos["data"][$i]["id"]; //identificador de clase
        print "/".$datos["curso"]["id"];    //identificador de curso
        print "/".$datos["usuario"]["id"];  //identificador de usuario
        print "/".$datos["pag"]["pagina"];  //numero página
        print "' class='btn btn-secondary' style='width:100px;'>Quitar</a></td>";
      }
      print "</tr>";
    }
    ?>
  </tbody>
  </table>
  <?php include("paginacion.php"); ?>
  </div>
<a href="<?php print RUTA; ?>profesores" class="btn btn-success">
  Regresar</a>
<?php include_once("piepagina.php"); ?>