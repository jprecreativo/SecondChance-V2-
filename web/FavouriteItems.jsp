<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>

<!DOCTYPE html>

<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <meta name="description" content="Find and share second hand items. Give them another opportunity!">
        <meta name="author" content="jprecreativo">

        <title>Second chance, the best second-hand site!</title>
        <!--REQUIRED STYLE SHEETS-->
        <!-- BOOTSTRAP CORE STYLE CSS -->
        <link href="CSS/bootstrap.css" rel="stylesheet" />
        <!-- FONTAWESOME STYLE CSS -->
        <link href="CSS/font-awesome.min.css" rel="stylesheet" />
        <!-- CUSTOM STYLE CSS -->
        <link href="CSS/style.css" rel="stylesheet" />
        <!-- GOOGLE FONT -->
        <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
          <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
        <![endif]-->
        <link rel="shortcut icon" href="images/favicon.ico" />
    </head>
    <body>
        <!-- Navigation -->
        <header>
            <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
                <div class="container">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <img src="images/second-chance.jpg" alt="SecondChance Logo">
                    </div>
                    <!-- Collect the nav links for toggling -->
                    <div class="collapse navbar-collapse navbar-ex1-collapse">
                        <ul class="nav navbar-nav navbar-right">
                            <li><a href="/SecondChance">HOME</a>
                            </li>
                            <li><a href="/SecondChance/ViewItems">VIEW ITEMS</a>
                            </li>

                            <c:if test="${sessionScope.email != null}">
                                <li><a href="/SecondChance/NewItem.jsp">NEW ITEM</a></li>
                                <li><a href="/SecondChance/FavouriteItems">FAVOURITE ITEMS</a></li>
                            </c:if>

                            <c:if test="${sessionScope.email == null}">    
                                <li><a href="/SecondChance/SignUp.jsp">SIGN UP</a></li>
                            </c:if>    
                        </ul>
                    </div>
                    <!-- /.navbar-collapse -->
                </div>
                <!-- /.container -->
            </nav>
        </header>
        <!--End Navigation -->

        <!--Header section  -->
        <div id="home">
            <div class="container" >
                <div class="row ">
                    <div class="col-md-9 col-sm-9">
                        <!-- <h1 class="head-main">The Real Time</h1>
                        <span class="head-sub-main">Lorem ipsum dolor</span> -->
                        <div class="head-last">
                            <h1>Items</h1>
                            <button id="filterButton" name="filterButton" type="button" class="btn btn-default btn-sm" value="filterButton">
                                <span ><img src="images/filter.gif" alt="filter"></span> &nbsp; Filter 
                            </button>
                            &nbsp;
                            Category:
                            <select id="categorySelect" name="categorySelect" size="1">
                                <option>ALL</option>
                                <option>BOOKS</option>
                                <option>COMPUTING</option>
                                <option>FURNITURE</option>
                                <option>GAMES</option>
                                <option>TOYS</option>
                                <option>VEHICLES</option>
                                <option>OTHERS</option>
                            </select>
                            &nbsp;
                            Price:
                            <select id="priceSelect" name="priceSelect" size="1">
                                <option>ALL</option>
                                <option>0 - 10</option>
                                <option>10 - 20</option>
                                <option>20 - 30</option>
                                <option>30 - 40</option>
                                <option>40 - 50</option>
                                <option>50 - 100</option>
                                <option>100 - 500</option>
                                <option>500 - 1000</option>
                                <option>1000 - 5000</option>
                                <option>5000 - 10000</option>
                                <option>10000 - 100000</option>
                            </select>
                            &nbsp;
                            Zip code:
                            <input name="zipCode" id="zipCode" type="text"/>
                            &nbsp;
                            <input type="button" id="noFilterButton" value="No filter"/>
                            <div class="help-tip">
                                <p>You can filter by item category, price or zip code or not filter. Filter's fields must be valid.</p>
                            </div>
                            <br><br>
                            <div id="tableAJAX">
                                <c:choose>
                                    <c:when test="${!empty requestScope.items}">
                                        <table border='1'>
                                            <tr>
                                                <th>CATEGORY</th>
                                                <th>NAME</th>
                                                <th>PRICE</th>
                                                <th>ZC</th>
                                                <th>DETAILS</th>
                                            </tr>
                                            <c:forEach var="item" items="${requestScope.items}">
                                                <tr>
                                                    <td>${item.category}</td>
                                                    <td>${item.name}</td>
                                                    <td>${item.price}</td>
                                                    
                                                   
                                                    <c:choose>
                                                        <c:when test="${empty item.ZC or item.ZC eq '0'}">
                                                            <td>No specified.</td>
                                                        </c:when>    
                                                        <c:otherwise>
                                                            <td>${item.ZC}</td>
                                                        </c:otherwise>
                                                    </c:choose>
                                                   
                                                    <td><a href="/SecondChance/Details?id=${item.id}">View details</a></td>
                                                </tr>
                                            </c:forEach>
                                        </table>
                                    </c:when>
                                    <c:otherwise>
                                        <p>There are no items.</p>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                        
                    </div>
                    <c:if test="${sessionScope.email == null}">
                        <div class="col-md-3 col-sm-3">
                            <div class="div-trans text-center">
                                <h3>Log in</h3>
                                <form method="POST" action="LogIn">
                                    <div class="col-md-12 col-sm-12">
                                        <div class="form-group">
                                            <input type="text" name="enterEmail" id="enterEmail" class="form-control" required="required" placeholder="Your e-mail">
                                        </div>

                                        <div class="form-group">
                                            <input type="password" name="enterPass" id="enterPass" required="required" class="form-control" placeholder="Your password">
                                        </div>
                                        <div class="form-group">
                                            <input type="submit" id="enter-site" class="btn btn-success" value="Enter site"/>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </c:if>
                    <c:if test="${sessionScope.email != null}">
                        <div class="col-md-3 col-sm-3">
                            <div class="div-trans text-center">
                                <h3>Welcome, "${sessionScope.email}"</h3>
                                <h5>We hope that you enjoy in this session. Remember favourite items are deleted when you log out.</h5>
                                <form method="POST" action="LogOut">
                                    <div class="col-md-12 col-sm-12">
                                        <div class="form-group">
                                            <input type="submit" id="leave-site" class="btn btn-success" value="Log out"/>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </c:if>

                </div>
            </div>
        </div>
      
        <div class="for-full-back " id="footer">
            The best second-hand shop in the World Wide Web. &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &copy; jprecreativo | All Right Reserved
        </div>
    </body>
</html>

