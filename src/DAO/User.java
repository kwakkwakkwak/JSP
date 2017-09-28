package DAO;

public class User {
    String name;
    String pw;
    String email;

    public User( String name, String pw, String email){
        this.name = name;
        this.pw = pw;
        this.email = email;
    }

    @Override
    public String toString() {
        return " 이름 : " + name + " / pw : " + pw + " / email : "+ email;
    }
    /* 적절한 코드를 넣어 완성하시오. */

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPw() {
        return pw;
    }

    public void setPw(String pw) {
        this.pw = pw;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
