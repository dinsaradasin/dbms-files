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
function p_submit() {
   
    const firstName = document.getElementById('fname').value;
    const lastName = document.getElementById('lname').value;
    const dob = document.getElementById('dobid').value;
   
    
    if (!firstName || !lastName) {
        alert("Error: First and Last Name are required.");
        return false; 
    }

    if (!dob) {
        alert("Error: Please select a Birth Date.");
        return false; 
    }

   
    alert("Form validated. Sending to PHP...");
    return true; 
}
