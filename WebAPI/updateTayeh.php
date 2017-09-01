<?php
/**
 * Created by PhpStorm.
 * User: mamdouhelnakeeb
 * Date: 8/21/17
 * Time: 1:25 PM
 */


$id = htmlentities($_REQUEST["id"]);
$mode = htmlentities($_REQUEST["status"]);

if (empty($id) || empty($mode)){

    $returnArray["status"] = "400";
    $returnArray["msg"] = "missing";
    echo json_encode($returnArray);
    return;
}

require ("secure/access.php");
require ("secure/qassemconn.php");

$access = new access(DB_HOST, DB_USER, DB_PASSWORD, DB_NAME);
$access->connect();

if ($mode === "waiting"){
    $mode = "done";
}
else{
    $mode = "waiting";
}

$result = $access->updateTayeh($id, $mode);

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