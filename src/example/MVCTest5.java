//package example;
//
//import DAO.User;
//
//import java.sql.Connection;
//import java.sql.DriverManager;
//import java.sql.PreparedStatement;
//
//
//import static example.MVCTest4.selectUser;
//
//public class MVCTest5 {
//    public static void main(String args[]){
//     User u = selectUser(1);
//     System.out.println(u);
//
//    deleteUser(1); // 객체 u에 저장된 user_id와 동일한 행의 정보를 delete하는 메서드
//
//    u = selectUser(1);
//     System.out.println(u);
//    }
//
//    public static int deleteUser(int id) {
//        int result = 0;
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
//            String sql = "DELETE FROM USER WHERE id = ? ";
//
//            pstmt = conn.prepareStatement(sql);
//
//            pstmt.setInt(1,id);
//
//            pstmt.executeUpdate();
//
//        } catch (Exception e) { // 예외가 발생하면 예외 상황을 처리한다.
//
//            e.printStackTrace();
//
//        }
//
//        return result;
//    }
//
//
//}
