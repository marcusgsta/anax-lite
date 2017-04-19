<?php
$app->router->add(
    "session",
    function () use ($app) {
        $app->view->add("take1/header", ["title" => "Test av session"]);
        $app->view->add("navbar1/navbar1");
        $app->view->add("take1/navbar");
        $app->view->add("session/session");
        $app->view->add("take1/footer");

        $app->response->setBody([$app->view, "render"])
                      ->send();
    }
);

$app->router->add(
    "session/increment",
    function () use ($app) {
        // Get $key number from session and increment by one
        $number = $app->session->get('number');
        $number = $number + 1;
        $app->session->set('number', $number);
        header("Location: ../session"); /* Redirect browser */
        exit();
    }
);


$app->router->add(
    "session/decrement",
    function () use ($app) {
        // Get $key number from session and increment by one
        $number = $app->session->get('number');
        $number = $number - 1;
        $app->session->set('number', $number);
        header("Location: ../session"); /* Redirect browser */
        exit();
    }
);

$app->router->add(
    "session/status",
    function () use ($app) {
        $data = [
            "session_name" => session_name(),
            "session_id" => session_id(),
            "session_status" => session_status()
        ];
        $app->response->sendJson($data);
    }
);

$app->router->add(
    "session/dump",
    function () use ($app) {
        $app->session->dump();
    }
);

$app->router->add(
    "session/destroy",
    function () use ($app) {
        $app->session->destroy();
        header("Location: dump"); /* Redirect browser */
        exit();
    }
);
