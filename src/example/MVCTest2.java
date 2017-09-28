//package example;
//
//import DAO.User;
//
//import java.sql.*;
//
//public class MVCTest2 {
//    public static void main(String[] args) {
//        User u = new User("남궁성", "1234", "aaaaaa@aaa.com");
//        System.out.println(u);
//        int resultcode = insertUser(u);
//        if(resultcode >0)
//            System.out.println("Errcode : " + resultcode); // 객체 u에 저장된 값을 DB의 user_info테이블에 insert하는 메서드
//
//    }
//
//
//    static int insertUser(User u) {
//        int result = 0;
//        Connection conn = null; // null로 초기화 한다.
//        PreparedStatement pstmt = null;
//
//        try {
//
//            String url = "jdbc:mysql://localhost:3306/jspTest?useUnicode=true&characterEncoding=utf8"; // 사용하려는 데이터베이스명을 포함한 URL 기술
//
//            String dbid = "root"; // 사용자 계정
//
//            String dbpw = "1234"; // 사용자 계정의 패스워드
//            //out.println("  class");
//            Class.forName("com.mysql.jdbc.Driver"); // 데이터베이스와 연동하기 위해 DriverManager에 등록한다.
//
//            conn = DriverManager.getConnection(url, dbid, dbpw); // DriverManager 객체로부터 Connection 객체를 얻어온다.
//
//            String sql = "SELECT COUNT(*) FROM user where email = ? ";
//            pstmt = conn.prepareStatement(sql);
//            pstmt.setString(1, u.email);
//            ResultSet rs = pstmt.executeQuery();
//            rs.next();
//            if (rs.getInt(1) > 0) {
//				result = 1;
//            } else {
//                pstmt.close();
//                sql = "INSERT INTO user(email , pw , name , in_date , up_date ) VALUES( ? , ? , ? , ? , ? )";
//                //out.println(email);
//                pstmt = conn.prepareStatement(sql);
//
//                //out.println("sql  컴파일 ");
//                pstmt.setString(1, u.email);
//                pstmt.setString(2, u.pw);
//                pstmt.setString(3, u.name);
//                pstmt.setDate(4, new java.sql.Date(new java.util.Date().getTime()));
//                pstmt.setDate(5, new java.sql.Date(new java.util.Date().getTime()));
//                //out.println("aa");
//                pstmt.executeUpdate();
//                //out.println("Query 실행");
//            }
//            } catch (SQLException e) {
//            result = 2;
//            e.printStackTrace();
//        } catch (ClassNotFoundException e) {
//            result = 3;
//            e.printStackTrace();
//        }
//        return result;
//    }
//}
