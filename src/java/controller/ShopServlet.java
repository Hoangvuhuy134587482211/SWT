/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.ProductDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
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
public class ShopServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
response.setContentType("text/html;charset=UTF-8");
        ProductDAO h = new ProductDAO();
        List<Product> list = h.getAll();
        request.setAttribute("data", list);
        List<Category> listCategory = h.GetAllCategory();
        request.setAttribute("category", listCategory);
        Cookie[] arr = request.getCookies();
        String txt = ""; // Initialiser avec une chaîne vide par défaut
        HttpSession session = request.getSession();
        Account a = (Account) session.getAttribute("account");
        String namecookie="";
        if(a==null){
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }else{
            namecookie+="cart"+a.getUid();
        }
        Product p = new Product();
        if (arr != null) {
            for (Cookie o : arr) {
                if (o.getName().equalsIgnoreCase(namecookie) && o.getValue() != null) {
                    txt = o.getValue(); 
                }
            }
        }

        if (txt.equals("null")) {
            txt = ""; 
        }
        Cart cart = new Cart(txt, list);
        List<Item> listItem = cart.getItems();
        int n;
        if (listItem != null) {
            n = listItem.size();

        } else {
            n = 0;

        }
        request.setAttribute("size", n);
        request.getRequestDispatcher("Shop.jsp").forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
