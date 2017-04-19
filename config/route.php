<?php

/**
 * Routes.
 */
 // Create the router
$app->router = new \Anax\Route\RouterInjectable();

require __DIR__ . "/route/internal.php";
require __DIR__ . "/route/base.php";
require __DIR__ . "/route/session.php";
