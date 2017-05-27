<div class="container show-all">


<h1>Visa allt innehåll</h1>

<?php
if (!$data) {
    return;
}

$resultset = $data;
// var_dump($resultset);
?>

<table>
    <tr class="first">
        <th>Rad</th>
        <th>Id</th>
        <th>Title</th>
        <th>Type</th>
        <th>Slug</th>
        <th>Path</th>
        <th>Published</th>
        <th>Created</th>
        <th>Updated</th>
        <th>Deleted</th>
        <th>Actions</th>
    </tr>
<?php $id = -1; foreach ($resultset as $row) :
    $id++;
?>
    <tr>
        <td><?= $id ?></td>
        <td><?= $row->id ?></td>
        <td><?= $row->title ?></td>
        <td><?= $row->type ?></td>
        <td><?= $row->slug ?></td>
        <td><?= $row->path ?></td>
        <td><?= $row->published ?></td>
        <td><?= $row->created ?></td>
        <td><?= $row->updated ?></td>
        <td><?= $row->deleted ?></td>
        <td><a href="content/edit?id=<?=$row->id?>"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a><a href="content/delete?id=<?=$row->id?>"><i class="fa fa-trash-o" aria-hidden="true"></i></a></td>
    </tr>

<?php endforeach; ?>
</table>
