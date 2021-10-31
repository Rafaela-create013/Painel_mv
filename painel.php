include 'conecta_banco.inc';



$query = "SELECT atendimento FROM atendimento";
    $result = mysql_query( $query ) 
    or die(Erro na )