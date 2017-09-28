//package example;
//
//import DAO.User;
//
//import java.sql.Connection;
//import java.sql.DriverManager;
//import java.sql.PreparedStatement;
//
//
//public class MVCTest3 {
//    public static void main(String[] args) {
//        User u = new User("홍길동", "4444", "aaa@aaa.com");
//        System.out.println(u);
//
//        updateUser(u); // 객체 u에 저장된 user_id와 동일한 행의 정보를 update하는 메서드
//
//    }
//
//
//    static int updateUser(User u) {
//        int result =0;
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
//            String sql = "UPDATE USER SET name = ? , up_date = ?, pw = ? WHERE email = ? ";
//            pstmt = conn.prepareStatement(sql);
//
//            pstmt.setString(1, u.name);
//            pstmt.setDate(2, new java.sql.Date(new java.util.Date().getTime()));
//            pstmt.setString(3, u.pw);
//            pstmt.setString(4, u.email);
//
//            pstmt.executeUpdate();
//
//
//        } catch (Exception e) { // 예외가 발생하면 예외 상황을 처리한다.
//
//            e.printStackTrace();
//
//        }
//        return result;
//    }
//
//
//}