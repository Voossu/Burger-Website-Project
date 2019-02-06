<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Admins extends CI_Controller {
    /*base*/
    function _show($page, $data = null){
        $this->load->view('admin/header.php');

        if($data == null) {
            $this->load->view('admin/' . $page . '.php');
        } else {
            $this->load->view('admin/' . $page . '.php', $data);
        }

        $this->load->view('admin/footer.php');
    }
    function _check(){
        if (!empty($_COOKIE['admintoken'])) {
            $this->db->where('admin_token', $_COOKIE['admintoken']);
            $query = $this->db->get('admins');
            $cnt = $query->num_rows();
            if($cnt != 1){
                redirect("admins/login");
            } else{
                $res = $query->row_array();
                return $res['admin_id'];
            }
        } else {
            redirect("admins/login");
        }
    }

    function checkdir(){
        echo 'Document root: '.$_SERVER['DOCUMENT_ROOT'].'<br>';
        echo 'Полный путь к скрипту и его имя: '.$_SERVER['SCRIPT_FILENAME'].'<br>';
        echo 'Имя скрипта: '.$_SERVER['SCRIPT_NAME'];
    }
    function _getstatus(){
        $this->db->where('admin_token', $_COOKIE['admintoken']);
        $query = $this->db->get('admins');
        $row = $query->row_array();
        return $row['admin_status'];
    }
    function login(){
        $showData = array('loginError' => false);
        if (!empty($_POST)) {
            if (!empty($_POST['login']) && !empty($_POST['password'])) {
                $pass = md5($_POST['password']);
                $this->db->where('admin_login', $_POST['login']);
                $this->db->where('admin_password', $pass);
                $query = $this->db->get('admins');
                $cnt = $query->num_rows();
                if ($cnt == 1) {
                    $token = md5(rand(0, 1000) * time());
                    $d = array('admin_token' => $token);
                    $this->db->where('admin_login', $_POST['login']);
                    $this->db->update('admins', $d);
                    setcookie("admintoken", $token);
                    redirect("admins/");
                } else {
                    $showData['loginError'] = true;
                }
            }
        }
        $this->_show('login', $showData);
    }
    function loginedit(){
        $this->_check();
        $showData = array('message' => false);
        if(isset($_POST['submit'])){
            $ud = array(
                'admin_login' => $_POST['login'],
                'admin_password' => md5($_POST['password'])
            );
            $this->db->where('admin_token',$_COOKIE['admintoken']);
            $this->db->update('admins', $ud);
            $showData['message'] = true;
        }
        $this->db->where('admin_token', $_COOKIE['admintoken']);
        $query = $this->db->get('admins');
        $showData['info'] = $query->row_array();
        $this->_show('loginedit', $showData);
    }
    function logout(){
        setcookie("admintoken", "");
        redirect("admins/");
    }
    function index(){
        $this->_check();
        $status = $this->_getstatus();
        $data = array('status' => $status);
        $this->_show('index', $data);
    }
    /*main*/
    function closedorders($page = 0){
        $this->_check();
        $showData = array();
        $offset = $page * 20;

        $this->db->where('order_status', 'closed');
        $this->db->order_by('order_date', 'desc');
        $this->db->limit(20, $offset);
        $query = $this->db->get('orders');
        $cnt = $this->db->count_all_results('orders');
        $showData['list'] = $query->result_array();
        $showData['maxPages'] = ceil($cnt / 20.0);
        $showData['curPage'] = $page;
        $this->_show('closedorders', $showData);
    }
    function activeorders(){
        $id = $this->_check();
        $showData = array();
        $showData['status'] = $this->_getstatus();

        switch ($showData['status']){
            case '1':
                $this->db->select('deliver_order_id');
                $this->db->where('deliver_user_id', $id);
                $q = $this->db->get('delivers');
                $r = $q->result_array();
                $ids = array();
                foreach ($r as $item){
                    $ids[] = $item['deliver_order_id'];
                }
                if(count($ids) == 0)
                    $ids[] = 0;
                $this->db->where('order_status', 'deliver');
                $this->db->where_in('order_id', $ids);
                $q = $this->db->get('orders');
                $r = $q->result_array();
                $showData['list'] = $r;
                break;

            case '2':
                $this->db->select('cook_order_id');
                $this->db->where('cook_user_id', $id);
                $q = $this->db->get('cooks');
                $r = $q->result_array();
                $ids = array();
                foreach ($r as $item){
                    $ids[] = $item['cook_order_id'];
                }
                if(count($ids) == 0)
                    $ids[] = 0;
                $this->db->where('order_status', 'preparing');
                $this->db->where_in('order_id', $ids);
                $q = $this->db->get('orders');
                $r = $q->result_array();
                $showData['list'] = $r;
                break;

            case '4':
                $this->db->where('order_status !=', 'closed');
                $q = $this->db->get('orders');
                $r = $q->result_array();
                $showData['list'] = $r;

                $this->db->where('admin_status', 2);
                $q = $this->db->get('admins');
                $r = $q->result_array();
                $showData['cooks'] = $r;

                $this->db->where('admin_status', 1);
                $q = $this->db->get('admins');
                $r = $q->result_array();
                $showData['delivers'] = $r;
                break;
        }
        $clients = array();
        foreach ($showData['list'] as $item){
            $clients[] = $item['order_client_id'];
        }
        if(empty($clients)) {
            $showData['list'] = array();
            $this->_show('activeorders', $showData);
            return;
        }
        $this->db->where_in('user_id', $clients);
        $client_list = $this->db->get('users')->result_array();

        foreach ($showData['list'] as $key => $item){
            foreach ($client_list as $value){
                if($item['order_client_id'] == $value['user_id']){
                    $showData['list'][$key]['order_client_name'] = $value['user_name'];
                    break;
                }
            }
        }
        $this->_show('activeorders', $showData);
    }
    function orderinfo($order_id){
        $id = $this->_check();
        $showData = array();
        $showData['status'] = $this->_getstatus();
        $this->db->where('order_id', $order_id);
        $info = $this->db->get('orders')->row_array();
        $showData['item'] = $info;
        $showData['item']['order_list'] = json_decode($showData['item']['order_list'], true);
        $showData['item']['order_address'] = json_decode($showData['item']['order_address'], true);

        if($showData['status'] == '4'){
            $this->db->where('admin_status', 2);
            $q = $this->db->get('admins')->result_array();
            $showData['cooks'] = $q;

            $this->db->where('admin_status', 1);
            $q = $this->db->get('admins')->result_array();
            $showData['delivers'] = $q;
        }

        $this->db->where('user_id', $showData['item']['order_client_id']);
        $client = $this->db->get('users')->row_array();
        $showData['client'] = $client;

        $this->_show('orderinfo', $showData);
    }

    /*set personal*/
    function setCook($order_id,$cook_id, $r = 0){
        $this->_check();
        $ud = array('order_status' => 'preparing');
        $this->db->where('order_id', $order_id);
        $this->db->update('orders', $ud);

        $id = array('cook_user_id' => $cook_id, 'cook_order_id' => $order_id);
        $this->db->insert('cooks', $id);
        if($r == 0)
            redirect('admins/activeorders');
        else if($r == 1)
            redirect('admins/orderinfo/'.$order_id);
    }
    function setDeliver($order_id,$cook_id, $r = 0){
        $this->_check();
        $ud = array('order_status' => 'deliver');
        $this->db->where('order_id', $order_id);
        $this->db->update('orders', $ud);

        $id = array('deliver_user_id' => $cook_id, 'deliver_order_id' => $order_id);
        $this->db->insert('delivers', $id);

        if($r == 0)
            redirect('admins/activeorders');
        else if($r == 1)
            redirect('admins/orderinfo/'.$order_id);
    }
    function orderCooked($order_id, $r = 0){
        $this->_check();
        $ud = array('cook_order_closed' => '1');
        $this->db->where('cook_order_id', $order_id);
        $this->db->update('cooks', $ud);

        $ud = array('order_status' => 'cooked');
        $this->db->where('order_id', $order_id);
        $this->db->update('orders', $ud);

        if($r == 0)
            redirect('admins/activeorders');
        else if($r == 1)
            redirect('admins/orderinfo/'.$order_id);
    }
    function orderClose($order_id, $r = 0){
        $this->_check();
        $ud = array('deliver_order_closed' => 1);
        $this->db->where('deliver_order_id', $order_id);
        $this->db->update('delivers', $ud);

        $ud = array('order_status' => 'closed');
        $this->db->where('order_id', $order_id);
        $this->db->update('orders', $ud);

        if($r == 0)
            redirect('admins/activeorders');
        else if($r == 1)
            redirect('admins/orderinfo/'.$order_id);
    }

    function products(){
        $this->_check();
        $showData['products'] = $this->db->query("SELECT * FROM products")->result_array();

        $this->_show("products", $showData);
    }
    function createproduct(){
        $this->_check();
        if(!empty($_POST)){
            $uploaddir = 'D:/WAMP/burger1/img/';
            $cnt = count($_FILES['productFile']['name']);
            $str = array();

            for ($i = 0; $i < $cnt; $i++){
                $uploadfile = $uploaddir . basename($_FILES['productFile']['name'][$i]);
                move_uploaded_file($_FILES['productFile']['tmp_name'][$i], $uploadfile);
                $str[$i] = basename($_FILES['productFile']['name'][$i]);
            }

            $this->db->query("INSERT INTO products (product_name, product_info, product_description, product_price, product_available, product_image) VALUES ('" . $_POST['name'] . "', '" . $_POST['info'] . "', '" . $_POST['description'] . "', '".$_POST['price']."', '".$_POST['available']."','".implode(",", $str)."')");

            header("Location: /admins/products");
        }
        $this->_show("createproduct");
    }
    function deleteproduct($id){
        $this->_check();
        $this->db->query("DELETE FROM products WHERE product_id=?", $id);
        header("Location: /admins/products");
    }
    function editproduct($id){
        $this->_check();
        if (!empty($_POST)) {

            if (!in_array(4, $_FILES['productFile']['error'])) {
                $replaced = true;
                $uploaddir = 'D:/WAMP/burger1/img';
                $cnt = count($_FILES['productFile']['name']);
                $str = array();
                for ($i = 0; $i < $cnt; $i++){
                    $uploadfile = $uploaddir . basename($_FILES['productFile']['name'][$i]);
                    move_uploaded_file($_FILES['productFile']['tmp_name'][$i], $uploadfile);
                    $str[$i] = basename($_FILES['productFile']['name'][$i]);
                }
            } else {
                $replaced = false;
            }
            if ($replaced) {
                $this->db->query("UPDATE products SET product_info='".$_POST['info']."', product_name='".$_POST['name']."', product_description='".$_POST['description']."', product_price='".$_POST['price']."', product_available='".$_POST['available']."', product_image='".implode(",", $str)."' WHERE product_id='$id'");
            } else {
                $this->db->query("UPDATE products SET product_info='".$_POST['info']."', product_name='".$_POST['name']."', product_description='".$_POST['description']."', product_price='".$_POST['price']."', product_available='".$_POST['available']."' WHERE product_id='$id'");
            }

            header("Location: /admins/products");
        } else {
            $showData['editEntry'] = $this->db->query("SELECT * FROM products WHERE product_id=?", $id)->row_array();

            $this->_show('editproduct', $showData);
        }
    }

    function sliders(){
        $sliders = $this->db->get('sliders')->result_array();
        foreach ($sliders as $key => $slider) {
            $info = $this->db->get_where('products', array('product_id' => $slider['slider_product_id']))->row_array();
            $sliders[$key]['product_name'] = $info['product_name'];
        }
        $data['sliders'] = $sliders;
        $this->_show('sliders', $data);
    }
    function createslider(){
        $data['products'] = $this->db->get('products')->result_array();
        if(!empty($_POST)){

            if (!in_array(4, $_FILES['productFile']['error'])) {
                $uploaddir = 'D:/WAMP/burger1/img/';
                $cnt = count($_FILES['productFile']['name']);
                $str = array();
                for ($i = 0; $i < $cnt; $i++){
                    $uploadfile = $uploaddir . basename($_FILES['productFile']['name'][$i]);
                    move_uploaded_file($_FILES['productFile']['tmp_name'][$i], $uploadfile);
                    $str[$i] = basename($_FILES['productFile']['name'][$i]);
                }

                $this->db->insert('sliders', array(
                    'slider_product_id' => $_POST['product_id'],
                    'slider_image' => implode(",", $str)
                    )
                );

            }
            header("Location: /admins/products");
        }
        $this->_show('createslider', $data);
    }
    function editslider($id){
        $data['products'] = $this->db->get('products')->result_array();

        $this->db->where('slider_id', $id);
        $data['slider'] = $this->db->get('sliders')->row_array();


        $info = $this->db->get_where('products', array('product_id' => $data['slider']['slider_product_id']))->row_array();
        $data['slider']['product_name'] = $info['product_name'];


        if(!empty($_POST)){

            if (!in_array(4, $_FILES['productFile']['error'])) {
                $uploaddir = 'D:/WAMP/burger1/img/';
                $cnt = count($_FILES['productFile']['name']);
                $str = array();
                for ($i = 0; $i < $cnt; $i++){
                    $uploadfile = $uploaddir . basename($_FILES['productFile']['name'][$i]);
                    move_uploaded_file($_FILES['productFile']['tmp_name'][$i], $uploadfile);
                    $str[$i] = basename($_FILES['productFile']['name'][$i]);
                }

                $this->db->insert('sliders', array(
                    'slider_product_id' => $_POST['product_id'],
                    'slider_image' => implode(",", $str)
                    )
                );

            }
            header("Location: /admins/products");
        }
        $this->_show('editslider', $data);
    }
    function deleteslider($id){
        $this->db->delete('sliders', array('slider_id' => $id));
            header("Location: /admins/sliders");
    }
}