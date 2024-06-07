<%-- 
    Document   : mycart
    Created on : Mar 13, 2024, 11:31:59 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            body {
                font-family: Arial, sans-serif;
            }

            h1 {
                text-align: center;
            }

            table {
                width: 100%;
                border-collapse: collapse;
            }

            th, td {
                padding: 8px;
                text-align: left;
            }

            th {
                background-color: #f2f2f2;
            }
            td.image-column img {
                width: 30%;
                height: auto; /* Cela garantit que la hauteur est ajustée proportionnellement à la largeur */
            }


            .quantity-buttons {
                display: flex;
                justify-content: space-between; /* Place les boutons avec un espace égal entre eux */
                align-items: center; /* Centre les boutons verticalement */
            }


            tr:nth-child(even) {
                background-color: #f2f2f2;
            }

            tr:hover {
                background-color: #ddd;
            }

            button {
                background-color: #4CAF50;
                color: white;
                border: none;
                padding: 5px 10px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 14px;
                margin: 4px 2px;
                cursor: pointer;
                border-radius: 5px;
            }

            button a {
                color: white;
                text-decoration: none;
            }

            button:hover {
                background-color: #45a049;
            }

            input[type="submit"] {
                background-color: #008CBA;
                color: white;
                padding: 8px 20px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 16px;
                margin: 4px 2px;
                cursor: pointer;
                border-radius: 5px;
            }

            input[type="submit"]:hover {
                background-color: #005F6B;
            }


        </style>
    </head>
    <body>
        <h1>Shopping cart online</h1>
        <table border="1px" width="40%">
            <tr>
                <th>No</th>
                <th>Name</th>
                <th>Image</th>
                <th>Quantity</th>
                <th>Price</th>
                <th>Total Money</th>
                <th>Action</th>
            </tr>
            <c:set var="namecookie" value="${requestScope.namecookie}" />
            <c:set var="o" value="${requestScope[namecookie]}" />

            <c:set var="tt" value="0"/>
            <c:forEach items="${o.items}" var="i">
                <c:set var="tt" value="${tt+1}"/>
                <tr>
                    <td>${tt}</td>
                    <td>${i.product.pname}</td>
                    <td class="image-column"><img src="${i.product.image}" alt="Product Image"></td>


                    <td class="quantity-cell">
                        <div class="quantity-buttons">

                            ${i.quantity}

                        </div>
                    </td>

                    <td class="tr">
                        <fmt:formatNumber pattern="##.#" value="${(i.price)}"/></td>
                    </td>
                    <td class="tr">
                        <fmt:formatNumber pattern="##.#" value="${(i.price*i.quantity)}"/></td>
                    </td>
                    <td style="text-align: center">
                        <form action="process" method="post">
                            <input type="hidden" name="id" value="${i.product.pid}"/>
                            <input type="submit"  value="return item"/>
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <h3>Total money:$ ${o.talMoney}</h3>
        <hr/>
        <form action="checkout">
            <input type="submit" value="Check out"/>
        </form>
        <hr/>
        <a href="shop">Click Me To Continue Shopping</a>


        <h3 style="color: red">${requestScope.msg}<h3>
                </body>
                </html>
