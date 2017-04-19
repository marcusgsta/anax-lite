<?php

namespace Mag\Navbar;

class Navbar implements
    \Anax\Common\AppInjectableInterface,
    \Anax\Common\ConfigureInterface
{
    use \Anax\Common\AppInjectableTrait;
    use \Anax\Common\ConfigureTrait;

    public function getHtml()
    {
        $items = $this->config;
        $html = "<ul>";
        // $page = basename($_SERVER['REQUEST_URI']);

        foreach ($items as $key => $value) {
            $selected = $this->app->request->getRoute() == $value ?
            "selected" : "";
            $url = $this->app->url->create($value);

            if ($value == "") {
                $value = "htdocs";
            }
            $html .= "<li class='nav1 $selected'><a href='$url'>$key</a></li>";

            // $html .= "<li class='nav1 " . ($page == $value ? 'selected' : '') . "'><a href='$url'>$key</a></li>";
        }

        $html .= "</ul>";
        return $html;
    }
}
