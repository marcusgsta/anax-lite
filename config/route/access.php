<?php




$app->router->add(
    "profile",
    function () use ($app) {
        $user = $app->session->get('user_name');
        $app->renderPage("Profilsida för ", "login/profile", $user);
    }
);

$app->router->add(
    "login",
    function () use ($app) {
        $app->renderPage("Login", "login/login");
    }
);

$app->router->add(
    "create_user",
    function () use ($app) {
        $app->renderPage("Create User", "login/create_user");
    }
);

$app->router->add(
    "handle_new_user",
    function () use ($app) {
        $app->renderPage("", "login/handle_new_user");
    }
);

$app->router->add(
    "validate",
    function () use ($app) {
        $app->renderPage("", "login/validate");
    }
);

$app->router->add(
    "logout",
    function () use ($app) {
        $app->renderPage("Logga ut", "login/logout");
    }
);

$app->router->add(
    "change_password",
    function () use ($app) {
        $app->renderPage("Change Password", "login/change_password");
    }
);
