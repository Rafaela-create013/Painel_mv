<?php
// Configurações do banco de dados
$serve = "localhost";
$user = "root";
$password = "usbw";
$database = "painelMV";

mysql_connect( $serve, $user, $password, $database ) or die( ' Erro na conexão ' ); 
if (mysql_connect != null){
    mysql_select_db( $database ) or die( 'Erro na seleção do banco' );
}
?>