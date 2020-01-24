package test.entities;

/**
 *
 * @author arnav
 */
public class RegisterForm
{

    String username;
    String password;
    String spassword;
    String role;

    public String getRole()
    {
        return role;
    }

    public void setRole(String role)
    {
        this.role = role;
    }

    public String getUsername()
    {
        return username;
    }

    public void setUsername(String username)
    {
        this.username = username;
    }

    public String getPassword()
    {
        return password;
    }

    public void setPassword(String password)
    {
        this.password = password;
    }

    public String getSpecialpassword()
    {
        return spassword;
    }

    public void setSpecialpassword(String spassword)
    {
        this.spassword = spassword;
    }

}
