/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Account;

/**
 *
 * @author ADMIN
 */
public class AccountDAO extends DBContext {

    public Account GetAccount(String user, String pass) {

        String sql = "select * from Account where [user] = ? and pass = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user);
            st.setString(2, pass);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Account a = new Account();
                a.setUid(rs.getInt("uid"));
                a.setUser(rs.getString("user"));
                a.setPass(rs.getString("pass"));
                a.setIsSell(rs.getInt("isSell"));
                a.setIsAdmin(rs.getInt("isAdmin"));
                return a;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Account> getAllAccount() {
        List<Account> list = new ArrayList<>();
        String sql = "select * from Account";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Account a = new Account();
                a.setUid(rs.getInt("uid"));
                a.setUser(rs.getString("user"));
                a.setPass(rs.getString("pass"));
                a.setIsSell(rs.getInt("isSell"));
                a.setIsAdmin(rs.getInt("isAdmin"));
                list.add(a);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;

    }

    public Account CheckAccountByName(String user) {

        String sql = "select * from Account where [user] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Account a = new Account();
                a.setUid(rs.getInt("uid"));
                a.setUser(rs.getString("user"));
                a.setPass(rs.getString("pass"));
                a.setIsSell(rs.getInt("isSell"));
                a.setIsAdmin(rs.getInt("isAdmin"));
                return a;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public Account CheckAccountByID(String uid) {

        String sql = "select * from Account where uid = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, uid);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Account a = new Account();
                a.setUid(rs.getInt("uid"));
                a.setUser(rs.getString("user"));
                a.setPass(rs.getString("pass"));
                a.setIsSell(rs.getInt("isSell"));
                a.setIsAdmin(rs.getInt("isAdmin"));
                return a;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void Update(int uid, String user, String pass) {
        String sql = "UPDATE [dbo].[Account]\n"
                + "   SET [user] = ?\n"
                + "      ,[pass] = ?\n"
                + " WHERE uid = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user);
            st.setString(2, pass);
            st.setInt(3, uid);
            st.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void Delete(int uid) {
        String sql = "DELETE FROM [dbo].[Account]\n"
                + "      WHERE uid =?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, uid);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void SingUp(String user, String pass) {
        String sql = "INSERT INTO [dbo].[Account]\n"
                + "           ([user]\n"
                + "           ,[pass]\n"
                + "           ,[isSell]\n"
                + "           ,[isAdmin])\n"
                + "     VALUES\n"
                + "           (?,?,0,0)";
        try {
            // Insert into Account table
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user);
            st.setString(2, pass);
            st.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);  // Handle the exception appropriately in a real application
        }
    }

    public static void main(String[] args) {
        String user = "hai123";
        String pass = "123";
        AccountDAO ad = new AccountDAO();
//        ad.SingUp(user, pass);
        Account a = ad.CheckAccountByName(user);
        System.out.println(a.getUser());

    }
}
