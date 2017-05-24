<?php
$app->router->add(
    "",
    function () use ($app) {

        $app->renderPage("Home", "take1/home");

    }
);

$app->router->add(
    "about",
    function () use ($app) {

        $app->renderPage("About", "take1/about");

    }
);

$app->router->add(
    "report",
    function () use ($app) {

        $app->renderPage("Report", "take1/report");

    }
);



$app->router->add(
    "status",
    function () use ($app) {
        $data = [
            "Server" => php_uname(),
            "PHP Version" => phpversion(),
            "Included files" => count(get_included_files()),
            "Memory used" => memory_get_peak_usage(true),
            "Execution time" => microtime(true) - $_SERVER['REQUEST_TIME_FLOAT'],
        ];
        $app->response->sendJson($data);
    }
);
