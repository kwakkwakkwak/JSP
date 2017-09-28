package DAO;

import java.sql.Date;

public class Board {
    int boradId;
    String title;
    String content;
    Date in_date;
    Date up_date;
    int count;
    int writer;

    Board(){}


    public Board(int boradId, String title, String content, Date in_date, Date up_date, int count, int writer){
        this.boradId = boradId;
        this.title = title;
        this.content = content;
        this.in_date = in_date;
        this.up_date = up_date;
        this.count = count;
        this.writer = writer;
    }

    @Override
    public String toString() {
        return "title :" + title + " context : " + content + " count : " +count;
    }

    public int getBoradId() {
        return boradId;
    }

    public String getTitle() {
        return title;
    }

    public String getContent() {
        return content;
    }

    public Date getIn_date() {
        return in_date;
    }

    public Date getUp_date() {
        return up_date;
    }

    public int getCount() {
        return count;
    }

    public int getWriter() {
        return writer;
    }

    public void setBoradId(int boradId) {
        this.boradId = boradId;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public void setIn_date(Date in_date) {
        this.in_date = in_date;
    }

    public void setUp_date(Date up_date) {
        this.up_date = up_date;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public void setWriter(int writer) {
        this.writer = writer;
    }
}
