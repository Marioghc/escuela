<?php  
/**
 * 
 */
class MaterialesModelo
{
	private $db = "";
	
	function __construct()
	{
		$this->db = new MySQLdb();
	}

	public function alta($data){
	   $sql = "INSERT INTO materiales VALUES(0,"; //1. id 
	   $sql.= "'".$data['clave']."', ";          //2. clave
	   $sql.= "'".$data['tipoMaterial']."', ";    //3. tipoMaterial
	   $sql.= "'".$data['descripcion']."', ";    //4. descripcion
	   $sql.= "'".$data['referencia']."', ";     //5. referencia
	   //
	   $sql.= "0, ";                              //6. baja
	   $sql.= "'', ";                             //7. fecha baja
	   $sql.= "'', ";                             //8. fecha modificado 
	   $sql.= "NOW())";                          //9. fecha alta-creado
	   return $this->db->queryNoSelect($sql);
	 }


	public function bajaLogica($id){
		$salida = true;
		$sql = "UPDATE materiales SET baja=1, baja_dt=(NOW()) WHERE id=".$id;
		$salida = $this->db->queryNoSelect($sql);
		return $salida;
	}

	public function getTabla($inicio=1, $tamano=0)
	{
		$sql = "SELECT m.id, m.clave, m.tipoMaterial as tipo, m.descripcion, c.descripcion as tipoMaterial ";
		$sql.= "FROM materiales as m, catalogos as c ";
		$sql.= "WHERE m.baja=0 AND c.tipo='tipoMaterial' AND m.tipoMaterial=c.clave";
		if ($tamano>0) {
			$sql.= " LIMIT ".$inicio.", ".$tamano;
		}
		return $this->db->querySelect($sql);
	}

	public function getId($id)
	{
		$sql = "SELECT * FROM materiales WHERE baja=0 AND id=".$id;
		return $this->db->query($sql);
	}

	public function getCatalogo($tipo)
	{
		$sql = "SELECT * FROM catalogos WHERE tipo='".$tipo."' ORDER BY clave";
		return $this->db->querySelect($sql);
	}

	public function getNumRegistros()
	{
		//
		$sql = "SELECT COUNT(*) FROM materiales WHERE baja=0";
		$salida = $this->db->query($sql);
		return $salida["COUNT(*)"];
	}

	public function modificar($data='')
	{
		$salida = false;
	    if (!empty($data["id"])) {
	     $sql = "UPDATE materiales SET "; 
	     $sql.= "clave='".$data['clave']."', ";
	     $sql.= "descripcion='".$data['descripcion']."', ";
	     $sql.= "referencia='".$data['referencia']."', ";
	     $sql.= "tipoMaterial='".$data['tipoMaterial']."', ";
	     $sql.= "modificado_dt=(NOW()) ";
	     $sql.= "WHERE id=".$data['id'];
	     //Enviamos a la base de datos
	     $salida = $this->db->queryNoSelect($sql);
	    }
	    return $salida;
	}
}
?>