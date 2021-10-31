
<?php
session_start();
// obtem os valores digitados
$usuario = $_POST["rm"];
$senha = $_POST["senha"];

// acesso ao banco de dados
include "conecta_banco.inc";
$res = $con->query("SELECT * FROM tb_aluno where cd_rm='$usuario' and cd_senha='$senha'");
$linhas = $res->num_rows;
if($linhas==0)  // testa se a consulta retornou algum registro
{
    $_SESSION["login"] = "<div class=\"aviso\"><p>Você não realizou login, o usuário ou a senha estavam incorretos</p></div>";
    header("Location: ../index.php");
}
else
{
    setcookie("usuario", $usuario);
    setcookie("senha", $senha);

    $res = $con->query("SELECT nm_aluno FROM tb_aluno where cd_rm='$usuario'");
    $linha = $res->fetch_row();

    $_SESSION['usuario'] = $linha[0];
    // direciona para a pagina inicial dos usuarios cadastrados
    header("Location: ../aluno.php");
}
$con->close();
?>