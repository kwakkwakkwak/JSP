//package example;
//
//
//import java.sql.*;
//import java.util.*;
//
//public class MVCTest8 {
//    public static void main(String[] args) {
//
//
//    } // main()
//}
//
//class Dao {
//
//    Connection conn;
//    String tableName = "";
//
//
//    Dao() {
//        this(null, "");
//    }
//
//    Dao(String tableName) {
//        this(null, tableName);
//    }
//
//    Dao(Connection conn, String tableName) {
//        this.tableName = tableName;
//
//        this.conn = conn;
//        if (conn == null) {
//            try {
//                Class.forName("com.mysql.jdbc.Driver");
//                String url = "jdbc:mysql://localhost:3306/" +
//                        "jspTest?useUnicode=true&characterEncoding=utf8";
//                // 사용하려는 데이터베이스명을 포함한 URL 기술
//
//                String dbid = "root"; // 사용자 계정
//
//                String dbpw = "1234"; // 사용자 계정의 패스워드
//                this.conn = DriverManager.getConnection(url, dbid, dbpw);
//            } catch (Exception e) {
//                System.out.println("connction Err");
//                e.printStackTrace();
//            }
//        }
//
//    }
//
//    void rollback() {
//        if (conn != null) {
//            try {
//                conn.rollback();
//            } catch (SQLException e) {
//
//            }
//        }
//    }
//
//    void close(AutoCloseable... acs) {
//        for (AutoCloseable ac : acs) {
//            if (ac != null)
//                try {
//                    ac.close();
//                } catch (Exception e) {
//                    e.printStackTrace();
//                }
//        }
//    }
//}
