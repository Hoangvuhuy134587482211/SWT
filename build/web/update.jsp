<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Product Editor</title>
        <link rel="stylesheet" href="path/to/your/bootstrap.css"> <!-- Include Bootstrap CSS -->
        <style>
            body {
                margin-top: 60px;
                font-family: 'Arial', sans-serif;
                background-color: #f8f9fa;
            }

            #editProduct {
                display: flex;
                align-items: center;
                justify-content: center;
            }

            .modal-content {
                background-color: #fff;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }

            .modal-header {
                border-bottom: 1px solid #dee2e6;
                background-color: #007bff;
                color: #fff;
                padding: 15px;
                text-align: center;
                border-radius: 5px 5px 0 0;
            }

            .modal-body {
                padding: 20px;
            }

            .form-group {
                margin-bottom: 20px;
            }

            label {
                font-weight: bold;
                color: #333;
            }

            input[type="text"],
            input[type="number"],
            textarea {
                width: 100%;
                padding: 10px;
                box-sizing: border-box;
                border: 1px solid #ccc;
                border-radius: 4px;
                margin-top: 5px;
                margin-bottom: 10px;
            }

            .modal-footer {
                border-top: 1px solid #dee2e6;
                padding: 15px;
                text-align: right;
                border-radius: 0 0 5px 5px;
            }

            .btn {
                padding: 10px 20px;
                margin-left: 10px;
            }

            .btn-info {
                background-color: #17a2b8;
                color: #fff;
                border: 1px solid #17a2b8;
            }

            .btn-info:hover {
                background-color: #138496;
                border: 1px solid #138496;
            }
        </style>
    </head>
    <body>
        <div id="editProduct" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <c:set  var="c" value="${requestScope.update}"/>
                    <form action="update" method="post">
                            <div class="modal-header">						
                                <h4 class="modal-title">Edit Product</h4>
                            </div>
                            <div class="modal-body">
                                <div class="form-group">
                                    <label for="productID">ID</label>
                                    <input type="text" id="productName" name="productID" class="form-control" required readonly value="${c.pid}">
                                </div>
                                <div class="form-group">
                                    <label for="productName">Name</label>
                                    <input type="text" id="productName" name="productName" class="form-control" required value="${c.pname}">
                                </div>
                                <div class="form-group">
                                    <label for="productImage">Image</label>
                                    <input type="text" id="productImage" name="productImage" class="form-control" required value="${c.image}">
                                </div>
                                <div class="form-group">
                                    <label for="productPrice">Price</label>
                                    <input type="number" id="productPrice" name="productPrice" class="form-control" required value="${c.price}">
                                </div>
                                <div class="form-group">
                                    <label for="productTitle">Title</label>
                                    <input type="text" id="productTitle" name="productTitle" class="form-control" required value="${c.title}">
                                </div>
                                <div class="form-group">
                                    <label for="productDescription">Description</label>
                                    <input  type="text" id="productDescription" name="productDescription" class="form-control" required value="${c.description}">
                                </div>
                            </div>
                            <div class="modal-footer">
                                <a href="manageP">Cancel</a>
                                <input type="submit" class="btn btn-info" value="Save">
                            </div>
                        </form>
                </div>
            </div>
        </div>
    </body>
</html>

