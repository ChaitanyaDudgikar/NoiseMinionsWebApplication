/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package test.entities;

/**
 *
 * @author arnav
 */
public class RegisterForm {
    
    String username;
    String password;
    String retypedpassword;
    String role;

    public String getRole()
    {
        return role;
    }

    public void setRole(String role)
    {
        this.role = role;
    }
    
    

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRetypedpassword() {
        return retypedpassword;
    }

    public void setRetypedpassword(String retypedpassword) {
        this.retypedpassword = retypedpassword;
    }
    
}
