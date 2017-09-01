<?php
/**
 * Created by PhpStorm.
 * User: mamdouhelnakeeb
 * Date: 8/24/17
 * Time: 9:34 PM
 */

$name = htmlentities($_REQUEST["name"]);
$mobile = htmlentities($_REQUEST["mobile"]);
$lat = htmlentities($_REQUEST["lat"]);
$lon = htmlentities($_REQUEST["lon"]);

if (empty($name) || empty($mobile) || empty($lat) || empty($lon)){

    $returnArray["status"] = "400";
    $returnArray["msg"] = "missing data";
    echo json_encode($returnArray);
    return;
}

require ("secure/access.php");
require ("secure/qassemconn.php");

$access = new access(DB_HOST, DB_USER, DB_PASSWORD, DB_NAME);
$access->connect();

$result = $access->haggTayeh($name, $mobile, $lat, $lon);

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