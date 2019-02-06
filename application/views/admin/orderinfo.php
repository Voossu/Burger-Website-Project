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
    <a href="<?=site_url('admins/activeorders')?>" class="ui primary button"><i class="arrow left icon"></i>Назад</a>
</div>

<table class="ui celled table" style="margin-bottom: 50px;">
    <thead>
    <tr>
        <th width="25%">Поле</th>
        <th>Значение</th>
    </tr>
    </thead>
    <tbody>
        <tr>
            <td>ID</td>
            <td><?=$item['order_id']?></td>
        </tr>
        <tr>
            <td>Дата</td>
            <td><?=$item['order_date']?></td>
        </tr>
        <tr>
            <td>Цена</td>
            <td><?=$item['order_amount']?></td>
        </tr>
        <tr>
            <td>Имя заказчика</td>
            <td><?=$client['user_name']?></td>
        </tr>
        <tr>
            <td>Список</td>
            <td>
                <?foreach ($item['order_list'] as $value){?>
                    <?=$value['name'].'x'.$value['count'].'<br>'?>
                <?}?>
            </td>
        </tr>
        <tr>
            <td>Адрес</td>
            <td>
                <?='Город: '.$item['order_address']['city'].', улица: '.$item['order_address']['street'].', дом: '.$item['order_address']['house']?>
                <?=', подъезд: '.$item['order_address']['entrance'].', этаж: '.$item['order_address']['floor'].', кв.: '.$item['order_address']['flat']?>
                <?=', домофон: '.$item['order_address']['intercom'].'<br>Комментарий: '.$item['order_address']['comment']?>
            </td>
        </tr>
        <tr>
            <td>Статус</td>
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
        </tr>
        <tr>
            <td>Действие</td>
            <td>
                <?switch ($status){
                    case 4:
                        switch ($item['order_status']){
                            case 'added':
                                echo "<select class='ui dropdown' id='cookSelect' onchange='setCook(this);'>";
                                echo "<option value=''>Выбрать</option>";
                                foreach ($cooks as $cook){
                                    echo "<option value='".$item['order_id'].'/'.$cook['admin_id']."/1"."'>".$cook['admin_name']."</option>";
                                }
                                echo "</select>";
                                echo "<a href='#' id='setCookLink' class='ui primary button' style='margin: 10px;'><i class='plus icon'></i>Назначить</a>";
                                break;

                            case 'cooked':
                                echo "<select class='ui dropdown' id='deliverSelect' onchange='setDeliver(this);'>";
                                echo "<option value=''>Выбрать</option>";
                                foreach ($delivers as $deliver){
                                    echo "<option value='".$item['order_id'].'/'.$deliver['admin_id']."/1"."'>".$deliver['admin_name']."</option>";
                                }
                                echo "</select>";
                                echo "<a href='#' id='setDeliverLink' class='ui primary button' style='margin: 10px;'><i class='plus icon'></i>Назначить</a>";
                                break;
                        }
                        break;

                    case 2:
                        if($item['order_status'] == 'preparing')
                            echo "<a href='".base_url('admins/orderCooked/').$item['order_id']."/1"."' class='ui primary button'><i class='reply icon'></i>Готово</a>";
                        break;

                    case 1:
                        if($item['order_status'] == 'deliver')
                        echo "<a href='".base_url('admins/orderClose/').$item['order_id']."/1"."' class='ui primary button'><i class='checkmark box icon'></i>Готово</a>";
                        break;
                }?>
            </td>
        </tr>
    </tbody>
</table>