/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function changeText(id){   
   id.value = ''; 
}

// validate form data
      function validateRegisterForm() {
        var valid = true;
        
        // validate userid
        var userid = get('userid').value;
        var fname =get('fName').value;
        var lname = get('lName').value;
        var email1= get('emailAdd').value;
        var passwd1=get('passwd').value;
        var passwd2= get('pass2').value;
       
        get('useriderr').innerHTML = '';        
        get('fnameerr').innerHTML = '';
        get('lnameerr').innerHTML='';
        get('emailerr').innerHTML = '';
        get('passerr').innerHTML = '';
        if (! /^[\-a-zA-Z0-9]*$/.test(userid)) {
          valid = false;
          get('useriderr').innerHTML = 'Userid can contain only a-z, A-Z, 0-9, and hyphen';
        }
        else if (! /^[\-a-zA-Z0-9]*$/.test(fname)) {
          valid = false;
          get('fnameerr').innerHTML = 'Name can contain only a-z, A-Z, 0-9, and hyphen';
        }
        else if (! /^[\-a-zA-Z0-9]*$/.test(lname)) {
          valid = false;
          get('lnameerr').innerHTML = 'Name can contain only a-z, A-Z, 0-9, and hyphen';
        }
        else if (! /^[\-a-zA-Z0-9@.]*$/.test(email1)) {
          valid = false;
          get('emailerr').innerHTML = 'Email Address can contain only a-z, A-Z, 0-9, period and @' ;         
        }
        else if(passwd1 !== passwd2)
        {
          valid = false;
          get('passerr').innerHTML = 'Passwords must match';    
        }
        
        else            
            document.getElementById('register').disabled = true;
        return valid;
      }

      // shortcut for accessing DOM elements by id
      function get(id) { return document.getElementById(id); }
      
    
