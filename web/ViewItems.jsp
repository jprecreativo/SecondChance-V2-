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
                                <li><a href="#contact-sec">FAVOURITE ITEMS</a></li>
                            </c:if>

                            <c:if test="${sessionScope.email == null}">    
                                <li><a href="#contact-sec">SIGN UP</a></li>
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
                                <option>1.000 - 5.000</option>
                                <option>5.000 - 10.000</option>
                                <option>10.000 or more</option>
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
                                                <th>STATE</th>
                                                <th>DESCRIPTION</th>
                                                <th>ZC</th>
                                                <th>AGE</th>
                                            </tr>
                                            <c:forEach var="item" items="${requestScope.items}">
                                                <tr>
                                                    <td>${item.category}</td>
                                                    <td>${item.name}</td>
                                                    <td>${item.price}</td>
                                                    <c:choose>
                                                        <c:when test="${empty item.status}">
                                                            <td>No specified.</td>
                                                        </c:when>    
                                                        <c:otherwise>
                                                            <td>${item.status}</td>
                                                        </c:otherwise>
                                                    </c:choose>
                                                    <c:choose>
                                                        <c:when test="${empty item.description}">
                                                            <td>No specified.</td>
                                                        </c:when>    
                                                        <c:otherwise>
                                                            <td>${item.description}</td>
                                                        </c:otherwise>
                                                    </c:choose>
                                                    <c:choose>
                                                        <c:when test="${empty item.ZC}">
                                                            <td>No specified.</td>
                                                        </c:when>    
                                                        <c:otherwise>
                                                            <td>${item.ZC}</td>
                                                        </c:otherwise>
                                                    </c:choose>
                                                    <c:choose>
                                                        <c:when test="${empty item.age}">
                                                            <td>No specified.</td>
                                                        </c:when>    
                                                        <c:otherwise>
                                                            <td>${item.age}</td>
                                                        </c:otherwise>
                                                    </c:choose>
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
                    <div class="col-md-3 col-sm-3">
                        <div class="div-trans text-center">
                            <h3>Log in</h3>
                            <form>

                                <div class="col-md-12 col-sm-12">
                                    <!-- <div class="form-group">
                                        <input type="text" class="form-control" required="required" placeholder="Name">
                                    </div> -->
                                </div>
                                <div class="col-md-12 col-sm-12">
                                    <div class="form-group">
                                        <input type="text" class="form-control" required="required" placeholder="Your e-mail">
                                    </div>
                                </div>


                                <div class="col-md-12 col-sm-12">
                                    <div class="form-group">
                                        <input type="password" name="pass" id="Textarea1" required="required" class="form-control" placeholder="Your password">
                                    </div>
                                    <div class="form-group">
                                        <button type="submit" class="btn btn-success">Enter site</button>
                                    </div>
                                    <div class="form-group">
                                        <a href="#">Forget your password?</a>
                                    </div>

                                </div>

                            </form>
                        </div>

                    </div>

                </div>
            </div>
        </div>
        <!--End Header section  -->
        <!--Services Section-->
        <!-- <section  id="services">
            <div class="container">

                <div class="row text-center">
                    <div class="col-md-8 col-md-offset-2">
                        <h2>Our Services</h2>

                    </div>

                </div>

                <div class="row text-center space-pad">
                    <div class="col-md-3 col-sm-3">

                        <div >

                            <i class="fa fa-camera fa-4x main-color"></i>


                            <h3>Responsive </h3>
                            <p>
                                Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                                Curabitur nec nisl odio. Mauris vehicula at nunc id posuere.
                            </p>

                        </div>

                    </div>
                    <div class="col-md-3 col-sm-3">

                        <div >

                            <i class="fa fa-briefcase fa-4x main-color"></i>


                            <h3>100% Free </h3>
                            <p>
                                Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                                Curabitur nec nisl odio. Mauris vehicula at nunc id posuere.
                            </p>

                        </div>

                    </div>
                    <div class="col-md-3 col-sm-3">

                        <div >

                            <i class="fa fa-desktop fa-4x main-color"></i>


                            <h3>Clean Code </h3>
                            <p>
                                Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                                Curabitur nec nisl odio. Mauris vehicula at nunc id posuere.
                            </p>

                        </div>

                    </div>
                    <div class="col-md-3 col-sm-3">

                        <div>

                            <i class="fa fa-folder fa-4x main-color"></i>


                            <h3>Read to Use </h3>
                            <p>
                                Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                                Curabitur nec nisl odio. Mauris vehicula at nunc id posuere.
                            </p>

                        </div>

                    </div>
                </div>
                <div class="row ">
                    <div class="col-md-6 col-sm-6">
                        <h3>Lorem ipsum dolor sit amet</h3>
                        <p>
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                            Curabitur nec nisl odio. Mauris vehicula at nunc id posuere.
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                            Curabitur nec nisl odio. Mauris vehicula at nunc id posuere.
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit.

                        </p>
                    </div>
                    <div class="col-md-6 col-sm-6">
                        <div class="panel panel-default">

                            <div class="panel-body">
                                <ul class="nav nav-pills" style="background-color: #ECECEC;">
                                    <li class="active"><a href="#home-pills" data-toggle="tab">Home</a>
                                    </li>
                                    <li class=""><a href="#profile-pills" data-toggle="tab">Profile</a>
                                    </li>
                                    <li class=""><a href="#messages-pills" data-toggle="tab">Messages</a>
                                    </li>
                                    <li class=""><a href="#settings-pills" data-toggle="tab">Settings</a>
                                    </li>
                                </ul>

                                <div class="tab-content">
                                    <div class="tab-pane fade  active in" id="home-pills">
                                        <h4>Home Tab</h4>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,  officia deserunt mollit anim id est laborum.</p>
                                    </div>
                                    <div class="tab-pane fade" id="profile-pills">
                                        <h4>Profile Tab</h4>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,  officia deserunt mollit anim id est laborum.</p>

                                    </div>
                                    <div class="tab-pane fade" id="messages-pills">
                                        <h4>Messages Tab</h4>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,  officia deserunt mollit anim id est laborum.</p>
                                    </div>
                                    <div class="tab-pane fade" id="settings-pills">
                                        <h4>Settings Tab</h4>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,  officia deserunt mollit anim id est laborum.</p>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>

                </div>
            </div>


        </section> -->
        <!--End Services Section-->
        <!--parallax one-->
        <!-- <section  id="Parallax-one">
            <div class="container">

                <div class="row text-center">
                    <div class="col-md-8 col-md-offset-2 ">
                        <h2><i class="fa fa-desktop fa-3x"></i>&nbsp;Just Space </h2>
                        <h4>
                            <strong>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                                Curabitur nec nisl odio. Mauris vehicula at nunc id posuere.
                            </strong>
                        </h4>
                    </div>

                </div>


            </div>
        </section> -->
        <!--./parallax one-->
        <!-- Pricing Section -->
        <!-- <section  id="price-sec">
            <div class="container">
                <div class="row text-center">
                    <div class="col-md-8 col-md-offset-2">

                        <h2>Pricing Options</h2>
                        <h4>
                            <strong>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                                Curabitur nec nisl odio. Mauris vehicula at nunc id posuere.
                            </strong>
                        </h4>
                    </div>

                </div>
                <div class="row text-center">

                    <div class="col-md-12 ">



                        <div class="col-md-3 col-sm-6">
                            <ul class="plan ">
                                <li class="plan-head">BASIC PLAN</li>
                                <li class="main-price">$99 only</li>
                                <li><strong>120 </strong>Users</li>
                                <li><strong>10 </strong>Emails</li>
                                <li><strong>12GB </strong>Spacce</li>
                                <li class="bottom">
                                    <a href="#contact-sec" class="btn btn-warning">SIGNUP HERE</a>
                                </li>
                            </ul>
                        </div>

                        <div class="col-md-3 col-sm-6">
                            <ul class="plan plan-active">
                                <li class="plan-head head-active ">SIMPLE PLAN</li>
                                <li class="main-price">$199 only</li>
                                <li><strong>120 </strong>Users</li>
                                <li><strong>10 </strong>Emails</li>
                                <li><strong>12GB </strong>Spacce</li>
                                <li class="bottom">
                                    <a href="#contact-sec" class="btn btn-primary">SIGNUP HERE</a>
                                </li>
                            </ul>
                        </div>
                        <div class="col-md-3 col-sm-6">
                            <ul class="plan">
                                <li class="plan-head">VALUE PLAN</li>
                                <li class="main-price">$299 only</li>
                                <li><strong>120 </strong>Users</li>
                                <li><strong>10 </strong>Emails</li>
                                <li><strong>12GB </strong>Spacce</li>
                                <li class="bottom">
                                    <a href="#contact-sec" class="btn btn-danger">SIGNUP HERE</a>
                                </li>
                            </ul>
                        </div>

                        <div class="col-md-3 col-sm-6">
                            <ul class="plan">
                                <li class="plan-head">ADVANCE PLAN</li>
                                <li class="main-price">$399 only</li>
                                <li><strong>120 </strong>Users</li>
                                <li><strong>10 </strong>Emails</li>
                                <li><strong>12GB </strong>Spacce</li>
                                <li class="bottom">
                                    <a href="#contact-sec" class="btn btn-success">SIGNUP HERE</a>
                                </li>
                            </ul>
                        </div>

                    </div>
                </div>


            </div>
        </section> -->
        <!--End Pricing Section -->
        <!--parallax two-->
        <!-- <section  id="Parallax-two">
            <div class="container">

                <div class="row text-center">
                    <div class="col-md-8 col-md-offset-2 ">
                        <h2><i class="fa fa-briefcase fa-3x"></i>&nbsp;Just Space </h2>
                        <h4>
                            <strong>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                                Curabitur nec nisl odio. Mauris vehicula at nunc id posuere.
                            </strong>
                        </h4>
                    </div>

                </div>


            </div>
        </section> -->
        <!--./parallax two-->


        <!-- Contact Section -->
        <!-- <section  id="contact-sec">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">

                        <div id="social-icon">
                            <strong> Address:</strong> 124/56 , Your Street Lane, USA.
                            <a href="#"><i class="fa fa-facebook fa-2x"></i></a>
                            <a href="#"><i class="fa fa-twitter fa-2x"></i></a>
                            <a href="#"><i class="fa fa-linkedin fa-2x"></i></a>
                            <a href="#"><i class="fa fa-google-plus fa-2x"></i></a>
                            <a href="#"><i class="fa fa-pinterest fa-2x"></i></a>
                        </div>
                    </div>


                </div>
            </div>
        </section> -->

        <!--End Contact Section -->
        <!--footer Section -->
        <div class="for-full-back " id="footer">
            The best second-hand shop in the World Wide Web. &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &copy; jprecreativo | All Right Reserved
        </div>
        <script src="JS/ViewItems.js"></script>
    </body>
</html>
