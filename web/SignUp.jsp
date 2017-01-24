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
                                <li><a href="/SecondChance/FavouriteItems.jsp">FAVOURITE ITEMS</a></li>
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
                             
                           <div class="div-trans-sign-up text-center">
                           
                                <h3>Register</h3>
                                <form method="POST" onsubmit="return validate();" action="SignUp">
                                    <div class="col-md-12 col-sm-12">
                                        <div class="form-group">
                                            <input name="email" id="emailValue" type="email" class="form-control" required="required" placeholder="Your e-mail (required)">
                                        </div>
                                        <div class="form-group">
                                            <input type="password" pattern="(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$" name="pass" id="pass" required="required" class="form-control" placeholder="Your password (required)">
                                        </div>
                                        <div class="form-group">
                                            <input type="password" pattern="(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$" name="passConfimation" id="passConfirmation" required="required" class="form-control" placeholder="Repeat password (required)">
                                        </div>
                                        <div class="form-group">
                                            <input name="fullName" type="text" class="form-control" placeholder="Full name here">
                                        </div>
                                        <div class="form-group">
                                            <input name="address" type="text" class="form-control" placeholder="Your address">
                                        </div>
                                        <div class="form-group">
                                            <input name="ZC" id="ZC_value" type="text" class="form-control" pattern="[0-9]{*}" placeholder="Zip or postal code here">
                                        </div>
                                        <div class="form-group">
                                            <input id="FB" type="text" pattern="^[a-z\d\.]{5,}$" class="form-control" placeholder="Your Facebook user name">
                                        </div>
                                        <div class="form-group">
                                            <input id="TW" type="text" class="form-control" pattern="^@[a-zA-Z0-9]+$" placeholder="Your '@' in Twitter">
                                        </div>
                                        <div class="form-group">
                                            <input name="phoneNumber" id="phoneNumber" type="text" class="form-control" pattern="[0-9]{9}" placeholder="Phone number">
                                        </div>
                                        <div class="form-group">
                                            <img id="imgCaptcha" alt="Captcha"/> &nbsp;
                                            <input type="text" required="required" id="captchaText" placeholder="Enter here captcha characters"> &nbsp;
                                            <img title="Reload captcha" id="refreshCaptcha" src="images/refresh.png" alt="refresh">
                                        </div> <br>
                                        <div class="form-group">
                                            <button type="submit" class="btn btn-success">Register now!</button>
                                        </div>
                                        

                                    </div>

                                </form>
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


                </div>
            </div>
        </div>
      
        <div class="for-full-back " id="footer">
            The best second-hand shop in the World Wide Web. &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &copy; jprecreativo | All Right Reserved
        </div>
        <script src="JS/SignUp.js"></script>
    </body>
</html>

