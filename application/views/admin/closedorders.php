<div class="field eight wide column">
    <a href="<?=site_url('admins/')?>" class="ui primary button"><i class="arrow left icon"></i>Назад</a>
</div>

<div class="field eight wide column" style="margin-top: 15px;">
    <?if($curPage != 0){?>
        <a href="<?= site_url('admins/closedorders/'.($curPage - 1)) ?>" class="ui orange button"><i class="arrow left icon"></i>Пред. страница</a>
    <?}?>
    <?if($curPage < $maxPages - 1){?>
        <a href="<?=site_url('admins/closedorders/'.($curPage + 1))?>" class="ui orange button">След. страница<i class="arrow right icon"></i></a>
    <?}?>
</div>
<table class="ui celled table" style="margin-bottom: 50px;">
    <thead>
    <tr>
        <th>ID</th>
        <th>Дата</th>
        <th>Цена</th>
        <th>Статус</th>
    </tr>
    </thead>
    <tbody>
    <?foreach ($list as $item){?>
        <tr>
            <td><?=$item['order_id']?></td>
            <td><?=$item['order_date']?></td>
            <td><?=$item['order_amount']?></td>
            <td><?=$item['order_status'] == 'closed' ? 'Закрыт' : '' ?></td>
        </tr>
    <?}?>
    </tbody>
</table>