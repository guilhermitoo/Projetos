<?php
// array com referente a 3 pessoas
    $var = Array(
    array(
        "nome"=>"João",
        "sobreNome"=>"Silva",
        "cidade"=>"Maringá"
    ),
    array(
        "nome"=>"Ana",
        "sobreNome"=>"Rocha",
        "cidade"=>"Londrina"
    ),
    array(
        "nome"=>"Véra",
        "sobreNome"=>"Valério",
        "cidade"=>"Cianorte"
    ));
// convertemos em json e colocamos na tela
    echo json_encode($var);