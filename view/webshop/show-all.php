<div class="container show-all">

<h1>Visa alla varor</h1>

<?php
if (!$data) {
    return;
}

$result = $data;
// var_dump($result);
?>

<table>
    <tr class="first">
        <th>Rad</th>
        <th>Id</th>
        <th>Beskrivning</th>
        <th>Bild</th>
        <th>Kategori</th>
        <th>Pris</th>
        <th>På lager</th>
        <!-- <th>Path</th>
        <th>Published</th>
        <th>Created</th>
        <th>Updated</th>
        <th>Deleted</th>
        <th>Actions</th> -->
    </tr>
<?php $id = -1; foreach ($result as $row) :
    $id++;
?>
    <tr>
        <td><?= $id ?></td>
        <td><?= $row->id ?></td>
        <td><?= $row->description ?></td>
        <td><img src="image/webshop/<?= $row->image?>?w=150" class="productImage" title="Image of <?= $row->description ?>"</td>
        <td><?= $row->category ?></td>
        <td><?= $row->price ?></td>
        <td><?= $row->items ?></td>
        <td><a href="webshop/edit?id=<?=$row->id?>"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a><a href="webshop/delete?id=<?=$row->id?>"><i class="fa fa-trash-o" aria-hidden="true"></i></a></td>
    </tr>

<?php endforeach; ?>
</table>
