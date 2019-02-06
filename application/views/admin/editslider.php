<!--<script type="text/javascript">
    function changed() {
        $('#_attachmentName').val($('#attachmentName').val());
    }
</script>-->
<a href="/admin/products" class="ui primary button"><i class="arrow left icon"></i>Назад</a>
<h2>Редактировать слайдер "<?=$slider['product_name']?>"</h2>
<div id="add-admin-form">
    <form method="post" class="ui large form" enctype="multipart/form-data">

        <div class="field eight wide column">
            <label>Выберите товар</label>
            <select name="product_id" required="required" />
            <?foreach($products as $key => $product){?>
                <option value="<?=$product['product_id']?>"><?=$product['product_name']?></option>
            <?}?>
            </select>
        </div>
        <div class="field eight wide column">
            <label>Выберите изображение слайдера</label>
        <input type="file" id="attachmentName" name="productFile[]" accept="image/jpeg,image/png" required="required" multiple="multiple" />
        </div>

        <div class="field eight wide column">
            <button class="ui green button" type="submit" name="submit">Готово</button>
        </div>
    </form>
</div>