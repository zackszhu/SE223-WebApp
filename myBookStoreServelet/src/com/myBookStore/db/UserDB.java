package com.myBookStore.db;

import com.myBookStore.model.User;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by zacks on 15-5-1.
 */
public class UserDB {
    private static UserDB ourInstance = new UserDB();
    private DataSource dataSource;
    private Connection conn;
    private UserDB() {
        try {
            Context initContent = new InitialContext();
            dataSource = (DataSource) initContent.lookup("java:comp/env/jdbc/bookStore");
            conn = dataSource.getConnection();
        } catch (NamingException ex) {
            System.out.println("Context Error!");
        } catch (SQLException ex) {
            System.out.println("Connect Error!");
        }

    }

    public static UserDB getInstance() {
        return ourInstance;
    }

    public boolean loginUser(String username, String password) {
        try {
//            Connection conn = dataSource.getConnection();

            PreparedStatement statement = conn.prepareStatement("SELECT `Password` FROM `user` WHERE Username=(?) AND Status=0");
            statement.setString(1, username);
            ResultSet result = statement.executeQuery();
            result.next();
            System.out.println("back");
            return result.getString(1).equals(password);
        } catch (SQLException ex) {
            System.out.println("Connect Error!");
        }
        return false;
    }

    public boolean registerUser(String username, String password, String email) {
        try {
//            Connection conn = dataSource.getConnection();

            PreparedStatement statement = conn.prepareStatement("INSERT INTO `user` (`Username`, `Email`, `Password`) VALUES (?, ?, ?)");
            statement.setString(1, username);
            statement.setString(2, email);
            statement.setString(3, password);
            statement.executeUpdate();
            return true;
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return false;
    }

    public List<User> getUser() {
        List<User> ret = new ArrayList<User>();
        try {
            PreparedStatement statement = conn.prepareStatement("SELECT * FROM `user`;");
            ResultSet result = statement.executeQuery();
            while (result.next()) {
                ret.add(new User(
                                result.getInt(5),
                                result.getString(1),
                                result.getString(2),
                                result.getString(4),
                                result.getInt(6)
                        )
                );
            }
        } catch (SQLException ex) {
            System.out.println("Connect Error!");
        }
        return ret;
    }

    public User getUser(String _username) {
        try {
            PreparedStatement statement = conn.prepareStatement("SELECT * FROM `user` WHERE `Username`=(?);");
            statement.setString(1, _username);
            System.out.println("aaa");
            ResultSet result = statement.executeQuery();
            result.next();
            return new User(
                                result.getInt(5),
                                result.getString(1),
                                result.getString(2),
                                result.getString(4),
                                result.getInt(6)
                        );

        } catch (SQLException ex) {
            System.out.println("Connect Error!");
        }
        return null;
    }

    public boolean banUser(int _id) {
        try {
//            Connection conn = dataSource.getConnection();
            PreparedStatement statement = conn.prepareStatement("UPDATE `user` SET `status`=1 WHERE `id`=(?);");
            statement.setInt(1, _id);
            statement.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("Connect Error!");
        }
        return false;
    }


    public boolean checkUser(String _name) {
        try {
            PreparedStatement statement = conn.prepareStatement("SELECT count(*) FROM `user` WHERE `Username`=(?);");
            statement.setString(1, _name);
            ResultSet result = statement.executeQuery();
            result.next();
            if (result.getInt(1) > 0) {
                return true;
            }
        } catch (SQLException ex) {
            System.out.println("Connect Error!");
        }
        return false;
    }
}
