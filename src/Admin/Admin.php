<?php

namespace Mag\Admin;

class Admin
{
    // private $db;
    // public $hello = "hello";
    public $db;
    public $app;

    /**
     * Constructor
     * @param $dsn string The dsn to the database-file
     * @return void
     */
    public function __construct($app)
    {

        $this->setDatabase($app->db);
        $this->setApp($app);

        // try {
        //     $db = new PDO($dsn);
        //     $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        //     $this->db = $db;
        // } catch (PDOException $e) {
        //     echo "Failed to connect to the database using DSN:<br>$dsn<br>";
        // }

    }

    public function setApp($app)
    {
        $this->app = $app;
    }

    public function setDatabase($database)
    {
        $this->db = $database;
    }

    public function deleteAccount($id)
    {
        try {
            $this->db->execute("DELETE FROM users WHERE id='$id';");
            $message = "Användaren raderades!";
        } catch (Exception $e) {
            $message = "Caught exception: " .  $e->getMessage() . "\n";
        }

        return $message;
    }

    public function userIsAdmin($userName)
    {
        $this->db->execute("SELECT role FROM users WHERE name='$userName'");
        $res = $this->db->fetchOne();
        if ($res->role != 1) {
            return false;
        }
        return true;
    }

    /**
     * Function to create links for sorting.
     *
     * @param string $column the name of the database column to sort by
     * @param string $route  prepend this to the anchor href
     *
     * @return string with links to order by column.
     */
    public function orderby($column, $route)
    {
        return <<<EOD
<span class='orderby'>
<a href="{$route}orderby={$column}&order=asc">&darr;</a>
<a href="{$route}orderby={$column}&order=desc">&uarr;</a>
</span>
EOD;
    }

    public function addUser($name, $pass, $rePass, $role, $gravatar)
    {
        // Check if username exists
        if ($this->app->access->exists($name)) {
            echo "<div class='container'><p>Användaren existerar redan! Välj ett annat användarnamn.</p>";
            header("Refresh:2; create_user");
            return false;
        }
        // Check passwords match
        if ($pass != $rePass) {
            echo "<div class='container'><p>Lösenord matchar inte!</p>";
            header("Refresh:2; create_user");
            return false;
        }

        if ($name != "" and $role != "" and $pass != "") {
        // Make a hash of the password
            $cryptPass = password_hash($pass, PASSWORD_DEFAULT);
            $this->db->execute("INSERT into users (name, role, gravatar, pass)
                    VALUES ('$name', '$role', '$gravatar', '$cryptPass')");
            echo "<div class='container'><p>Användaren lades till!</p>";
        }
    }

    public function editUser($id, $name, $pass, $role, $gravatar)
    {
        if ($name != "") {
            $this->db->execute("UPDATE users SET name='$name' WHERE id='$id'");
        }

        if ($pass != "") {
            $cryptPass = password_hash($pass, PASSWORD_DEFAULT);
            $this->db->execute("UPDATE users SET pass='$cryptPass' WHERE id='$id'");
        }

        if ($role != "") {
            $this->db->execute("UPDATE users SET role='$role' WHERE id='$id'");
        }

        if ($gravatar != "") {
            $this->db->execute("UPDATE users SET gravatar='$gravatar' WHERE id='$id'");
        }

    }


    public function search($user)
    {
        $this->db->execute("SELECT * FROM users WHERE name LIKE '%$user%'");
        $res = $this->db->fetchAll();
        return $res;
    }

    public function showAccounts($orderby = 'name', $order = 'ASC')
    {
        $this->db->execute("SELECT id, name, gravatar, role FROM users ORDER BY $orderby $order");
        $res = $this->db->fetchAll();
        //  executeFetchAll
        return $res;
    }
}
