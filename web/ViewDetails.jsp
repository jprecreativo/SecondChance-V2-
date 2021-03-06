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

                            <c:forEach var="item" items="${requestScope.items}">
                                <h1>${item.name} details</h1>
                            </c:forEach>


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
                                                <c:if test="${sessionScope.email != null}">
                                                    <th>FAVOUTITE</th>
                                                </c:if>

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

                                                    <c:set var="contains" value="false" />
                                                    <c:forEach var="fav" items="${sessionScope.favourites}">
                                                        <c:if test="${fav.name eq item.name}">
                                                            <c:set var="contains" value="true" />
                                                        </c:if>
                                                    </c:forEach>

                                                    <c:if test="${sessionScope.email != null}">
                                                        <c:choose>

                                                            <c:when test="${contains}">
                                                                <td><a href="/SecondChance/Favourites/Remove?id=${item.id}">Remove</a></td>
                                                            </c:when>    
                                                            <c:otherwise>
                                                                <td><a href="/SecondChance/Favourites/Add?id=${item.id}">Add</a></td>
                                                            </c:otherwise>

                                                        </c:choose>
                                                        
                                                        
                                                    </c:if>
                                                    

                                                </tr>
                                            </c:forEach>
                                        </table>
                                    </c:when>
                                    <c:otherwise>
                                        <p>There are no items.</p>
                                    </c:otherwise>
                                </c:choose>

                                <br>       

                                <c:forEach var="item" items="${requestScope.items}">
                                    <h5>
                                        <b>Product state: </b> &nbsp; 

                                        <c:choose>
                                            <c:when test="${empty item.status}">
                                                No specified.
                                            </c:when>    
                                            <c:otherwise>
                                                ${item.status}
                                            </c:otherwise>
                                        </c:choose>
                                    </h5>
                                    <h5>
                                        <b>Product age: </b> &nbsp; 

                                        <c:choose>
                                            <c:when test="${empty item.age or item.age eq '0'}">
                                                No specified.
                                            </c:when>    
                                            <c:otherwise>
                                                ${item.age} year(s).
                                            </c:otherwise>
                                        </c:choose>
                                    </h5> <br>
                                    <p>
                                        <b>Product description: </b> &nbsp;

                                        <c:choose>
                                            <c:when test="${empty item.description}">
                                                No specified.
                                            </c:when>    
                                            <c:otherwise>
                                                ${item.description}
                                            </c:otherwise>
                                        </c:choose>
                                    </p>   
                                </c:forEach>
                            </div>
                        </div>
                        <div id="userDetails">
                            <h1>Seller details</h1>
                            <h5 style="margin-top: 3%;"><b>Email:</b> &nbsp; ${requestScope.itemOwner.email}</h5>
                            <c:choose>
                                <c:when test="${requestScope.itemOwner.name != null}">
                                    <h5><b>Name:</b> &nbsp; ${requestScope.itemOwner.name}</h5>
                                </c:when>    
                                <c:otherwise>
                                    <h5><b>Name:</b> &nbsp; Not specified.</h5>
                                </c:otherwise>
                            </c:choose>
                            <c:choose>
                                <c:when test="${requestScope.itemOwner.address != null}">
                                    <h5><b>Address:</b> &nbsp; ${requestScope.itemOwner.address}</h5>
                                </c:when>    
                                <c:otherwise>
                                    <h5><b>Address:</b> &nbsp; Not specified.</h5>
                                </c:otherwise>
                            </c:choose>
                            <c:choose>
                                <c:when test="${requestScope.itemOwner.ZC != 0}">
                                    <h5><b>Zip/Postal code:</b> &nbsp; ${requestScope.itemOwner.ZC}</h5>
                                </c:when>    
                                <c:otherwise>
                                    <h5><b>Zip/Postal code:</b> &nbsp; Not specified.</h5>
                                </c:otherwise>
                            </c:choose>
                            <c:choose>
                                <c:when test="${requestScope.itemOwner.phoneNumber != 0}">
                                    <h5><b>Phone number:</b> &nbsp; ${requestScope.itemOwner.phoneNumber}</h5>
                                </c:when>    
                                <c:otherwise>
                                    <h5><b>Phone number:</b> &nbsp; Not specified.</h5>
                                </c:otherwise>
                            </c:choose>
                            <c:choose>
                                <c:when test="${requestScope.itemOwner.TW != null}">
                                    <h5><b>Twitter:</b> &nbsp; ${requestScope.itemOwner.TW}</h5>
                                </c:when>    
                                <c:otherwise>
                                    <h5><b>Twitter:</b> &nbsp; Not specified.</h5>
                                </c:otherwise>
                            </c:choose>
                            <c:choose>
                                <c:when test="${requestScope.itemOwner.FB != null}">
                                    <h5><b>Facebook:</b> &nbsp; ${requestScope.itemOwner.FB}</h5>
                                </c:when>    
                                <c:otherwise>
                                    <h5><b>Facebook:</b> &nbsp; Not specified.</h5>
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <c:if test="${sessionScope.email != null}">
                            <div id="addComent">
                                <h1 class="titleComment">ADD A COMMENT</h1>
                                <form method="POST" action="Comment">
                                    <label for="visibility"><b>Visibility: </b> &nbsp; </label>
                                    <select name="visibility" id="visibility">
                                        <option>PUBLIC</option>
                                        <option>PRIVATE</option>
                                        <option>SELLER</option>
                                    </select>
                                    <div style="margin-top: 63%" class="help-tip">
                                        <p>
                                            Public: Everyone see the comment. <br>
                                            Private: Only you see the comment. <br>
                                            Seller: Seller's item and you see the comment.
                                        </p>
                                    </div> <br> <br>
                                    <textarea style="resize: none" rows="6" cols="40" name="textComment" id="textComment" placeholder="Type your comment here..."></textarea>
                                    <br> <br> <input style="margin-left: 25%;" type="submit" class="btn-success" value="Comment" />
                                    <c:forEach var="item" items="${requestScope.items}">
                                        <input type="text" name="itemID" style="visibility: hidden;" value="${item.id}" />
                                    </c:forEach>
                                </form>
                            </div>
                        </c:if>
                        <div id="comments">
                            <h1 class="titleComment">COMMENTS</h1>
                            <c:forEach var="comment" items="${requestScope.itemComments}">
                                <c:if test="${comment.visibility == 'PUBLIC'}">
                                    <p><b>${comment.owner.email}: </b> &nbsp; ${comment.text}</p>
                                </c:if>
                                <c:if test="${comment.visibility == 'PRIVATE' and sessionScope.fullEmail == comment.owner.email}">
                                   <p><b>${comment.owner.email}: </b> &nbsp; ${comment.text}</p>
                                </c:if>
                                <c:if test="${comment.visibility == 'SELLER' and sessionScope.fullEmail == comment.owner.email}">
                                    <p><b>${comment.owner.email}: </b> &nbsp; ${comment.text}</p>
                                </c:if>
                                <c:if test="${comment.visibility == 'SELLER' and sessionScope.fullEmail == requestScope.itemOwner.email}">
                                    <p><b>${comment.owner.email}: </b> &nbsp; ${comment.text}</p>
                                </c:if>
                            </c:forEach>
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

