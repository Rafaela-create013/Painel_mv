<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="style.css" media="screen" />

    <title>Painel de internados | Santa casa da Misericordia de Santos</title>
</head>
<style>
    *{
  margin: 0%;
  background-color: #f0f0f0;
  font-family: 'Quicksand', sans-serif;
}
ul {
  list-style-type: none;
  margin: 0%;
  padding: 0%;
  overflow: hidden;
  color: #383838;
  border-bottom: 1px solid #DCDCDC;
  height: 40px;
}
li{
  display: inline;
  float: left;
  font-family: 'Quicksand', sans-serif;
  text-align: left;
  width: 15%;
  height: 100%;
  margin-left: 1.5%;
  margin-top: 0.8%;
  font-size: 17px;
}
select{
  font-family:'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
  font-size: 13px;
  margin-top: 0.5%;
  margin-bottom: 0%;
  padding: 0.2%;
}
table {
    font-family: arial, sans-serif;
    border-collapse: collapse;
    width: 100%;
  }
  td {
    font-family:'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
    text-align: left;
    padding: 2px;
    font-size: 13px;

  }
  th{
    font-family:'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
      text-align: left;
        padding: 8px;
        font-size: 13px;
        font-weight: lighter;
        border-top:  1px solid #DCDCDC;
        border-bottom: 1px solid #DCDCDC;
      background-color:  #ECECEC;
  }
  table td a{
  font-family:'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
  width: 100%;
  float:left;
  padding: 4px 12px;
  text-decoration: none;
  color: #000;
  background-color: none;
}

p{
  font-family:'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
  font-size: 18px;
}

</style>
<body>
    <nav>
        <ul>
            <form method="POST" action="">
            <div class="container">
                <li>Setores de internação</li>
                    <select id="internacao" name="internacao" autofocus>
                        <option value="1A - Internação Cardiologia">1A - Internação Cardiologia</option>
                        <option value="2B - Internação Pediatria">2B - Internação Pediatria</option>
                        <option value="3H - Internação UTI Geral">3H - Internação Covid</option>
                        <option value="4C - Internação Covid">4C - Internação UTI Geral</option>
                    </select>    
                    <input value="enviar" type="submit">
            </div>
        </ul>
    </nav>
        <table>
                <tr>
                
                    <th>Atendimentos</th>
                    <th>Enfermaria</th>
                    <th>Leito</th>
                </tr>
        <?php
            
            //connect
            include_once("conexao.php");
        if(isset($_POST['internacao'])){
                $setor = $_POST["internacao"];    
                
                $result_usuario = "SELECT * FROM tb_setor WHERE nm_setor = '$setor'";
                $resultado_usuario = mysqli_query($conn, $result_usuario);
                $resultado = mysqli_num_rows($resultado_usuario);

                if($resultado > 0)
                {
                    while ($dados = mysqli_fetch_array($resultado_usuario)) {   
                        echo '<tr>';
                        echo '<td><a href="conexao.php">'. $dados['id_paciente'] .'</a></td>';
                        echo '<td>'. $dados['nm_setor'] .'</td>';
                        echo '<td>'. $dados['nm_leito'] .'</td>';
                        echo '</tr>';
                    }
                }
                else{
                    echo "Setor sem pacientes internados";
                    echo "<a href='index.php'><button type='button'>Escolha outro setor</button></a>";
                }
        }
        ?>
        </table>
    </form>
</body>
</html>
