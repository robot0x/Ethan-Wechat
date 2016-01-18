<?php
namespace Config\Model\Config;

/**
*
*/
class IndexModel
{
    protected $config = array();
    #
    public function setConfig($config){
        $this->config = $config;
    }

    public function getConfig(){
        return $this->config;
    }
}
