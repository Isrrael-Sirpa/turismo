<?php
use App\Controllers\PaqueteController;

$app->router->add('GET', '/home', function () {
    require_once __DIR__ . '/../app/views/home.php';
});

$app->router->add('GET', '/view/contactos', function () {
    require_once __DIR__ . '/../app/views/Menu/Contactos.php';
});

$app->router->add('GET', '/view/acercaDe', function () {
    require_once __DIR__ . '/../app/views/Menu/AcercaDe.php';
});

$app->router->add('GET', '/view/paquetes', function () {
    require_once __DIR__ . '/../app/views/Menu/Paquetes.php';
});

$app->router->add('GET', '/view/paquetes/obtener', function () {
    $controller = new PaqueteController();
    $controller->obtener_paquetes();
});

$app->router->add('POST', '/view/paquetes/detalle', function ($id) {
    $controller = new PaqueteController();
    $controller->obtenerInfoPaquete($id);
});
$app->router->add('POST', '/paquetes/comprar', function ($data) {
    $controller = new PaqueteController();
    $controller->comprarPaquete($data);
});