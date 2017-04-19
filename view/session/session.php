<?php

if ($app->session->has("number")) {
    $value = $app->session->get("number");
};

?>
<div class="container">
    <h1>Test the session – choose route</h1>
    <h2>Current value: <?=(isset($value)) ? $value : "None";?></h2>
<ul>
<li><a href="session/increment">Increment</a></li>
<li><a href="session/decrement">Decrement</a></li>
<li><a href="session/status">Status</a></li>
<li><a href="session/dump">Dump</a></li>
<li><a href="session/destroy">Destroy</a></li>
</ul>
