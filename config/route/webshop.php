<?php
$app->router->add(
    "webshop",
    function () use ($app) {

        $sql = "SELECT * FROM VProduct;";
        $result = $app->db->executeFetchAll($sql);

        $app->renderWebShopPage("Visa alla varor", "webshop/show-all", $result);
    }
);

$app->router->add(
    "webshop/create",
    function () use ($app) {

        $app->renderWebShopPage("Skapa produkt", "webshop/create");
    }
);

$app->router->add(
    "webshop/edit",
    function () use ($app) {
        $title = "Redigera produkt";
        $view = "webshop/edit";
        $contentId = getGet("id");

        $sql = "SELECT * FROM Product WHERE id = ?;";
        $result = $app->db->executeFetch($sql, [$contentId]);

        $app->renderWebShopPage($title, $view, $result);
    }
);

$app->router->add(
    "webshop/delete",
    function () use ($app) {
        $title = "Radera produkt";
        $view = "webshop/delete";
        $productId = getGet("id");
        if (!is_numeric($productId)) {
            die("Not valid for product id.");
        }

        if (hasKeyPost("doDelete")) {
            $productId = getPost("productId");

            // Delete connection in table Prod2Cat
            $sql = "DELETE FROM Prod2Cat WHERE prod_id=$productId";
            $app->db->execute($sql);

            // Delete connection in table Inventory
            $sql = "DELETE FROM Inventory WHERE prod_id=$productId";
            $app->db->execute($sql);

            $sql = "DELETE FROM Product WHERE id=?;";
            $app->db->execute($sql, [$productId]);
            header("Location: ../webshop");
            exit;
        }
        $sql = "SELECT id, description FROM Product WHERE id = ?; ";
        $product = $app->db->executeFetch($sql, [$productId]);

        $app->renderWebShopPage($title, $view, $product);
    }
);

$app->router->add(
    "webshop/categories",
    function () use ($app) {

        $app->renderWebShopPage("Skapa kategori", "webshop/categories");
    }
);
