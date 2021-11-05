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

</head>
<body>
    <h3 >Selecione o setor de internação</h3>
    <form method="POST" >
        <select name="internacao" id="internacao">
            <option value="1A - Internação Cardiologia">1A - Internação Cardiologia</option>
            <option value="2B - Internação Pediatria">2B - Internação Pediatria</option>
            <option value="3H - Internação UTI Geral">3H - Internação Covid</option>
            <option value="4C - Internação Covid">4C - Internação UTI Geral</option>
            <input type="submit" value="selecionar">  
        </select>

        <hr>
        <table>
                <tr>
                    <th>Setor de internação</th>
                    <th>Atendimentos</th>
                    <th>Leito</th>
                </tr>
            <?php
            
            //connect
            include_once("conexao.php");
    
            $setor = $_POST["internacao"];    
            
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
        </table>
    </form>
</body>
</html>