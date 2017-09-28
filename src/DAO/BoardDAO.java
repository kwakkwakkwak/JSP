package DAO;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BoardDAO extends DAO {
    private static BoardDAO bDao = new BoardDAO();

    private BoardDAO() {
        super("board");
    }

    public static BoardDAO getInstence() {
        if (bDao == null)
            bDao = new BoardDAO();
        return bDao;
    }

    public int insertBoard(Board board) {
        int result = 0;
        PreparedStatement pstmt = null;

        String sql = "INSERT INTO " + getTableName() + "(title,content,in_date,up_date,writer) values(?,?,?,?,?)";
        try {
            pstmt = getConn().prepareStatement(sql);
            pstmt.setString(1, board.title);
            pstmt.setString(2, board.content);
            pstmt.setDate(3, board.in_date);
            pstmt.setDate(4, board.up_date);
            pstmt.setInt(5, board.writer);

            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(pstmt);
        }

        return result;
    }

    public int deleteBoard(int index) {
        int result = 0;
        PreparedStatement pstmt = null;

        String sql = "DELETE FROM " + getTableName() + " WHERE boardid = ?";
        try {
            pstmt = getConn().prepareStatement(sql);
            pstmt.setInt(1,index);

            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(pstmt);
        }
        return result;
    }

    public List<Board> selectBoardAll() {
        List<Board> boradlist = new ArrayList<Board>();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = "SELECT * FROM " + getTableName();
        try {
            pstmt = getConn().prepareStatement(sql);

            rs = pstmt.executeQuery();

            while (rs.next()) {
                boradlist.add(new Board(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDate(4),
                        rs.getDate(5),
                        rs.getInt(6),
                        rs.getInt(7)
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(pstmt, rs);
        }
        return boradlist;
    }

    public Board selectBoard(int index) {
        Board board = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = "SELECT * FROM " + getTableName() + " WHERE boardid = ? ";
        try {
            pstmt = getConn().prepareStatement(sql);

            pstmt.setInt(1, index);

            rs = pstmt.executeQuery();

            if (rs.next()) {
                board =new Board(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDate(4),
                        rs.getDate(5),
                        rs.getInt(6),
                        rs.getInt(7));
            } else {
                System.out.println("데이터가 없습니다.");
            }


            }catch(Exception e){
                e.printStackTrace();
            }finally{
                close(pstmt, rs);
            }
            return board;
        }

    public int updateBoard(int index, Board board) {
        int result = 0;
        PreparedStatement pstmt = null;

        String sql = "UPDATE " + getTableName() + " SET title = ? , content = ? , up_date = ?, count = ?  WHERE boardid = ? ";
        try {
            pstmt = getConn().prepareStatement(sql);

            pstmt.setString(1, board.title);
            pstmt.setString(2, board.content);
            pstmt.setDate(3, new java.sql.Date(new java.util.Date().getTime()));
            pstmt.setInt(4, board.count);
            pstmt.setInt(5, index);
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(pstmt);
        }
        return result;
    }

}
