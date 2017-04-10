<?php
$urlHome  = $app->url->create("");
$urlAbout = $app->url->create("about");
$urlReport = $app->url->create("report");
$urlStatus = $app->url->create("status");

$page = basename($_SERVER['REQUEST_URI']);

?><navbar class="navbar0">
<li class="nav1 <?=($page == "htdocs" ? "selected" : "")?>"><a href="<?= $urlHome?>">Home</a></li>
<li class="nav2 <?=($page == "about" ? "selected" : "")?>"><a href="<?= $urlAbout?>">About</a></li>
<li class="nav3 <?=($page == "report" ? "selected" : "")?>"><a href="<?= $urlReport?>">Report</a></li>
</navbar>
