<?php

namespace Mag\App;

/**
* An App class to wrap the resources of the framework.
*/
class App
{

    public function renderPage($title, $page, $data = null)
    {
        $this->view->add("take1/header", ["title" => $title]);
        $this->view->add("navbar1/navbar1");
        $this->view->add("take1/navbar");
        // $this->view->add($page, ["user" => $data]);
        $this->view->add($page, ["data" => $data]);

        $this->view->add("take1/footer");

        $this->response->setBody([$this->view, "render"])
                      ->send();
    }

    public function renderContentPage($title, $page, $data = null)
    {
        $this->view->add("content/header", ["title" => $title]);
        $this->view->add("content/navbar");
        // $this->view->add("take1/navbar");
        // $this->view->add($page, ["user" => $data]);
        $this->view->add($page, ["data" => $data]);
        $this->view->add("take1/footer");

        $this->response->setBody([$this->view, "render"])
                      ->send();
    }
}
