<?php
/**
 * Created by PhpStorm.
 * User: mamdouhelnakeeb
 * Date: 8/11/17
 * Time: 12:03 PM
 */

$userID = htmlentities($_REQUEST["userID"]);
$name = htmlentities($_REQUEST["name"]);
$chairs_no = htmlentities($_REQUEST["chairs_no"]);
$time = htmlentities($_REQUEST["time"]);

if (empty($userID)){

    $returnArray["status"] = "400";
    $returnArray["msg"] = "fail";
    echo json_encode($returnArray);
    return;
}

require ("secure/access.php");
require ("secure/qassemconn.php");

$access = new access(DB_HOST, DB_USER, DB_PASSWORD, DB_NAME);
$access->connect();

$result = $access->chairOrder($userID, $name, $chairs_no, $time);

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