<table class="ui celled table">
    <a href="/admins" class="ui primary button"><i class="arrow left icon"></i>Назад</a>
    <a href="createslider" class="ui green button"><i class="plus icon"></i>Добавить слайдер</a>
    <thead>
    <tr>
        <th>ID</th>
        <th>Товар</th>
        <th>Редактировать</th>
        <th>Удалить</th>
    </tr>
    </thead>
    <tbody>
    <?foreach ($sliders as $slider){?>
        <tr>
            <td><?=$slider['slider_id']?></td>
            <td><?=$slider['product_name']?></td>
            <td><a href="editslider/<?=$slider['slider_id']?>" class="ui orange button"><i class="pencil icon"></i>Редактировать</a></td>
            <td><a href="deleteslider/<?=$slider['slider_id']?>" class="ui red button"><i class="trash icon"></i>Удалить</a></td>
        </tr>
    <?}?>
    </tbody>
</table>