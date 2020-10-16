/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tithi.bookworm;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author ASUS
 */
public class HistoryD {
    DataBaseConnection db;

    public HistoryD() {
        db = new DataBaseConnection();
    }
    
    public void insert(String email, String event_name){
        try {
            db.stmt.executeUpdate("insert into history(email, event_name, event_time) values("+email+", "+event_name+", localtimestamp)");
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
    
}
