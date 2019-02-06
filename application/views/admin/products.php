<table class="ui celled table">
    <a href="/admin" class="ui primary button"><i class="arrow left icon"></i>Назад</a>
    <a href="categories" class="ui orange button"><i class="pencil icon"></i>Редактировать категории</a>
    <a href="parameters" class="ui orange button"><i class="pencil icon"></i>Редактировать параметры</a>
    <a href="createproduct" class="ui green button"><i class="plus icon"></i>Добавить товар</a>
    <thead>
    <tr>
        <th>ID</th>
        <th>Название</th>
        <th>Цена</th>
        <th>Дата добавления</th>
        <th>Статус наличия</th>
        <th>Редактировать</th>
        <th>Удалить</th>
        <th>Изменить статус</th>
    </tr>
    </thead>
    <tbody>
    <?foreach ($products as $product){?>
        <tr>
            <td><?=$product['product_id']?></td>
            <td><?=$product['product_name']?></td>
            <td><?=$product['product_price']?></td>
            <td><?=$product['product_created']?></td>
            <td><?=$product['product_available'] == 1 ? "Есть" : "Нет"?></td>
            <td><a href="editproduct/<?=$product['product_id']?>" class="ui orange button"><i class="pencil icon"></i>Редактировать</a></td>
            <td><a href="deleteproduct/<?=$product['product_id']?>" class="ui red button"><i class="trash icon"></i>Удалить</a></td>
            <td><a href="changeproductstatus/<?=$product['product_id']?>/<?=$product['product_available']?>" class="ui <?=$product['product_available'] == 1 ? "red" : "green"?> button"><i class="<?=$product['product_available'] == 1 ? "off" : "on"?> icon"></i>Изменить статус</a></td>
        </tr>
    <?}?>
    </tbody>
</table>