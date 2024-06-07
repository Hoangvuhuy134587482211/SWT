/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ADMIN
 */
public class Cart {

    private List<Item> items;

    public Cart() {
        items = new ArrayList<>();
    }

    public List<Item> getItems() {
        return items;
    }

    public int getQuantityById(int id) {
        return getItemById(id).getQuantity();
    }

    private Item getItemById(int id) {
        for (Item i : items) {
            if (i.getProduct().getPid() == id) {
                return i;
            }
        }
        return null;
    }

    public void addItem(Item t) {
        if (getItemById(t.getProduct().getPid()) != null) {
            Item m = getItemById(t.getProduct().getPid());
            m.setQuantity(m.getQuantity() + t.getQuantity());
        }else{
            items.add(t);
        }
    }
    public void removeItem(int id){
        if(getItemById(id)!=null){
            items.remove(getItemById(id));
        }
    }
    public double getTalMoney(){
        double t =0;
        for (Item i : items) {
            t+=(i.getQuantity()*i.getPrice());          
        }
        return t;
    }
    private Product getProductById(int id,List<Product> list){
        for(Product i:list){
            if(i.getPid()==id){
                return i;
            }
        }
        return null;
    }
    public Cart(String txt, List<Product> list) {
    items = new ArrayList<>();
    if (txt != null && !txt.equals("null") && !txt.isEmpty()) { // Check if txt is not null, not "null", and not empty 1:5/2:2
        String[] s = txt.split("/");
        for (String i : s) {
            String[] n = i.split(":");
            if (n.length == 2) { // Ensure that n has exactly two elements
                try {
                    int id = Integer.parseInt(n[0]);
                    int quantity = Integer.parseInt(n[1]);
                    Product p = getProductById(id, list);
                    if (p != null) { // Check if the product is found
                        Item t = new Item(p, quantity, p.getPrice());
                        addItem(t);
                    } else {
                        // Handle case where product with given id is not found
                    }
                } catch (NumberFormatException e) {
                    // Handle case where id or quantity is not a valid integer
                    e.printStackTrace(); // Or log the error
                }
            } else {
                // Handle invalid format of input string
            }
        }
    }
}

}
