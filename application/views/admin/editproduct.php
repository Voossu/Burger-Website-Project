<!--<script type="text/javascript">
    function changed() {
        $('#_attachmentName').val($('#attachmentName').val());
    }
</script>-->
<a href="/admin/products" class="ui primary button"><i class="arrow left icon"></i>Назад</a>
<h2>Редактировать товар "<?=$editEntry['product_name']?>"</h2>
<div id="add-admin-form">
    <form method="post" class="ui large form" enctype="multipart/form-data">
        <div class="field eight wide column">
            <label>Введите имя </label>
            <input placeholder="Товар" type="text" name="name" required="required" value="<?=$editEntry['product_name']?>"/>
        </div>
        <div class="field eight wide column">
            <label>Введите краткое описание </label>
            <input placeholder="Товар" type="text" name="info" required="required" value="<?=$editEntry['product_info']?>"/>
        </div>
        <div class="field eight wide column">
            <label>Введите состав</label>
            <input placeholder="Описание" type="text" name="description" required="required" value="<?=$editEntry['product_description']?>"/>
        </div>
        <div class="field eight wide column">
            <label>Введите цену товара</label>
            <input placeholder="Цена" type="text" name="price" required="required" value="<?=$editEntry['product_price']?>"/>
        </div>

        <div class="field eight wide column">
            <label>Наличие</label>
            <select name="available" required="required" />
            <option value="1" <?=$editEntry['product_available'] == 1 ? "selected" : ""?>>Есть</option>
            <option value="0" <?=$editEntry['product_available'] == 0 ? "selected" : ""?>>Нет</option>
            </select>
        </div>

        <!--<div class="field eight wide column">
            <div class="ui action input">
                <input type="text" id="_attachmentName">
                <label for="attachmentName" class="ui icon large button btn-file">
                    <i class="file icon"></i>
                    <input type="file" id="attachmentName" name="productFile"  onchange="changed();" style="display: none" accept="image/jpeg,image/png" />
                </label>
            </div>
        </div>-->
        <input type="file" id="attachmentName" name="productFile[]" accept="image/jpeg,image/png" multiple="multiple" />

        <div class="field eight wide column">
            <button class="ui green button" type="submit" name="submit">Готово</button>
        </div>
    </form>
</div>