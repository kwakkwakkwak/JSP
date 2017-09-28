//package example;
//
//import DAO.User;
//
//import java.sql.Connection;
//import java.sql.DriverManager;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.util.ArrayList;
//import java.util.List;
//
//public class MVCTest6 {
//    public static void main(String[] args) {
//
//        List<User> list = selectAllUsers();
//        System.out.println(list);
//
//    }
//
//    private static List<User> selectAllUsers() {
//        List<User> list = new ArrayList<>();
//        Connection conn = null; // null로 초기화 한다.
//        PreparedStatement pstmt = null;
//
//        try {
//            Class.forName("com.mysql.jdbc.Driver"); // 데이터베이스와 연동하기 위해 DriverManager에 등록한다.
//
//            String url = "jdbc:mysql://localhost:3306/jspTest?useUnicode=true&characterEncoding=utf8"; // 사용하려는 데이터베이스명을 포함한 URL 기술
//
//            String dbid = "root"; // 사용자 계정
//
//            String dbpw = "1234"; // 사용자 계정의 패스워드
//
//            conn = DriverManager.getConnection(url, dbid, dbpw); // DriverManager 객체로부터 Connection 객체를 얻어온다.
//
//
//            String sql = "SELECT * FROM USER";
//
//            pstmt = conn.prepareStatement(sql);
//
//            ResultSet rs = pstmt.executeQuery();
//
//            while (rs.next()) // 데이터가 있을때,
//                list.add(new User(rs.getString("name"),rs.getString("pw"),rs.getString("email")));
//
//        } catch (Exception e) { // 예외가 발생하면 예외 상황을 처리한다.
//
//            e.printStackTrace();
//
//        }
//
//        return list;
//
//    }
//
//}
