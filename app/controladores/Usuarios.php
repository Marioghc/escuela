<?php  
/**
 * 
 */
class Usuarios extends Controlador
{
	private $modelo = "";
	private $admon;
	
	function __construct()
	{
		//Creamos sesion
		$sesion = new Sesion();
		if ($sesion->getLogin()) {
			$this->modelo = $this->modelo("UsuariosModelo");
			$this->admon = $sesion->getAdmon();
		} else {
			header("location:".RUTA);
		}
		
		
	}

	public function caratula($pagina=1)
	{
		//Leemos los datos de la tabla
		$num = $this->modelo->getNumRegistros();
		$inicio = ($pagina-1)*TAMANO_PAGINA;
		$totalPaginas = ceil($num/TAMANO_PAGINA);
		$data = $this->modelo->getTabla($inicio,TAMANO_PAGINA);

		$datos = [
			"titulo"=> "Usuarios",
			"subtitulo" => "Usuarios",
			"admon" => $this->admon,
			"activo" => "usuarios",
			"data" => $data,
			"pag" => [
				"totalPaginas" => $totalPaginas,
				"regresa" => "usuarios",
				"pagina" => $pagina
			],
			"menu" => true
		];
		$this->vista("usuariosCaratulaVista",$datos);
	}

	public function alta(){
	   //Definir los arreglos
	    $data = array();
	    $errores = array();

	    //Recibimos la información de la vista
	    if ($_SERVER['REQUEST_METHOD']=="POST") {
	    	//
	      	if (isset($_FILES["fotoNueva"]) && !empty($_FILES["fotoNueva"]["name"])) {
				  $archivo = $_FILES["fotoNueva"];
				  $foto = $archivo["name"];
				  $tmp = $archivo["tmp_name"];
				  $tipo = $archivo["type"];
				  $size = $archivo["size"];
				  $dim = getimagesize($tmp);
				  $w = $dim[0];
				  $h = $dim[1];
				  $carpeta = "fotos/";

				  if ($tipo == "image/jpeg" || $tipo == "image/jpg" || $tipo == "image/png" || $tipo == "image/gif") {
				      //
				    move_uploaded_file($tmp, $carpeta.$foto);
				      //
			    } else {
			      array_push($errores,"El tipo de archivo no es permitido.");
			    }
			  } else {
			  	$foto = Helper::cadena($_POST['foto'] ?? "");
			  }
				//
	      $id = $_POST['id'] ?? "";
	      $tipo = Helper::cadena($_POST['tipo'] ?? "");
	      $correo = Helper::cadena($_POST['correo'] ?? "");
	      $clave = $_POST['clave']??"";
	      $nombres = Helper::cadena($_POST['nombres'] ?? "");
	      $apellidoPaterno = Helper::cadena($_POST['apellidoPaterno'] ?? "");
	      $apellidoMaterno = Helper::cadena($_POST['apellidoMaterno'] ?? "");
	      $genero = Helper::cadena($_POST['genero'] ?? "");
	      $telefono = Helper::cadena($_POST['telefono'] ?? "");
	      $pais = Helper::cadena($_POST['pais'] ?? "");
	      $ciudad = Helper::cadena($_POST['ciudad'] ?? "");
	      $codpos = Helper::cadena($_POST['codpos'] ?? "");
	      $fechaNacimiento = Helper::cadena($_POST['fechaNacimiento'] ?? "");
	      $tipoSangre = Helper::cadena($_POST['tipoSangre'] ?? "");
	      $estado = Helper::cadena($_POST['estado'] ?? "");
	      


	      // Validamos la información
	      // 
	      //Tipo de usuario
	      if($tipo=="void" || $tipo==0){
	        array_push($errores,"El tipo de usuario es requerido.");
	      }
	      //Correo
	      if(empty($correo)){
	        array_push($errores,"El correo es requerido.");
	      }else if(!filter_var($correo, FILTER_VALIDATE_EMAIL)) {
    			array_push($errores, "El correo no tiene un formato correcto.");
		    }
		  //Nombres 
	      if(empty($nombres)){
	        array_push($errores,"El nombre es requerido.");
	      } else if (!preg_match("/^[a-zA-ZáéíóúÁÉÍÓÚñÑ\s]+$/", $nombres)) {
            array_push($errores, "El nombre solo debe contener letras y espacios.");
		    }
		  // Apellido Paterno
	      if(empty($apellidoPaterno)){
	        array_push($errores,"El apellido paterno es requerido.");
	      } else if (!preg_match("/^[a-zA-ZáéíóúÁÉÍÓÚñÑ\s]+$/", $apellidoPaterno)) {
            array_push($errores, "El apellido paterno solo debe contener letras y espacios.");
		    }
		  //Apellido Materno
	      if(empty($apellidoMaterno)){
	        array_push($errores,"El apellido materno es requerido.");
	      } else if (!preg_match("/^[a-zA-ZáéíóúÁÉÍÓÚñÑ\s]+$/", $apellidoMaterno)) {
            array_push($errores, "El apellido materno solo debe contener letras y espacios.");
		    }
		  // Género
		  if($genero=="void" || $tipo==0){
	        array_push($errores,"El género del usuario es requerido.");
	      }
	      //Teléfono
		  if (empty($telefono)) {
		    array_push($errores, "El teléfono es requerido.");
		  } else if (!preg_match("/^\+?\d{9,15}$/", $telefono)) {
		    array_push($errores, "El teléfono no tiene un formato correcto.");
		  }
		  //País 
		  if (empty($pais)) {
			  array_push($errores, "El país es requerido.");
		  } else if (!preg_match("/^[a-zA-ZáéíóúÁÉÍÓÚñÑ\s]{2,40}$/", $pais)) {
			    array_push($errores, "El país solo debe contener letras y espacios, y debe tener entre 2 y 40 caracteres.");
		  }
		  //Ciudad
		  if (empty($ciudad)) {
			  array_push($errores, "La ciudad es requerida.");
		  } else if (!preg_match("/^[a-zA-ZáéíóúÁÉÍÓÚñÑ\s]{2,40}$/", $ciudad)) {
			    array_push($errores, "La ciudad solo debe contener letras y espacios, y debe tener entre 2 y 40 caracteres.");
		  }
		  //Código Postal
		  if (empty($codpos)) {
		    array_push($errores, "El código postal es requerido.");
		  } else if (!filter_var($codpos, FILTER_VALIDATE_INT)) {
		    array_push($errores, "El código postal debe ser un número entero.");
		  } else if ($codpos < 1000 || $codpos > 25000) {
		    array_push($errores, "Los códigos postales de Perú están entre el 1000 y el 25000 dependiendo de la región.");
		  }
		  //Fecha de nacimiento
	      if(Helper::fecha($fechaNacimiento)==false){
	        array_push($errores,"El formato de la fecha de nacimieto no es correcta.");
	      } else {
			    // Verificar si la persona tiene al menos 16 años
			    $fechaNacimientoDateTime = new DateTime($fechaNacimiento);
			    $fechaActual = new DateTime();
			    $diferencia = $fechaActual->diff($fechaNacimientoDateTime);

			    if ($diferencia->y < 16) {
			        array_push($errores, "Debe ser mayor de 16 años.");
			    }
			}
		  //Tipo de sangre
	      if($tipoSangre=="void"){
	        array_push($errores,"El estado del usuario es requerido.");
	      }
		  //Estado del usuario 
	      if($estado=="void"){
	        array_push($errores,"El estado del usuario es requerido.");
	      }

	      if (empty($errores)) { 
			// Crear arreglo de datos
			//
			$data = [
		         "id" => $id,
		         "tipo"=>$tipo,
		         "correo"=> $correo,
		         "clave"=> $clave,
		         "nombres"=> $nombres,
		         "apellidoPaterno"=> $apellidoPaterno,
		         "apellidoMaterno"=> $apellidoMaterno,
		         "genero"=> $genero,
		         "telefono"=> $telefono,
		         "pais"=> $pais,
		         "ciudad"=> $ciudad,
		         "codpos"=> $codpos,
		         "foto"=> $foto,
		         "fechaNacimiento"=> $fechaNacimiento,
		         "tipoSangre"=> $tipoSangre,
		         "estado"=> $estado
		    ];     
	        //Enviamos al modelo
	        if(trim($id)===""){
	          //Alta
	          if ($this->modelo->alta($data)) {
	            $this->mensaje(
	          		"Alta de un usuario", 
	          		"Alta de un usuario", 
	          		"Se añadió correctamente el usuario: ".$nombres." ".$apellidoPaterno, 
	          		"usuarios", 
	          		"success"
	          	);
	          } else {
	          	$this->mensaje(
	          		"Error al añadir un usuario.", 
	          		"Error al añadir un usuario.", 
	          		"Error al modificar el usuario: ".$nombres." ".$apellidoPaterno, 
	          		"usuarios", 
	          		"danger"
	          	);
	          }
	        } else {
	          //Modificar
	          if ($this->modelo->modificar($data)) {
	            $this->mensaje(
	          		"Modificar un usuario", 
	          		"Modificar un usuario", 
	          		"Se modificó correctamente un usuario: ".$nombres." ".$apellidoPaterno, 
	          		"usuarios", 
	          		"success"
	          	);
	          } else {
	          	$this->mensaje(
	          		"Error al modificar un usuario.", 
	          		"Error al modificar un usuario.", 
	          		"Error al modificar un usuario: ".$nombres." ".$apellidoPaterno, 
	          		"usuarios", 
	          		"danger"
	          	);
	          }
	        }
	      }
	    } 
	    if(!empty($errores) || $_SERVER['REQUEST_METHOD']!="POST" ){
	    	//Vista Alta
	    	$tipo = $this->modelo->getCatalogo("tipoUsuario");
	    	$genero = $this->modelo->getCatalogo("genero");
	    	$tipoSangre = $this->modelo->getCatalogo("tipoSangre");
	    	$estado = $this->modelo->getCatalogo("estado");
		    $datos = [
		      "titulo" => "Alta de un usuario",
		      "subtitulo" => "Alta de un usuario",
		      "activo" => "usuarios",
		      "menu" => true,
		      "admon" => "admon",
		      "tipo" => $tipo,
		      "tipoSangre" => $tipoSangre,
		      "genero" => $genero,
		      "estado" => $estado,
		      "errores" => $errores,
		      "data" => []
		    ];
		    $this->vista("usuariosAltaVista",$datos);
	    }
  	}

  	public function borrar($id=""){
  		if ($id==1) {
  			$this->mensaje(
      		"Advertencia", 
      		"Advertencia", 
      		"No puedes eliminar el administrador original del sistema", 
      		"usuarios", 
      		"warning"
      		);
  		} else {
  			 $ir_array = $this->modelo->getIntegridadReferencial($id);
  			 if ($ir_array["total"]==0) {
  			 	//Leemos los datos del registro del id
			    $data = $this->modelo->getId($id);
			    $tipo = $this->modelo->getCatalogo("tipoUsuario");
		    	$genero = $this->modelo->getCatalogo("genero");
		    	$tipoSangre = $this->modelo->getCatalogo("tipoSangre");
		    	$estado = $this->modelo->getCatalogo("estado");

			    //Vista baja
			    $datos = [
			      "titulo" => "Baja de un usuario",
			      "subtitulo" => "Baja de un usuario",
			      "menu" => true,
			      "admon" => "admon",
			      "errores" => [],
			      "activo" => 'usuarios',
				  "tipo" => $tipo,
				  "tipoSangre" => $tipoSangre,
				  "genero" => $genero,
				  "estado" => $estado,
			      "data" => $data,
			      "baja" => true
			    ];
			    $this->vista("usuariosAltaVista",$datos);
  			 } else {
  			 	$m = "No podemos eliminar el usuario porque tiene:<ul>";
				foreach ($ir_array as $llave => $valor) {
					if ($valor>0 && $llave!="total") {
						$m.="<li>".$valor." ".$llave."</li>";
					}
				}
				$m.="</ul>Total: ".$ir_array["total"]." registros.<br><br>";
				$m.="Primero debe eliminar sus referencias.";
				$this->mensaje(
	        		"Error al borrar el usuario", 
	        		"Error al borrar el usuario", 
	        		$m, 
	        		"usuarios", 
	        		"danger"
	        	);
  			 }
  			 
  			
  		}
  		
	 }

  public function bajaLogica($id=''){
	   if (isset($id) && $id!="") {
	     if ($this->modelo->bajaLogica($id)) {
        	$this->mensaje(
        		"Borrar un usuario", 
        		"Borrar un usuario", 
        		"Se borró correctamente un usuario.", 
        		"usuarios", 
        		"success"
        	);
        } else {
        	$this->mensaje(
        		"Error al borrar un usuario", 
        		"Error al borrar un usuario", 
        		"Error al borrar un usuario.", 
        		"usuarios", 
        		"danger"
        	);
        }
	   }
	}

  	public function modificar($id)
	{
		//Leemos los datos de la tabla
		$data = $this->modelo->getId($id);
		$errores = [];
		$tipo = $this->modelo->getCatalogo("tipoUsuario");
    	$genero = $this->modelo->getCatalogo("genero");
    	$tipoSangre = $this->modelo->getCatalogo("tipoSangre");
    	$estado = $this->modelo->getCatalogo("estado");

		$datos = [
	      "titulo" => "Modificar un usuario",
	      "subtitulo" => "Modificar un usuario",
	      "activo" => "usuarios",
	      "menu" => true,
	      "admon" => "admon",
	      "tipo" => $tipo,
	      "tipoSangre" => $tipoSangre,
	      "genero" => $genero,
	      "estado" => $estado,
	      "errores" => $errores,
	      "data" => $data
	    ];
	    $this->vista("usuariosAltaVista",$datos);
	}
}

?>