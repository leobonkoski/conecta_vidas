<?php

header('Content-Type: application/json');
header("Access-Control-Allow-Origin: *");		// CORS
header("Access-Control-Allow-Headers: Access-Control-Allow-Origin, Accept");
//echo json_encode(['id' => '33', 'success' => 'OK']);

define('DB_HOST'        , "DESKTOP-MAQ8R8G\SQLEXPRESS");
define('DB_USER'        , "");
define('DB_PASSWORD'    , "");
define('DB_NAME'        , "SABS");
define('DB_DRIVER'      , "sqlsrv");

require_once "../conexao.php";


try{

    $Conexao = Conexao::getConnection();
    $user = $_GET['user'];
    $pass = $_GET['pass'];
    $query = $Conexao->query("select top 1 * from DOADOR 
JOIN DOACAO ON DOADOR.MATRIC = DOACAO.MATRIC
WHERE DOADOR.MATRIC = $pass and DOADOR.CPF = $user
order by DTHR_COLI desc");
    $res  = $query->fetchAll();

 }catch(Exception $e){

    echo $e->getMessage();
    exit;

 };


 echo json_encode($res);





 

 ?>