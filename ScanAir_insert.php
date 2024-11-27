<?php

include 'conexion.php';

if ($_GET) {
    try {    
        // Insert data into Alcohol
        if ($_GET['table'] == 'alcohol') {
            // Obtener los datos
            $ppm = $_GET['ppm'];
            $idSensor = $_GET['idSensor'];

            // Construir query
            $sql_agregar = 'INSERT INTO Alcohol (ppm, idSensor) VALUES (?, ?)';
            $agregar = $pdo->prepare($sql_agregar);

            // Ejecutar Query
            $resultado = $agregar->execute(array($ppm, $idSensor));
            if ($resultado == true) {
                $agregar = null;
                $pdo = null;
                echo 'Datos guardados correctamente en la tabla Alcohol';
            } else {
                echo 'Error al insertar en Alcohol: ' . $resultado;
            }
        }
    
        // Insert data into CO
        if ($_GET['table'] == 'co') {
            // Obtener los datos
            $ppm = $_GET['ppm'];
            $idSensor = $_GET['idSensor'];

            // Construir query
            $sql_agregar = 'INSERT INTO CO (ppm, idSensor) VALUES (?, ?)';
            $agregar = $pdo->prepare($sql_agregar);

            // Ejecutar Query
            $resultado = $agregar->execute(array($ppm, $idSensor));
            if ($resultado == true) {
                $agregar = null;
                $pdo = null;
                echo 'Datos guardados correctamente en la tabla CO';
            } else {
                echo 'Error al insertar en CO: ' . $resultado;
            }
        }
    
        // Insert data into CO2
        if ($_GET['table'] == 'co2') {
            // Obtener los datos
            $ppm = $_GET['ppm'];
            $idSensor = $_GET['idSensor'];

            // Construir query
            $sql_agregar = 'INSERT INTO CO2 (ppm, idSensor) VALUES (?, ?)';
            $agregar = $pdo->prepare($sql_agregar);

            // Ejecutar Query
            $resultado = $agregar->execute(array($ppm, $idSensor));
            if ($resultado == true) {
                $agregar = null;
                $pdo = null;
                echo 'Datos guardados correctamente en la tabla CO2';
            } else {
                echo 'Error al insertar en CO2: ' . $resultado;
            }
        }
    
        // Insert data into Humedad
        if ($_GET['table'] == 'humedad') {
            // Obtener los datos
            $porcentaje = $_GET['porcentaje'];
            $idSensor = $_GET['idSensor'];

            // Construir query
            $sql_agregar = 'INSERT INTO Humedad (porcentaje, idSensor) VALUES (?, ?)';
            $agregar = $pdo->prepare($sql_agregar);

            // Ejecutar Query
            $resultado = $agregar->execute(array($porcentaje, $idSensor));
            if ($resultado == true) {
                $agregar = null;
                $pdo = null;
                echo 'Datos guardados correctamente en la tabla Humedad';
            } else {
                echo 'Error al insertar en Humedad: ' . $resultado;
            }
        }
    
        // Insert data into Temperatura
        if ($_GET['table'] == 'temperatura') {
            // Obtener los datos
            $grados = $_GET['grados'];
            $idSensor = $_GET['idSensor'];

            // Construir query
            $sql_agregar = 'INSERT INTO Temperatura (grados, idSensor) VALUES (?, ?)';
            $agregar = $pdo->prepare($sql_agregar);

            // Ejecutar Query
            $resultado = $agregar->execute(array($grados, $idSensor));
            if ($resultado == true) {
                $agregar = null;
                $pdo = null;
                echo 'Datos guardados correctamente en la tabla Temperatura';
            } else {
                echo 'Error al insertar en Temperatura: ' . $resultado;
            }
        }
    
    } catch (Exception $e) {
        print($e->getMessage());
        die();
    }
} else {
    echo 'No hay método GET con los parámetros necesarios';
}

?>