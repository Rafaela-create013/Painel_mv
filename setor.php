<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
    <link rel="stylesheet" type="text/css" href="css/style.css" media="screen" />

    <title>Painel de internados | Santa casa da Misericordia de Santos</title>
    <style>
        table {
    font-family: arial, sans-serif;
    border-collapse: collapse;
    width: 100%;
  }
  td {
    font-family:'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
    text-align: left;
    padding: 8px;
    font-size: 14px;
  }
  th{
      font-family:'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
      text-align: left;
        padding: 8px;
        font-size: 14px;
      color: #FFF;
      background-color: #0E78AD;
  }
    </style>
</head>
<body>
<?php
    echo $_POST["internacao"] . "<BR>"; 
    $setor = $_POST["internacao"];
    ?>
<hr>
<?php
            //connect
            include_once("conexao.php");
    
            $setor = $_GET["internacao"];    
            $q = intval($_GET["internacao"]);
            
            $result_usuario = "SELECT * FROM tb_setor WHERE nm_setor = '$setor'";
            $resultado_usuario = mysqli_query($conn, $result_usuario);
            $resultado = mysqli_num_rows($resultado_usuario);

            if($resultado > 0)
            {
                while ($dados = mysqli_fetch_array($resultado_usuario)) {   
                    echo '<tr>';
                    echo '<td>'. $dados['id_paciente'] .'</td>';
                    echo '<td>'. $dados['nm_setor'] .'</td>';
                    echo '<td>'. $dados['nm_leito'] .'</td>';
                    echo '</tr>';
                }
            }
            else{
                echo "Setor sem pacientes internados";
                echo "<a href='index.php'><button type='button'>Escolha outro setor</button></a>";
            }


        ?>
<hr>  
</body>
</html>

