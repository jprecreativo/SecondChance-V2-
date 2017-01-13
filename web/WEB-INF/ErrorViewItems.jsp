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
                    <div class="col-md-12 col-sm-12">
                        
                    </div>
                </div>
            </div>
        </div>
        <div class="for-full-back " id="footer">
            The best second-hand shop in the World Wide Web. &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &copy; jprecreativo | All Right Reserved
        </div>
    </body>
</html>
