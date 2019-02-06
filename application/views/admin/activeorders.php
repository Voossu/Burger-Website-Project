<script>
    function setCook(sel) {
        if(sel.value == ''){
            return;
        }
        $('#setCookLink').attr('href','<?=base_url('admins/setCook/')?>' + sel.value);
    }
    function setDeliver(sel) {
        if(sel.value == ''){
            return;
        }
        $('#setDeliverLink').attr('href','<?=base_url('admins/setDeliver/')?>' + sel.value);
    }
</script>

<div class="field eight wide column">
    <a href="<?=site_url('admins/')?>" class="ui primary button"><i class="arrow left icon"></i>Назад</a>
</div>

<table class="ui celled table" style="margin-bottom: 50px;">
    <thead>
    <tr>
        <th>ID</th>
        <th>Дата</th>
        <th>Цена</th>
        <th>Имя заказчика</th>
        <th>Статус</th>
        <th>Действие</th>
        <th>Инфо</th>
    </tr>
    </thead>
    <tbody>
    <?foreach ($list as $item){?>
        <tr>
            <td><?=$item['order_id']?></td>
            <td><?=$item['order_date']?></td>
            <td><?=$item['order_amount']?></td>
            <td><?=$item['order_client_name']?></td>

            <td>
                <?switch ($item['order_status']){
                    case 'added':
                        echo 'Добавлен';
                        break;
                    case 'preparing':
                        echo 'Готовится';
                        break;
                    case 'cooked':
                        echo 'Приготовлен';
                        break;
                    case 'deliver':
                        echo 'Доставляется';
                        break;
                    case 'closed':
                        echo 'Закрыт';
                        break;
                }?>
            </td>
            <td>
                <?switch ($status){
                    case 4:
                        switch ($item['order_status']){
                            case 'added':
                                echo "<select class=\"ui dropdown\" id=\"cookSelect\" onchange='setCook(this);'>";
                                    echo "<option value=\"\">Выбрать</option>";
                                foreach ($cooks as $cook){
                                    echo "<option value=\"".$item['order_id'].'/'.$cook['admin_id']."\">".$cook['admin_name']."</option>";
                                }
                                echo "</select>";
                                echo "<a href=\"#\" id='setCookLink' class=\"ui primary button\" style='margin: 10px;'><i class=\"plus icon\"></i>Назначить</a>";
                                break;

                            case 'cooked':
                                echo "<select class=\"ui dropdown\" id=\"deliverSelect\" onchange='setDeliver(this);'>";
                                    echo "<option value=\"\">Выбрать</option>";
                                foreach ($delivers as $deliver){
                                    echo "<option value=\"".$item['order_id'].'/'.$deliver['admin_id']."\">".$deliver['admin_name']."</option>";
                                }
                                echo "</select>";
                                echo "<a href=\"#\" id='setDeliverLink' class=\"ui primary button\" style='margin: 10px;'><i class=\"plus icon\"></i>Назначить</a>";
                                break;
                        }
                        break;

                    case 2:
                        echo "<a href=\"".base_url('admins/orderCooked/').$item['order_id']."\" class=\"ui primary button\"><i class=\"reply icon\"></i>Готово</a>";
                        break;

                    case 1:
                        echo "<a href=\"".base_url('admins/orderClose/').$item['order_id']."\" class=\"ui primary button\"><i class=\"checkmark box icon\"></i>Готово</a>";
                        break;
                }?>
            </td>
            <td><a href="<?=base_url('admins/orderinfo/').$item['order_id']?>" class="ui orange button"><i class="info icon"></i>Подробнее</a></td>
        </tr>
    <?}?>
    </tbody>
</table>