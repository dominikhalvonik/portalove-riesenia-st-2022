<?php

namespace portalove;

class DB
{
    private $host;
    private $dbName;
    private $username;
    private $password;
    private $port;

    private $connection;

    public function __construct($host, $dbName, $username, $password, $port = 3306)
    {
        $this->host = $host;
        $this->dbName = $dbName;
        $this->username = $username;
        $this->password = $password;
        $this->port = $port;

        try {
            $this->connection = new \PDO("mysql:host=$host;dbname=$dbName;port=$port", $username, $password);
            // set the PDO error mode to exception
            $this->connection->setAttribute(\PDO::ATTR_ERRMODE, \PDO::ERRMODE_EXCEPTION);
        } catch(\PDOException $e) {
            echo "Connection failed: " . $e->getMessage();
        }
    }

    public function insertMenuItem($sysName, $displayName, $path)
    {
        $dateTime = date('Y-m-d H:i:s', time());
        $sql = "INSERT INTO menu(sys_name, display_name, path, created_at, updated_at)
            VALUE ('".$sysName."', '".$displayName."', '".$path."', '".$dateTime."', '".$dateTime."')";

        try {
            $this->connection->query($sql);
            return true;
        } catch (\PDOException $e) {
            return false;
        }
    }

    public function getMenuItems()
    {
        $menuItems = [];
        $sql = "SELECT * FROM menu";

        try {
            $query = $this->connection->query($sql);
            while ($row = $query->fetch()) {
                $menuItems[] = [
                    'name' => $row['display_name'],
                    'url' => $row['path']
                ];
            }
            return  $menuItems;
        } catch (\PDOException $e) {
            return [];
        }
    }

    public function getDestinations()
    {
        $destinations = [];
        $sql = "SELECT d.display_name, d.area, d.description, dad.name, da.attribute_value 
                FROM destination AS d
                INNER JOIN destination_attribute AS da ON d.id = da.destination_id
                INNER JOIN destination_attribute_definition AS dad ON da.destination_attribute_definition_id = dad.id";

        try {
            $query = $this->connection->query($sql);
            while ($row = $query->fetch(\PDO::FETCH_ASSOC)) {
                if(isset($destinations[$row['display_name']])) {
                    $destinations[$row['display_name']]['attributes'][] = [
                        'attribute_name' => $row['name'],
                        'attribute_value' => $row['attribute_value']
                    ];
                } else {
                    $destinations[$row['display_name']] = [
                        'attributes' => [
                            'attribute_name' => $row['name'],
                            'attribute_value' => $row['attribute_value'],
                        ],
                        'area' => $row['area'],
                        'description' => $row['description']
                    ];
                }
            }
            return  $destinations;
        } catch (\PDOException $e) {
            return [];
        }
    }
}


?>