<%-- 
    Document   : home
    Created on : Mar 5, 2024, 4:23:08 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="zxx">

    <head>
        <meta charset="UTF-8">
        <meta name="description" content="Male_Fashion Template">
        <meta name="keywords" content="Male_Fashion, unica, creative, html">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Male-Fashion | Template</title>

        <!-- Google Font -->
        <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&display=swap"
              rel="stylesheet">

        <!-- Css Styles -->
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
        <link rel="stylesheet" href="css/magnific-popup.css" type="text/css">
        <link rel="stylesheet" href="css/nice-select.css" type="text/css">
        <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
        <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
        <link rel="stylesheet" href="css/style.css" type="text/css">
    </head>

    <body>
        <!-- Page Preloder -->
        <div id="preloder">
            <div class="loader"></div>
        </div>

        <!-- Offcanvas Menu Begin -->

        <!-- Offcanvas Menu End -->

        <!-- Header Section Begin -->
        <header class="header">           
            <div class="container">
                <div class="row">
                    <div class="col-lg-3 col-md-3">
                        <div class="header__logo">
                            <a href="home"><img src="img/Sealogo.png" alt=""></a>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6">
                        <nav class="header__menu mobile-menu">
                            <ul>
                                <li class="active"><a href="home">Home</a></li>
                                <li ><a href="shop">Shop</a></li>
                                    <c:if test="${sessionScope.account==null}">
                                    <li> <a href="login.jsp">Login</a></li>
                                    </c:if>
                                    <c:if test="${sessionScope.account!=null}">
                                    <li> <a href="logout">Logout</a></li>
                                    </c:if>
                                    <c:if test="${sessionScope.account.isSell==1}">
                                    <li><a href="manageP">Manager Product</a></li>
                                    </c:if>
                                    <c:if test="${sessionScope.account.isAdmin==1}">
                                    <li><a href="mnaccount">Manager Account</a></li>
                                    </c:if>
                            </ul>



                            </ul>
                        </nav>
                    </div>

                    <div class="col-lg-3 col-md-3">
                        <div class="header__nav__option">
                            <a href="show" style="margin-top: 8px;"><img src="img/icon/cart.png" alt=""> </a>
                                <c:if test="${sessionScope.account!=null}">
                                <p style="margin-top: 10px;color:red;">Hello ${sessionScope.account.user}</p>
                            </c:if>
                        </div>
                    </div>
                </div>
                <div class="canvas__open"><i class="fa fa-bars"></i></div>
            </div>
        </header>
        <!-- Header Section End -->

        <!-- Hero Section Begin -->
        <section class="hero">
            <div class="hero__slider owl-carousel">
                <c:forEach items="${requestScope.data}" var="c">
                    <c:if test="${c.pid == 1}">
                        <div class="hero__items set-bg" data-setbg="img/hero/guitar.png">
                            <div class="container">

                                <div class="row">
                                    <div class="col-xl-5 col-lg-7 col-md-8">
                                        <div class="hero__text">
                                            <h3 style="color: #1da1f2; font-weight: bold;">${c.pname}</h3> <!-- Giả sử tên của trường là productName -->
                                            <h2 style="color: red">Sale ${c.price} $</h2>
                                            <p style="font-weight: bold">Rosen G13BL là phiên bản nâng cấp của R135. Với mặt top được làm bằng gỗ thịt nguyên tấm (thay vì gỗ ép như trên R135). Việc sử dụng gỗ thịt nguyên tấm cho âm thanh và độ bền tăng lên rất nhiều mà giá chi cao hơn một chút so với R135.</p>
                                            <a href="shop" class="primary-btn">Shop now <span class="arrow_right"></span></a>
                                            <div class="hero__social">
                                                <a href="#"><i class="fa fa-facebook"></i></a>
                                                <a href="#"><i class="fa fa-twitter"></i></a>
                                                <a href="#"><i class="fa fa-pinterest"></i></a>
                                                <a href="#"><i class="fa fa-instagram"></i></a>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </c:if>
                </c:forEach>
                <c:forEach items="${requestScope.data}" var="c">
                    <c:if test="${c.pid == 2}">
                        <div class="hero__items set-bg" data-setbg="img/hero/piano.png">
                            <div class="container">

                                <div class="row">
                                    <div class="col-xl-5 col-lg-7 col-md-8">
                                        <div class="hero__text">
                                            <h3 style="color: #1da1f2; font-weight: bold;">${c.pname}</h3> <!-- Giả sử tên của trường là productName -->
                                            <h2 style="color: red">Sale ${c.price} $</h2>
                                            <p style="font-weight: bold">Đàn piano điện Dynatone SLP 150 có chất lượng âm thanh tuyệt vời nhờ vào công nghệ xử lý âm thanh tốt nhất hiện nay. Ngoài chất lượng âm thanh, Dynatone SLP 150 còn có thiết kế đẹp mắt, nhỏ gọn nên rất phù hợp với mọi diện tích căn nhà, góp phần tô điểm cho không gian sống của bạn thêm sinh động.</p>
                                            <a href="shop" class="primary-btn">Shop now <span class="arrow_right"></span></a>
                                            <div class="hero__social">
                                                <a href="#"><i class="fa fa-facebook"></i></a>
                                                <a href="#"><i class="fa fa-twitter"></i></a>
                                                <a href="#"><i class="fa fa-pinterest"></i></a>
                                                <a href="#"><i class="fa fa-instagram"></i></a>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </c:if>
                </c:forEach>
                <c:forEach items="${requestScope.data}" var="c">
                    <c:if test="${c.pid == 3}">
                        <div class="hero__items set-bg" data-setbg="img/hero/organ.png">
                            <div class="container">

                                <div class="row">
                                    <div class="col-xl-5 col-lg-7 col-md-8">
                                        <div class="hero__text">
                                            <h3 style="color: #1da1f2; font-weight: bold;">${c.pname}</h3> <!-- Giả sử tên của trường là productName -->
                                            <h2 style="color: red">Sale ${c.price} $</h2>
                                            <p style="font-weight: bold">Đàn Organ Kurzweil KP100 là mẫu đàn organ được biết đến nhiều nhất của thương hiệu Kurzweil. Với hơn 600 tiếng đàn và hơn 200 tiết tấu, KP100 là một trong những mẫu organ chất lượng dành cho người mới bắt đầu cũng như những người đam mê âm nhạc.</p>
                                            <a href="shop" class="primary-btn">Shop now <span class="arrow_right"></span></a>
                                            <div class="hero__social">
                                                <a href="#"><i class="fa fa-facebook"></i></a>
                                                <a href="#"><i class="fa fa-twitter"></i></a>
                                                <a href="#"><i class="fa fa-pinterest"></i></a>
                                                <a href="#"><i class="fa fa-instagram"></i></a>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </c:if>
                </c:forEach>
                <c:forEach items="${requestScope.data}" var="c">
                    <c:if test="${c.pid == 4}">
                        <div class="hero__items set-bg" data-setbg="img/hero/violin.png">
                            <div class="container">

                                <div class="row">
                                    <div class="col-xl-5 col-lg-7 col-md-8">
                                        <div class="hero__text">
                                            <h3 style="color: #1da1f2; font-weight: bold;">${c.pname}</h3> <!-- Giả sử tên của trường là productName -->
                                            <h2 style="color: red">Sale ${c.price} $</h2>
                                            <p style="font-weight: bold">Đàn violin Shifen SV-401 sản xuất tại Trung Quốc, được chế tác thủ công bằng loại gỗ tốt bảo quản tự nhiên trong 6 năm theo tiêu chuẩn Ý, thân đàn được làm từ gỗ vân sam, lưng đàn được làm từ gỗ phong, bàn phím làm từ gỗ mun tinh xảo. Đàn sở hữu kiểu dáng sang trọng, có âm thanh chuẩn mực để tập luyện, được thiết kế chuẩn có nhiều kích cỡ đàn để cho người chơi có thể lựa chọn. Với khá thành khá rẻ, mẫu violin này luôn là sự lựa chọn hàng đầu cho các bạn mới chơi.</p>
                                            <a href="shop" class="primary-btn">Shop now <span class="arrow_right"></span></a>
                                            <div class="hero__social">
                                                <a href="#"><i class="fa fa-facebook"></i></a>
                                                <a href="#"><i class="fa fa-twitter"></i></a>
                                                <a href="#"><i class="fa fa-pinterest"></i></a>
                                                <a href="#"><i class="fa fa-instagram"></i></a>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </c:if>
                </c:forEach>
            </div>
        </section>
        <!-- Hero Section End -->

        <!-- Banner Section Begin -->
        <section class="banner spad">



            <div class="container">
                <div class="row">
                    <c:forEach items="${requestScope.data}" var="c">
                        <c:if test="${c.pid==1}">
                            <div class="col-lg-7 offset-lg-4">
                                <div class="banner__item">
                                    <div class="banner__item__pic">
                                        <img src="img/banner/guitar.png" alt="">
                                    </div>
                                    <div class="banner__item__text">
                                        <h2>Guitar</h2>
                                        <a href="shop">Shop now</a>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                    <c:forEach items="${requestScope.data}" var="c">
                        <c:if test="${c.pid==2}">
                            <div class="col-lg-5">
                                <div class="banner__item banner__item--middle">
                                    <div class="banner__item__pic">
                                        <img src="img/banner/piano.png" alt="">
                                    </div>
                                    <div class="banner__item__text">
                                        <h2>Piano</h2>
                                        <a href="shop">Shop now</a>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                    <c:forEach items="${requestScope.data}" var="c">
                        <c:if test="${c.pid==3}">
                            <div class="col-lg-7">
                                <div class="banner__item banner__item--last">
                                    <div class="banner__item__pic">
                                        <img src="img/banner/organ.png" alt="">
                                    </div>
                                    <div class="banner__item__text">
                                        <h2>Organ</h2>
                                        <a href="shop">Shop now</a>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                    <c:forEach items="${requestScope.data}" var="c">
                        <c:if test="${c.pid==4}">
                            <div class="col-lg-7">
                                <div class="banner__item banner__item--last">
                                    <div class="banner__item__pic">
                                        <a href="shop">
                                            <img src="img/banner/violin.png" alt="Violin Image">
                                        </a>
                                    </div>
                                    <div class="banner__item__text">
                                        <h2>Violin</h2>
                                        <a href="shop">Shop now</a>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
            </div>
        </section>
        <!-- Banner Section End -->


        <!-- Product Section End -->

        <!-- Latest Blog Section End -->

        <!-- Footer Section Begin -->
        <footer class="footer">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3 col-md-6 col-sm-6">
                        <div class="footer__about">
                            <div class="footer__logo">
                                <a href="#"><img src="img/Sealogo.png" alt=""></a>
                            </div>
                            <p>The customer is at the heart of our unique business model, which includes design.</p>
                            <a href="#"><img src="img/payment.png" alt=""></a>
                        </div>
                    </div>
                    <div class="col-lg-2 offset-lg-1 col-md-3 col-sm-6">
                        <div class="footer__widget">
                            <h6>Shopping</h6>
                            <ul>
                                <li><a href="#">Clothing Store</a></li>
                                <li><a href="#">Trending Shoes</a></li>
                                <li><a href="#">Accessories</a></li>
                                <li><a href="#">Sale</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-3 col-sm-6">
                        <div class="footer__widget">
                            <h6>Shopping</h6>
                            <ul>
                                <li><a href="#">Contact Us</a></li>
                                <li><a href="#">Payment Methods</a></li>
                                <li><a href="#">Delivary</a></li>
                                <li><a href="#">Return & Exchanges</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-3 offset-lg-1 col-md-6 col-sm-6">
                        <div class="footer__widget">
                            <h6>NewLetter</h6>
                            <div class="footer__newslatter">
                                <p>Be the first to know about new arrivals, look books, sales & promos!</p>
                                <form action="#">
                                    <input type="text" placeholder="Your email">
                                    <button type="submit"><span class="icon_mail_alt"></span></button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 text-center">
                        <div class="footer__copyright__text">
                            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                            <p>Copyright ©
                                <script>
                                    document.write(new Date().getFullYear());
                                </script>2020
                                All rights reserved | This template is made with <i class="fa fa-heart-o"
                                                                                    aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
                            </p>
                            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                        </div>
                    </div>
                </div>
            </div>
        </footer>
        <!-- Footer Section End -->

        <!-- Search Begin -->
        <div class="search-model">
            <div class="h-100 d-flex align-items-center justify-content-center">
                <div class="search-close-switch">+</div>
                <form class="search-model-form">
                    <input type="text" id="search-input" placeholder="Search here.....">
                </form>
            </div>
        </div>
        <!-- Search End -->

        <!-- Js Plugins -->
        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.nice-select.min.js"></script>
        <script src="js/jquery.nicescroll.min.js"></script>
        <script src="js/jquery.magnific-popup.min.js"></script>
        <script src="js/jquery.countdown.min.js"></script>
        <script src="js/jquery.slicknav.js"></script>
        <script src="js/mixitup.min.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/main.js"></script>
    </body>

</html>
