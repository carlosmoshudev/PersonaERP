<?php
    sendCorsHeaders();

    include '../db-connector.php';

    $method = $_SERVER['REQUEST_METHOD'];

    switch ($method) {
        case 'GET':
            fetchPeople($pdo);
            break;
        
        default:
            http_response_code(405);
            echo json_encode(array('message' => 'Método no soportado'));
            break;
    }

    function sendCorsHeaders() {
        header("Access-Control-Allow-Headers: Content-Type");
        header('Content-Type: application/json');
        header("Access-Control-Allow-Methods: GET, OPTIONS");
    }

    function fetchPeople($pdo) {
        $params = [];
        $whereString = 'WHERE 1=1';

        if(isset($_GET['name'])) {
            $whereString .= ' AND name LIKE :name';
            $params[':name'] = '%' . $_GET['name'] . '%';
        }

        try {
            $stmt = $pdo->prepare('SELECT * FROM Contacts__People ' . $whereString);
            $stmt->execute($params);
            echo json_encode($stmt->fetchAll());
        } catch (\PDOException $e) {
            http_response_code(500);
            echo json_encode(array('message' => $e->getMessage()));
        }
    }
?>
