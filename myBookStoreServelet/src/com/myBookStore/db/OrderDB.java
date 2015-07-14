package com.myBookStore.db;

import com.myBookStore.model.Order;

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
 * Created by zacks on 15-5-9.
 */
public class OrderDB {
    private static OrderDB ourInstance = new OrderDB();
    private DataSource dataSource;
    private Connection conn;
    private OrderDB() {
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

    public static OrderDB getInstance() {
        return ourInstance;
    }

    public Map<String, Integer> getStat() {
        Map<String, Integer> ret = new HashMap<String, Integer>();
        try {
            PreparedStatement statement = conn.prepareStatement("SELECT Username, count(`order`.id) AS numbers FROM `user`, `order` WHERE `user`.id = `order`.userID GROUP BY `user`.id ORDER BY numbers DESC;");
            ResultSet result = statement.executeQuery();
            while (result.next()) {
                ret.put(result.getString(1), result.getInt(2));
            }
        } catch (SQLException ex) {
            System.out.println("Connect Error!");
        }
        return ret;
    }

    public List<Order> getRecentOrder() {
        List<Order> ret = new ArrayList<Order>();
        try {
            PreparedStatement statement = conn.prepareStatement("select Username, Name, `order`.create_time from `order`, `books`, `user` where `order`.bookID = `books`.id and `user`.id = `order`.userID order by `order`.create_time desc limit 5;");
            ResultSet result = statement.executeQuery();
            while (result.next()) {
                ret.add(new Order(result.getString(2), result.getString(1), result.getString(3)));
            }
        } catch (SQLException ex) {
            System.out.println("Connect Error!");
        }
        return ret;
    }

    public List<Order> getOrder(String _username) {
        List<Order> ret = new ArrayList<Order>();
        try {
            PreparedStatement statement = conn.prepareStatement("select Username, Name, `order`.create_time from `order`, `books`, `user` where `order`.bookID = `books`.id and `user`.id = `order`.userID and `user`.`Username` = (?) order by `order`.create_time desc limit 5;");
            statement.setString(1, _username);
            ResultSet result = statement.executeQuery();
            while (result.next()) {
                ret.add(new Order(result.getString(2), result.getString(1), result.getString(3)));
            }
        } catch (SQLException ex) {
            System.out.println("Connect Error!");
        }
        return ret;
    }


    public int[] getMonthStat() {
        int[] ret = new int[13];
        try {
            PreparedStatement statement = conn.prepareStatement("select month(`order`.create_time) as month, count(id) as number from `order` where year(`order`.create_time) = year(current_time()) group by month(`order`.create_time);");
            ResultSet result = statement.executeQuery();
            while (result.next()) {
                ret[result.getInt(1)] = result.getInt(2);
            }
        } catch (SQLException ex) {
            System.out.println("Connect Error!");
        }
        return ret;
    }

}
