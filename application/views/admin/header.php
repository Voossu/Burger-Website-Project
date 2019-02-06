<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta http-equiv="Cache-Control" content="no-cache"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>

    <title>burgers</title>
    <script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.11.2.min.js"></script>
    <script src="<?=base_url('semantic/semantic.min.js')?>"></script>
    <link rel="stylesheet" href="<?=base_url('semantic/semantic.min.css')?>"/>
    <link href="<?=base_url('style.css')?>" rel="stylesheet"/>

    <script>
        function bodyLoad() {
            $('.ui.dropdown').dropdown();
            $('.ui.accordion').accordion();
        }
    </script>
</head>
<body onload="bodyLoad();">