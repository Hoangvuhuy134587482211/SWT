/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import model.Account;
import model.Cart;
import model.Category;
import model.Item;
import model.Product;

/**
 *
 * @author ADMIN
 */
public class ProductDAO extends DBContext {

    public List<Product> getAll() {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setPid(rs.getInt("pid"));
                p.setPname(rs.getString("pname"));
                p.setImage(rs.getString("image"));
                p.setPrice(rs.getInt("price"));
                p.setTitle(rs.getString("title"));
                p.setDescription(rs.getString("description"));
                p.setQuantity(rs.getInt("quantity"));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;

    }

    public List<Category> GetAllCategory() {
        List<Category> list = new ArrayList<>();
        String sql = "select * from Category";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Category c = new Category();
                c.setCid(rs.getInt("cid"));
                c.setCname(rs.getString("cname"));
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> GetCategoryByPid(int pid) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product where cateID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, pid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setPid(rs.getInt("pid"));
                p.setPname(rs.getString("pname"));
                p.setImage(rs.getString("image"));
                p.setPrice(rs.getInt("price"));
                p.setTitle(rs.getString("title"));
                p.setDescription(rs.getString("description"));
                p.setQuantity(rs.getInt("quantity"));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public Product GetProductByPid(int pid) {

        String sql = "select * from Product where pid = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, pid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setPid(rs.getInt("pid"));
                p.setPname(rs.getString("pname"));
                p.setImage(rs.getString("image"));
                p.setPrice(rs.getInt("price"));
                p.setTitle(rs.getString("title"));
                p.setDescription(rs.getString("description"));
                p.setQuantity(rs.getInt("quantity"));
                return p;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Product> getProductByName(String name) {
        List<Product> list = new ArrayList<>();
        String[] keywords = name.split("\\s+"); // Tách các từ khóa theo dấu cách

        // Tạo điều kiện SQL dựa trên số lượng từ khóa
        StringBuilder sqlBuilder = new StringBuilder("SELECT * FROM Product WHERE");
        for (int i = 0; i < keywords.length; i++) {
            sqlBuilder.append(" [pname] LIKE ?");
            if (i < keywords.length - 1) {
                sqlBuilder.append(" AND");
            }
        }

        try {
            PreparedStatement st = connection.prepareStatement(sqlBuilder.toString());

            // Bind từng từ khóa vào câu truy vấn
            for (int i = 0; i < keywords.length; i++) {
                st.setString(i + 1, "%" + keywords[i] + "%");
            }

            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                Product p = new Product();
                p.setPid(rs.getInt("pid"));
                p.setPname(rs.getString("pname"));
                p.setImage(rs.getString("image"));
                p.setPrice(rs.getInt("price"));
                p.setTitle(rs.getString("title"));
                p.setDescription(rs.getString("description"));
                p.setQuantity(rs.getInt("quantity"));
                list.add(p);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Product> getProductByPrice(int from, int to) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM Product WHERE price BETWEEN ? AND ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, from);
            st.setInt(2, to);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setPid(rs.getInt("pid"));
                p.setPname(rs.getString("pname"));
                p.setImage(rs.getString("image"));
                p.setPrice(rs.getInt("price"));
                p.setTitle(rs.getString("title"));
                p.setDescription(rs.getString("description"));
                p.setQuantity(rs.getInt("quantity"));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> getProductBySellID(int id) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM Product WHERE sell_ID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setPid(rs.getInt("pid"));
                p.setPname(rs.getString("pname"));
                p.setImage(rs.getString("image"));
                p.setPrice(rs.getInt("price"));
                p.setTitle(rs.getString("title"));
                p.setDescription(rs.getString("description"));
                p.setQuantity(rs.getInt("quantity"));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public void addOrder(Account a, Cart cart) {
        LocalDate curDate = LocalDate.now();
        String date = curDate.toString();
        String sql = "INSERT INTO [dbo].[Cart] ([AccountID], [date], [Amount])\n"
                + "VALUES (?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, a.getUid());
            st.setString(2, date);
            st.setDouble(3, cart.getTalMoney());
            st.executeUpdate();

            String sql3 = "update product set quantity = quantity-? where pid = ?";
            PreparedStatement st3 = connection.prepareStatement(sql3);
            for (Item i : cart.getItems()) {
                st3.setInt(1, i.getQuantity());
                st3.setInt(2, i.getProduct().getPid());
                st3.executeUpdate();
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void deleteProduct(int pid) {
        String sql = "DELETE FROM [dbo].[Product]\n"
                + "      WHERE pid = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, pid);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void AddProduct(String name, String image, int price, String title, String description, int quantity, int cateID, int sell_ID) {
        String sql = "INSERT INTO [dbo].[Product]\n"
                + "           ([pname]\n"
                + "           ,[image]\n"
                + "           ,[price]\n"
                + "           ,[title]\n"
                + "           ,[description]\n"
                + "           ,[quantity]\n"
                + "           ,[cateID]\n"
                + "           ,[sell_ID])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.setString(2, image);
            st.setInt(3, price);
            st.setString(4, title);
            st.setString(5, description);
            st.setInt(6, quantity);
            st.setInt(7, cateID);
            st.setInt(8, sell_ID);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }

    }

    public void UpdateProduct(int pid, String name, String image, int price, String title, String description) {
        String sql = "UPDATE [dbo].[Product]\n"
                + "   SET [pname] = ?"
                + "      ,[image] = ?"
                + "      ,[price] = ?"
                + "      ,[title] = ?"
                + "      ,[description] = ?"
                + " WHERE pid = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.setString(2, image);
            st.setInt(3, price);
            st.setString(4, title);
            st.setString(5, description);
            st.setInt(6, pid);

            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public static void main(String[] args) {
        ProductDAO pd = new ProductDAO();

    }
}
