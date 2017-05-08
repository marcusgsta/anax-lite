<?php




$app->router->add(
    "profile",
    function () use ($app) {

        $user = $app->session->get('user_name');

        $app->view->add("take1/header", ["title" => "Profilsida för "]);
        $app->view->add("navbar1/navbar1");
        $app->view->add("take1/navbar");
        $app->view->add("login/profile", ["user" => $user]);
        $app->view->add("take1/footer");

        $app->response->setBody([$app->view, "render"])
                      ->send();
    }
);

$app->router->add(
    "login",
    function () use ($app) {

        $app->view->add("take1/header", ["title" => "Login"]);
        $app->view->add("navbar1/navbar1");
        $app->view->add("take1/navbar");
        $app->view->add("login/login");
        $app->view->add("take1/footer");

        $app->response->setBody([$app->view, "render"])
                      ->send();
    }
);

$app->router->add(
    "create_user",
    function () use ($app) {
        $app->view->add("take1/header", ["title" => "Create User"]);
        $app->view->add("navbar1/navbar1");
        $app->view->add("take1/navbar");
        $app->view->add("login/create_user");
        $app->view->add("take1/footer");

        $app->response->setBody([$app->view, "render"])
                      ->send();
    }
);

$app->router->add(
    "handle_new_user",
    function () use ($app) {

        $app->view->add("take1/header", ["title" => ""]);
        $app->view->add("navbar1/navbar1");
        $app->view->add("take1/navbar");
        $app->view->add("login/handle_new_user");
        $app->view->add("take1/footer");

        $app->response->setBody([$app->view, "render"])
                      ->send();

    }
);

$app->router->add(
    "validate",
    function () use ($app) {

        $app->view->add("take1/header", ["title" => ""]);
        $app->view->add("navbar1/navbar1");
        $app->view->add("take1/navbar");
        $app->view->add("login/validate");
        $app->view->add("take1/footer");

        $app->response->setBody([$app->view, "render"])
                      ->send();
    }
);

$app->router->add(
    "logout",
    function () use ($app) {

        $app->view->add("take1/header", ["title" => "Logga ut"]);
        $app->view->add("navbar1/navbar1");
        $app->view->add("take1/navbar");
        $app->view->add("login/logout");
        $app->view->add("take1/footer");

        $app->response->setBody([$app->view, "render"])
                      ->send();
    }
);

$app->router->add(
    "change_password",
    function () use ($app) {

        $app->view->add("take1/header", ["title" => "Change Password"]);
        $app->view->add("navbar1/navbar1");
        $app->view->add("take1/navbar");
        $app->view->add("login/change_password");
        $app->view->add("take1/footer");

        $app->response->setBody([$app->view, "render"])
                      ->send();
    }
);
