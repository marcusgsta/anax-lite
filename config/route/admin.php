<?php
$app->router->add(
    "admin",
    function () use ($app) {

        // if (!$app->admin->userIsAdmin()) {
        //     $message = "Bara administratörer har tillgång till sidan.";
        //     echo $message;
        // }


        $app->view->add("take1/header", ["title" => "Admin"]);
        $app->view->add("navbar1/navbar1");
        $app->view->add("take1/navbar");
        $app->view->add("admin/admin");
        $app->view->add("take1/footer");

        $app->response->setBody([$app->view, "render"])
                      ->send();
    }
);

$app->router->add(
    "edit",
    function () use ($app) {

        $app->view->add("take1/header", ["title" => "Admin"]);
        $app->view->add("navbar1/navbar1");
        $app->view->add("take1/navbar");
        $app->view->add("admin/edit");
        $app->view->add("take1/footer");

        $app->response->setBody([$app->view, "render"])
                      ->send();
    }
);
