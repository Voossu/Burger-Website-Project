<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Welcome extends CI_Controller
{

    /**
     * Index Page for this controller.
     *
     * Maps to the following URL
     *        http://example.com/index.php/welcome
     *    - or -
     *        http://example.com/index.php/welcome/index
     *    - or -
     * Since this controller is set as the default controller in
     * config/routes.php, it's displayed at http://example.com/
     *
     * So any other public methods not prefixed with an underscore will
     * map to /index.php/welcome/<method_name>
     * @see https://codeigniter.com/user_guide/general/urls.html
     */
    public function index()
    {
        $showData['products'] = $this->db->get('products')->result_array();
        $sliders = $this->db->get('sliders')->result_array();

        foreach ($sliders as $key => $slider) {
            $sliders[$key]['product'] = $this->db->get_where('products', array('product_id' => $slider['slider_product_id']))->row_array();
        }

        $showData['sliders'] = $sliders;

        $this->load->view('welcome_message', $showData);
    }

    function addcart($id, $amount = 1)
    {
        if (isset($_COOKIE['cart']))
            $cart = json_decode($_COOKIE['cart'], true);
        else
            $cart = array();

        $updated = false;

        foreach ($cart as $key => $value) {
            if ($value['id'] == $id) {
                $cart[$key]['amount'] = $value['amount'] + $amount;
                $updated = true;
            }
        }

        if ($updated == false) {
            $item = array(
                'id' => $id,
                'amount' => $amount
            );
            array_push($cart, $item);
        }

        $cart = json_encode($cart);
        setcookie('cart', $cart, 3600000000, '/');
        setcookie('orderid', rand(0, 10000), 3600000000, '/');
        setcookie('customerid', rand(0, 10000), 3600000000, '/');

        //print_r($_COOKIE);
        echo '1';
    }

    function deletecart($id)
    {
        if (isset($_COOKIE['cart'])) {
            $cart = json_decode($_COOKIE['cart'], true);
            foreach ($cart as $key => $value) {
                if ($value['id'] == $id)
                    unset($cart[$key]);
            }
            setcookie('cart', json_encode($cart), 3600000000, '/');
            header("Location: " . base_url());
            echo 1;
        } else echo 0;
    }

    function updatecart()
    {
        $count = 0;
        $price = 0;

        if (isset($_COOKIE['cart'])) {
            $cart = json_decode($_COOKIE['cart'], true);

            foreach ($cart as $key => $item) {
                $info = $this->db->query("SELECT * FROM products WHERE product_id = ?", $item['id'])->row_array();
                $count = $count + $item['amount'];
                $price = $price + $item['amount'] * $info['product_price'];
            }
        }

        echo '
	    	<p class="name">ИТОГО</p>
	    	<p class="count">' . $count . '</p>
	    	<p class="sum">' . $price . ' Р</p>
	    	<a href="#" class="submit-form">готово</a>';
    }

    function countcart()
    {
        if (isset($_COOKIE['cart'])) {
            $cart = json_decode($_COOKIE['cart'], true);
            echo count($cart);
        } else {
            echo 0;
        }

    }

    function updatecartitems()
    {
        $text = '';
        if (isset($_COOKIE['cart'])) {
            $cart = json_decode($_COOKIE['cart'], true);
            $text = "";

            foreach ($cart as $key => $item) {
                $info = $this->db->query("SELECT * FROM products WHERE product_id = ?", $item['id'])->row_array();
                $text .= '
	            <div class="block-total">
	                <div class="wrapper">
	                    <div class="item-total first">
	                        <p class="name">' . $info['product_name'] . '</p>
	                        <p class="count">
	                            < ' . $item['amount'] . ' >
	                        </p>
	                        <p class="sum">' . $info['product_price'] * $item['amount'] . ' Р </p>
	                        <a href="' . base_url() . 'welcome/deletecart/' . $item['id'] . '"> x</a>
	                    </div>
	                </div>
	            </div>
    			';
            }
        } else {
            $text .= '
                <div class="block-total">
                    <div class="wrapper">
                        <div class="item-total first">
                            <p class="name"></p>
                            <p class="count">
                            </p>
                            <p class="sum"></p>
                            <a href="' . base_url() . 'welcome/deletecart/"></a>
                        </div>
                    </div>
                </div>
                ';

        }

        echo $text;
    }

    function buy1($name, $email, $phone, $address, $delivery, $comment = "")
    {
        if (isset($_COOKIE['cart'])) {
            $cart = json_decode($_COOKIE['cart'], true);
            $price = 0;

            foreach ($cart as $key => $item) {
                $info = $this->db->query("SELECT * FROM products WHERE product_id = ?", $item['id'])->row_array();
                $price = $price + $item['amount'] * $info['product_price'];
            }

            $this->db->query("INSERT INTO orders(order_id, order_amount, order_description, order_customer_name, order_customer_email, order_customer_address, order_customer_delivery, order_customer_phone, order_comment, customer_id) VALUES(?,?,?,?,?,?,?,?,?,?)", $_COOKIE['orderid'], urldecode($price), $_COOKIE['cart'], urldecode($name), urldecode($email), urldecode($address), urldecode($delivery), urldecode($phone), urldecode($comment), $_COOKIE['customerid']);

            $to = $email;

            /* тема/subject */
            $subject = "Спасибо за покупку!";

            /* сообщение */
            $message = 'Вы оформили покупку на сайте woodshield.ru, суммарной стоимостью ' . $price . '.руб.<br> Номер заказа ' . $_COOKIE['orderid'] . '<br> Спасибо  за покупку наш менеджер скоро свяжется с Вами для уточнения подробней заказа.';

            /* Для отправки HTML-почты вы можете установить шапку Content-type. */
            $headers = "MIME-Version: 1.0\r\n";
            $headers .= "Content-Type: text/html; charset=\"utf-8\"\r\n";

            /* дополнительные шапки */
            $headers .= "From:<info@woodshield.ru>\r\n";

            /* и теперь отправим из */
            mail($to, $subject, $message, $headers);

            setcookie('cart', '');
            setcookie('orderid', rand(0, 10000), 3600000000, '/');
            setcookie('customerid', rand(0, 10000), 3600000000, '/');

            echo 1;

        }
    }

    function thank()
    {
        $this->load->view('thank');
    }

    function checkemail($email)
    {
        $check = $this->db->get_where('users', array('user_email' => $email))->row_array();
        if (count($check) > 0) {
            echo 0;
        } else echo 1;
    }

    function checkemailpass($email, $pass)
    {
        $check = $this->db->get_where('users', array('user_email' => $email, 'user_password' => md5($pass)))->row_array();
        if (count($check) > 0) {
            echo 1;
        } else echo 0;
    }

    function buy()
    {
        if (isset($_COOKIE['cart'])) {

            $cart = json_decode($_COOKIE['cart'], true);
            $price = 0;


            if (isset($_POST['retype'])) {
                $address = array(
                    'city' => $_POST['city'],
                    'street' => $_POST['street'],
                    'house' => $_POST['house'],
                    'entrance' => $_POST['entrance'],
                    'floor' => $_POST['floor'],
                    'flat' => $_POST['flat'],
                    'comment' => $_POST['comment']
                );
                $address_json = json_encode($address);
                $sql_array = array(
                    'user_name' => $_POST['name'],
                    'user_email' => $_POST['email'],
                    'user_phone' => $_POST['phone'],
                    'user_password' => md5($_POST['pass']),
                    'user_address' => $address_json
                );
                $this->db->insert('users', $sql_array);
            }

            $client = $this->db->get_where('users', array('user_email' => $_POST['email'], 'user_password' => md5($_POST['pass'])))->row_array();

            $order = array();

            foreach ($cart as $key => $item) {
                $info = $this->db->query("SELECT * FROM products WHERE product_id = ?", $item['id'])->row_array();
                $buffer['name'] = $info['product_name'];
                $buffer['count'] = $item['amount'];
                array_push($order, $buffer);
                $price += $item['amount'] * $info['product_price'];
            }

            $this->db->insert('orders', array(
                    'order_client_id' => $client['user_id'],
                    'order_amount' => $price,
                    'order_address' => $client['user_address'],
                    'order_list' => json_encode($order)
                )
            );
        }

        $this->load->view('thank');

        //print_r($order);

    }

}
