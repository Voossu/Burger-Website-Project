<a href="<?= site_url('admins/activeorders') ?>" class="ui button">Активные заказы</a>
<? if ($status == 4) { ?>
    <a href="<?= site_url('admins/closedorders') ?>" class="ui button">Закрытые заказы</a>
<? } ?>
<a href="<?= site_url('admins/loginedit') ?>" class="ui button">Изменить данные входа</a>
<a href="<?= site_url('admins/logout') ?>" class="ui button">Выйти</a>