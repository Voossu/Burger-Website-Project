<a href="<?=site_url('admins/')?>" class="ui primary button"><i class="arrow left icon"></i>Назад</a>

<div id="add-admin-form">
    <form method="post" class="ui large form" enctype="application/x-www-form-urlencoded">
        <div class="field eight wide column">
            <label>Введите новый логин</label>
            <input placeholder="Логин" type="text" name="login" required="required" value="<?=$info['admin_login']?>"/>
        </div>
        <div class="field eight wide column">
            <label>Введите новый пароль</label>
            <input placeholder="Пароль" type="password" name="password" required="required"/>
        </div>

        <div class="field eight wide column">
            <button class="ui green button" type="submit" name="submit">Готово</button>
        </div>
        <?if($message){?>
            <div class="ui green message">Данные успешно обновлены!</div>
        <?}?>
    </form>
</div>