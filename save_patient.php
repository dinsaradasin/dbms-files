<?php

$db_server = "localhost";
$db_user = "root";
$db_pass = "";
$db_name = "hpms_db";

$conn = mysqli_connect($db_server, $db_user, $db_pass, $db_name);

$method = $_SERVER["REQUEST_METHOD"];

if ($method == "POST") {
    
    $fname = $_POST['first_name'];
    $lname = $_POST['last_name'];
    $dob = $_POST['dob'];
    $gender = $_POST['gender'];
    $blood = $_POST['blood_group'];
    $add_no = $_POST['add_number'];
    $street = $_POST['street'];
    $city = $_POST['city'];

    
    mysqli_query($conn, "INSERT INTO person (first_name, last_name) VALUES ('$fname', '$lname')");
    
    
    $new_id = mysqli_insert_id($conn);

    
    mysqli_query($conn, "INSERT INTO patient (person_id, blood_group, dob, gender, add_number, street, city) 
                         VALUES ($new_id, '$blood', '$dob', '$gender', '$add_no', '$street', '$city')");

    
    $phones = $_POST['p_numbers'];
    foreach ($phones as $p) {
        if (!empty($p)) {
            mysqli_query($conn, "INSERT INTO person_p_number (person_id, p_number) VALUES ($new_id, '$p')");
        }
    }

    echo "Patient added successfully! Student ID assigned: " . $new_id;
}
?>