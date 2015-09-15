<?php
session_destroy();
unset($_SESSION['usuario']);
unset($_SESSION['senha']);

header("Location: index.php");