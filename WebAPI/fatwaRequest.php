<?php
/**
 * Created by PhpStorm.
 * User: mamdouhelnakeeb
 * Date: 8/11/17
 * Time: 12:12 PM
 */

$question = htmlentities($_REQUEST["question"]);
$name = htmlentities($_REQUEST["name"]);
$phone = htmlentities($_REQUEST["phone"]);
$email = htmlentities($_REQUEST["email"]);

if (empty($question)){

    $returnArray["status"] = "400";
    $returnArray["msg"] = "fail";
    echo json_encode($returnArray);
    return;
}

require ("secure/access.php");
require ("secure/qassemconn.php");

$access = new access(DB_HOST, DB_USER, DB_PASSWORD, DB_NAME);
$access->connect();

$result = $access->fatwaRequest($question, $name, $phone, $email);

if ($result){
    $returnArray["error"] = FALSE;
    $returnArray["msg"] = "success";
    echo json_encode($returnArray);
}
else{
    $returnArray["error"] = TRUE;
    $returnArray["msg"] = "fail";
    echo json_encode($returnArray);
}

$access->disconnect();


?>