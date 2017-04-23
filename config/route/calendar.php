<?php
$app->router->add(
    "calendar",
    function () use ($app) {

        $app->calendar->getMonth();

        if (isset($_GET['month'])) {
            $currentMonth = $_GET['month'];
            $title = $app->calendar->setTitle($currentMonth);
        } else {
            $currentMonth = $app->calendar->setCurrentMonth();
            $title = $app->calendar->getTitle();
        }

        $currentMonth = $currentMonth - 1;
        $app->calendar->month = $app->calendar->nrOfDays[$currentMonth];
        $app->view->add("take1/header", ["title" => "Calendar 2017"]);
        $app->view->add("navbar1/navbar1");
        $app->view->add("take1/navbar");



        $app->view->add("calendar/calendar");
        $app->view->add("take1/footer");

        $app->response->setBody([$app->view, "render"])
                      ->send();
    }
);
