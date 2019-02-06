<div id="login">
    <h1>Привет, админ!</h1>
    <h2>Вход</h2>
    <? if ($loginError) { ?>
        <div class="ui negative message">
            <i class="close icon"></i>
            <div class="header">
                Неверный email или пароль.
            </div>
            <p id="errMess">
                Проверьте правильность ввода и попробуйте ещё раз.
            </p>
        </div>
    <? } ?>
    <form method="post" class="ui large form">
        <div class="field">
            <label>Login</label>
            <input placeholder="Login" type="text" name="login" id="email" required="required"/>
        </div>
        <div class="field">
            <label>Password</label>
            <input placeholder="Password" type="password" name="password" id="pass" required="required"/>
        </div>
        <button class="ui fluid primary button" id="submit">OK</button>
    </form>
</div>