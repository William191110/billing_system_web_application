<?php 
declare(strict_types = 1);

namespace Controllers;

class Orders extends Resources{

    public function Document()
    {
        $this->view('controllers/session', [1]);
        $this->view('views/templates/header');
        $this->view('views/templates/dashboard-header');
        $this->view('views/templates/sidebar');
        $this->view('views/pages/orders',$this->getSpecificData('orders', 'customer_id', USERID));
        $this->view('views/templates/footer');
    }
}