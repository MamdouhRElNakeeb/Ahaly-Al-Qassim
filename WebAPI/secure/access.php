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

    // insert appointment into database
    public function makeAppointment($name, $gender, $service, $date, $email, $mobile, $message){

        $sql = "INSERT INTO Appointment SET name=?, gender=?, service=?, date=?, email=?, mobile=?, message=?";
        $statement = $this->conn->prepare($sql);
        if(!$statement){
            throw new Exception($statement->error);
        }
        // bind 8 parameters of type string to be placed in $sql command
        $statement->bind_param("sssssss", $name, $gender, $service, $date, $email, $mobile, $message);
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