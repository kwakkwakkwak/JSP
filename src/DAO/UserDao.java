package DAO;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserDao extends DAO {

    private static UserDao uDao = new UserDao();

    private UserDao() {
        super("User");
    }

    public static UserDao getInstence() {
        if (uDao == null)
            uDao = new UserDao();
        return uDao;

    }

    public List<User> selectAllUsers() { // 모든 열 select
        List<User> list = new ArrayList<>();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            String sql = "SELECT * FROM "+getTableName();

            pstmt = getConn().prepareStatement(sql);

            rs = pstmt.executeQuery();

            while (rs.next()) // 데이터가 있을때,
                list.add(new User(
                        rs.getString("name"),
                        rs.getString("pw"),
                        rs.getString("email")));

        } catch (Exception e) { // 예외가 발생하면 예외 상황을 처리한다

            e.printStackTrace();

        } finally {
            close(pstmt, rs);
        }

        return list;
    }


    public User selectUser(int index) { // 한열만 검색
        User user = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            String sql = "SELECT * FROM "+getTableName()+" WHERE id = ?";

            pstmt = getConn().prepareStatement(sql);

            pstmt.setInt(1, index);

            rs = pstmt.executeQuery();

            if (rs.next())
                user = new User(rs.getString("name"), rs.getString("pw"), rs.getString("email"));
            else
                System.out.println("데이터가 없습니다.");
        } catch (Exception e) { // 예외가 발생하면 예외 상황을 처리한다

            e.printStackTrace();

        } finally {
            close(pstmt, rs);
        }
        return user;
    }

    public int updateUser(int index, User user) {
        int result = 0;

        PreparedStatement pstmt = null;

        try {

            String sql = "UPDATE "+getTableName()+" SET name = ? , up_date = ?, pw = ? WHERE id = ? ";
            pstmt = getConn().prepareStatement(sql);

            pstmt.setString(1, user.name);
            pstmt.setDate(2, new java.sql.Date(new java.util.Date().getTime()));
            pstmt.setString(3, user.pw);
            pstmt.setInt(4, index);

            pstmt.executeUpdate();


        } catch (Exception e) { // 예외가 발생하면 예외 상황을 처리한다.

            e.printStackTrace();

        }
        return result;
    }

    public int insertUser(User user) {
        int result = 0;

        PreparedStatement pstmt = null;

        try {

            String sql = "SELECT COUNT(*) FROM "+getTableName()+" where email = ? ";
            pstmt = getConn().prepareStatement(sql);
            pstmt.setString(1, user.email);
            ResultSet rs = pstmt.executeQuery();
            rs.next();
            if (rs.getInt(1) > 0) {
                result = 1;
            } else {
                pstmt.close();
                sql = "INSERT INTO user(email , pw , name , in_date , up_date ) " +
                        "VALUES( ? , ? , ? , ? , ? )";

                pstmt = getConn().prepareStatement(sql);

                pstmt.setString(1, user.email);
                pstmt.setString(2, user.pw);
                pstmt.setString(3, user.name);
                pstmt.setDate(4, new java.sql.Date(new java.util.Date().getTime()));
                pstmt.setDate(5, new java.sql.Date(new java.util.Date().getTime()));


                pstmt.executeUpdate();

            }
        } catch (SQLException e) {
            result = 2;
            e.printStackTrace();
        }
        return result;
    }

    public int deleteUser(int index) {
        int result = 0;

        PreparedStatement pstmt = null;

        try {
            String sql = "DELETE FROM "+getTableName()+" WHERE id = ? ";

            pstmt = getConn().prepareStatement(sql);

            pstmt.setInt(1, index);

            pstmt.executeUpdate();

        } catch (Exception e) { // 예외가 발생하면 예외 상황을 처리한다.

            e.printStackTrace();

        }

        return result;
    }

    public int emailForindex(String email) {
        int index = 0;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            String sql = "SELECT id FROM "+getTableName()+" WHERE email = ?";

            pstmt = getConn().prepareStatement(sql);

            pstmt.setString(1, email);

            rs = pstmt.executeQuery();

            if (rs.next())
                index = rs.getInt("id");
            else {
                index = -1;
                System.out.println("데이터가 없습니다.");
            }

        } catch (Exception e) { // 예외가 발생하면 예외 상황을 처리한다
            System.out.println(" Error 발생");
            e.printStackTrace();

        } finally {
            close(pstmt, rs);
        }
        return index;
    }
}