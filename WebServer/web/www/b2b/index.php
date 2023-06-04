<!DOCTYPE html>
<html>
<head>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            flex-direction: column;
        }

        h1 {
            color: #333;
            padding: 20px;
        }

        h3 {
            color: #666;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <h1>Nous vous souhaitons le bienvenue sur notre site "WoodyToys MMES-4" !</h1>
    <h3>Nous vous présentons notre catalogue de jouets</h3>
    <?php
        $db_host  = "172.19.0.2";
        $db_user = "woodytoys";
        $db_name = "db_woody";
        $db_pass = "MESEPHEC";

        $mysqli = new mysqli($db_host, $db_user, $db_pass, $db_name);
        // Vérifier la connexion
        if ($mysqli->connect_errno) {
            echo "Failed to connect to MySQL: " . $mysqli->connect_error;
        }

        $query = "SELECT * FROM woody";
        $result = $mysqli->query($query);

        while ($row = $result->fetch_assoc()) {
            echo $row['Name'] . ': '  . $row['Price'] . ' <br />';
        }
    ?>
</body>
</html>
