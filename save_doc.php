<?php

$conn = mysqli_connect("localhost", "root", "", "hpms_db");


if ($_SERVER["REQUEST_METHOD"] == "POST") {

   
    $f = $_POST['first_name'];
    $l = $_POST['last_name'];
    $e = $_POST['e_mail'];
    $s = $_POST['specialization'];
    $d = $_POST['dept_id'];
    $p_list = $_POST['p_numbers']; 

    
    $res = mysqli_query($conn, "SELECT * FROM department WHERE dept_id = $d");

    if (mysqli_num_rows($res) > 0) {
        
        
        mysqli_query($conn, "INSERT INTO person (first_name, last_name) VALUES ('$f', '$l')");
        
     
        $new_id = mysqli_insert_id($conn);

       
        mysqli_query($conn, "INSERT INTO doctor (person_id, specialization, e_mail, dept_id) 
                             VALUES ($new_id, '$s', '$e', $d)");

     
        foreach ($p_list as $p) {
            if (!empty($p)) {
                mysqli_query($conn, "INSERT INTO person_p_number (person_id, p_number) VALUES ($new_id, '$p')");
            }
        }

        echo "Doctor added! ID is: " . $new_id;

    } else {
       
        echo "Error: Department ID " . $d . " is not valid. Please check and try again.";
    }
}


mysqli_close($conn);
?>