<!DOCTYPE html>
<html>
<head>
</head>

<body>
    <h1>Nous vous souhaitons le bienvenue sur notre site " WoodyToys MMES-4 !</h1>
    <?php
        echo "<h3> Nous vous presentons notre catalogue de jouet </h3>";
    ?>
    <?php
        $db_host  = "127.0.0.1";
        $db_user = "WoodyToys";
        $db_name = "db_woody";
        $db_pass = "MESEPHEC";

        $mysqli = new mysqli($db_host, $db_user, $db_pass, $db_name);
        if (mysqli_connect_errno()){
                echo "Failed to connect to MySQL: " . mysqli_connect_error();
        }
        if ($mysqli -> connect_error) {
        echo "Refused to connect to MySQL: " . $mysqli -> connect_error;
        exit();
        }
        $query = "SELECT * FROM woody;";
        $result = mysqli_query($mysqli, $query);

        while ($row = mysqli_fetch_array($result)) {
            echo $row['Name'] . ': '  . $row['Price'] . ' <br />';
        }
    ?>

</body>
</html>