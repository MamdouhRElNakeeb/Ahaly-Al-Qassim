<?php
/**
 * Created by PhpStorm.
 * User: mamdouhelnakeeb
 * Date: 8/6/17
 * Time: 3:49 PM
 */


class access{
    //connection global variables
    var $host = null;
    var $username = null;
    var $dpass = null;
    var $dname = null;
    var $conn = null;
    var $result = null;

    public function __construct($dbhost, $dbuser, $dbpass, $dbname){

        $this->host = $dbhost;
        $this->username = $dbuser;
        $this->dpass = $dbpass;
        $this->dname = $dbname;
    }

    public function connect(){
        $this->conn = new mysqli($this->host, $this->username, $this->dpass, $this->dname);
        if (mysqli_connect_errno()) {
            echo "Failed to connect to Database: " . mysqli_connect_error();
        }
        $this->conn->set_charset("utf8");
    }

    public function disconnect(){
        if($this->conn != null){
            $this->conn->close();
        }
    }

    public function getTableContent($tableName){

        $sql = "SELECT * FROM $tableName";
        $result = $this->conn->query($sql);
        return $result;

    }

    public function getChat($userID){

        $sql = "SELECT * FROM chat_msgs WHERE fromUserID=$userID OR toUserID=$userID";
        $result = $this->conn->query($sql);
        return $result;

    }

    // insert appointment into database
    public function sendMsg($id, $msg){

        $sql = "INSERT INTO chat_msgs SET fromUserID=?, msg=?";
        $statement = $this->conn->prepare($sql);
        if(!$statement){
            throw new Exception($statement->error);
        }
        // bind 8 parameters of type string to be placed in $sql command
        $statement->bind_param("ss", $id, $msg);
        $returnValue = $statement->execute();
        return $returnValue;

    }

    // insert appointment into database
    public function contactMsg($id, $subject, $msg, $name, $mobile){

        $sql = "INSERT INTO contact_msgs SET userID=?, subject=?, msg=?, name=?, mobile=?";
        $statement = $this->conn->prepare($sql);
        if(!$statement){
            throw new Exception($statement->error);
        }
        // bind 8 parameters of type string to be placed in $sql command
        $statement->bind_param("sssss", $id, $subject, $msg, $name, $mobile);
        $returnValue = $statement->execute();
        return $returnValue;

    }

    // insert appointment into database
    public function chairOrder($id, $name, $time, $chairs_no){

        $sql = "INSERT INTO chair_orders SET mobile=?, name=?, time=?, chairs_no=?";
        $statement = $this->conn->prepare($sql);
        if(!$statement){
            throw new Exception($statement->error);
        }
        // bind 8 parameters of type string to be placed in $sql command
        $statement->bind_param("ssss", $id, $name, $time, $chairs_no);
        $returnValue = $statement->execute();
        return $returnValue;

    }

    // insert appointment into database
    public function haggTayeh($name, $mobile, $lat, $lon){

        $sql = "INSERT INTO hagg_tayeh SET name=?, mobile=?, lat=?, lon=?";
        $statement = $this->conn->prepare($sql);
        if(!$statement){
            throw new Exception($statement->error);
        }
        // bind 8 parameters of type string to be placed in $sql command
        $statement->bind_param("ssss", $name, $mobile, $lat, $lon);
        $returnValue = $statement->execute();
        return $returnValue;

    }

    // insert appointment into database
    public function updateTayeh($id, $mode){

        $sql = "UPDATE hagg_tayeh SET status=? WHERE id=?";
        $statement = $this->conn->prepare($sql);
        if(!$statement){
            throw new Exception($statement->error);
        }
        // bind 8 parameters of type string to be placed in $sql command
        $statement->bind_param("ss", $mode, $id);
        $returnValue = $statement->execute();
        return $returnValue;

    }

    // insert appointment into database
    public function fatwaRequest($question, $name, $phone, $email){

        $sql = "INSERT INTO fatawy SET question=?, name=?, mobile=?, email=?";
        $statement = $this->conn->prepare($sql);
        if(!$statement){
            throw new Exception($statement->error);
        }
        // bind 8 parameters of type string to be placed in $sql command
        $statement->bind_param("ssss", $question, $name, $phone, $email);
        $returnValue = $statement->execute();
        return $returnValue;

    }

    // insert appointment into database
    public function updateFatwa($id, $answer){

        $sql = "UPDATE fatawy SET answer=? WHERE id=?";
        $statement = $this->conn->prepare($sql);
        if(!$statement){
            throw new Exception($statement->error);
        }
        // bind 8 parameters of type string to be placed in $sql command
        $statement->bind_param("ss", $answer, $id);
        $returnValue = $statement->execute();
        return $returnValue;

    }

    // insert service into database
    public function insertCamp($name, $latitude, $longitude, $description){

        $sql = "INSERT INTO camp_locations SET name=?, latitude=?, longitude=?, description=?";
        $statement = $this->conn->prepare($sql);
        if(!$statement){
            throw new Exception($statement->error);
        }
        // bind 4 parameters of type string to be placed in $sql command
        $statement->bind_param("ssss", $name, $latitude, $longitude, $description);
        $returnValue = $statement->execute();
        return $returnValue;

    }

    // insert photo into database
    public function insertPhoto($name, $description){

        $sql = "INSERT INTO Gallery SET name=?, description=?";
        $statement = $this->conn->prepare($sql);
        if(!$statement){
            throw new Exception($statement->error);
        }
        // bind 2 parameters of type string to be placed in $sql command
        $statement->bind_param("ss", $name, $description);
        $returnValue = $statement->execute();
        return $returnValue;

    }
}

?>