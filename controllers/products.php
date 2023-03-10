<?php 
declare(strict_types = 1);

namespace Controllers;

class Products extends Resources{
    
    
    
    private function order()
    {
        if(isset($_POST['placeOrder']))
        {
            sleep(3);
            $columns = array('customer_id', 'product', 'price', 'quantity', 'total_cost', 'status');
            $data    = array(USERID, $_POST['pname'], $_POST['pprice'], $_POST['qty'], $_POST['total'], 'pending');
            $query = $this->Model()->insertInto('orders', $columns);
            $this->Model()->execute($query, $data);
            echo '<script>alert("you have successfully ordered")</script>';
        }

    }
    /**
     * Document
     *
     * @return void
     */
    public function Document()
    {
        $this->view('controllers/session',[1]);
        $this->view('views/templates/header');
        $this->view('views/templates/dashboard-header');
        $this->view('views/templates/sidebar');
        $this->view('views/pages/products', $this->getData('products'), $this->order());
        $this->view('views/templates/footer');
    }
}