<?php
/**
 * Created by PhpStorm.
 * User: mamdouhelnakeeb
 * Date: 8/21/17
 * Time: 1:25 PM
 */


$id = htmlentities($_REQUEST["id"]);
$answer = htmlentities($_REQUEST["answer"]);

if (empty($id) || empty($answer)){

    $returnArray["status"] = "400";
    $returnArray["msg"] = "missing";
    echo json_encode($returnArray);
    return;
}

require ("secure/access.php");
require ("secure/qassemconn.php");

$access = new access(DB_HOST, DB_USER, DB_PASSWORD, DB_NAME);
$access->connect();

$result = $access->updateFatwa($id, $answer);

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