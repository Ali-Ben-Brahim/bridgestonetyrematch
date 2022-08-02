<?php
$lead = $interAxieRatio = $front = $rear = $slip = $axleDifference =$axleRatio = "";

if(!empty($_POST['lead'])){
    $lead =$_POST['lead'];
}
if(!empty($__POST['interAxieRatio'])){
    $interAxieRatio =$_POST['interAxieRatio'];
}
if(!empty($__POST['front'])){
    $front =$_POST['front'];
}
if(!empty($__POST['rear'])){
    $rear =$_POST['rear'];
}
if(!empty($__POST['slip'])){
    $slip =$_POST['slip'];
}
if(!empty($__POST['axleDifference'])){
    $axleDifference =$_POST['axleDifference'];
}
if(!empty($__POST['axleRatio'])){
    $axleRatio =$_POST['axleRatio'];
}

$role =$_POST['role'];

if($role=='basic'){
    $name =(string) "basic_myfile_".date('h.i.s');
    $myfile = fopen(($name.".txt"), "w") or die("Unable to open file!");
    $txt =(string) "Lead : ".$lead."\n"."Inter axie ratio : ".$interAxieRatio;
    fwrite($myfile, $txt);
    fclose($myfile);
    echo "basic";
}

if($role=='standard'){
    $name =(string) "standard_myfile_".date('h.i.s');
    $myfile = fopen(($name.".txt"), "w") or die("Unable to open file!");
    $txt = (string)"Lead : ".$lead."\n"."Inter axie ratio : ".$interAxieRatio."\n"."Front : ".$front."\n"."Rear : ".$rear."\n"."Slip".$slip."\n"."Axle Difference : ".$axleDifference."\n"."Axle Ratio : ".$axleRation."\n";
    fwrite($myfile, $txt);
    fclose($myfile);
    echo "standard";
}




?>
