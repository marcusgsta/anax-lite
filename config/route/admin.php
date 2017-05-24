<?php


$app->router->add(
    "admin/**",
    function () use ($app) {


    if (!$app->session->get('user_name')) {
        $message = "<div class='container'><p>Du måste logga in för att kunna se sidan.</p>";
        echo $message;
        header("refresh:5;url=login");
        echo '<p>You\'ll be redirected in about 5 secs. If not, click <a href="login">here</a>.</p>';
        exit;
    }

    $user_name = $app->session->get('user_name');

    if (!$app->admin->userIsAdmin($user_name)) {
        $admin_message = "<div class='container'><p>Bara administratörer har tillgång till sidan.</p>";
        echo $admin_message;
        header("refresh:5;url=login");
        echo '<p>You\'ll be redirected in about 5 secs. If not, click <a href="login">here</a>.</p>';
        exit;
    }

    }
);

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
