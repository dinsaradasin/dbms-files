function add_phone() {
    const phone_box = document.getElementById('phone_box');
    
    const newRow = document.createElement('div');
    newRow.className = 'phone_row';
    newRow.style.marginTop = "8px";

    const newInput = document.createElement('input');
    newInput.type = 'text';
    newInput.name = 'p_numbers[]'; 
    newInput.placeholder = "Additional number";
    
    
    newRow.appendChild(newInput);
    phone_box.appendChild(newRow);
}
function d_submit() {
   
    const firstName = document.getElementById('fname').value;
    const lastName = document.getElementById('lname').value;
    const e_mail = document.getElementById('e_mail').value;
    const special = document.getElementById('specialization').value;
    
    
    if (!firstName || !lastName) {
        alert("Error: First and Last Name are required.");
        return false; 
    }
    if (!e_mail) {
        alert("Error: E-mail is required.");
        return false; 
    }
    if (!special) {
        alert("Error: Specialization required.");
        return false; 
    }


   
    alert("Form validated. Sending to PHP...");
    return true; 
}
