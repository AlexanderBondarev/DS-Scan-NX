<?php

$Name = $argv[1];

$mfind = array("N2+", "NO2", "~", "Cl-", "BF4-", "TfO-", "TsO-", "HSO4-", "CF3COO-");
$msubst = array("N<sub>2</sub><sup>+</sup>", "NO<sub>2</sub>", " ", "Cl<sup>-</sup>", "BF<sub>4</sub><sup>-</sup>", "TfO<sup>-</sup>", "TsO<sup>-</sup>", "HSO<sub>4</sub><sup>-</sup>", "CF<sub>3</sub>COO<sup>-</sup>");
$lst = explode("_", $Name);
$MolName = str_replace($mfind, $msubst, $lst[0]);
printf("%s", $MolName);

?>

