<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Diagoona Template - Contact page</title>
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400" rel="stylesheet" type="text/css" /> <!-- https://fonts.google.com/ -->
<link href="${contextPath }/resources/css/bootstrap.min.css" rel="stylesheet" type="text/css"/> <!-- https://getbootstrap.com/ -->
<link href="${contextPath }/resources/fontawesome/css/all.min.css" rel="stylesheet" type="text/css"/> <!-- https://fontawesome.com/ -->
<link href="${contextPath }/resources/css/templatemo-diagoona.css" rel="stylesheet" />
</head>
<body>
    <div class="tm-container">
        <div>
            <div class="tm-row pt-4">
                <div class="tm-col-left">
                    <div class="tm-site-header media">
                        <i class="fas fa-umbrella-beach fa-3x mt-1 tm-logo"></i>
                        <div class="media-body">
                            <h1 class="tm-sitename text-uppercase">HN TRIP</h1>
                            <p class="tm-slogon">new travel diary</p>
                        </div>        
                    </div>
                </div>
                <div class="tm-col-right">
                    <nav class="navbar navbar-expand-lg" id="tm-main-nav">
                        <button class="navbar-toggler toggler-example mr-0 ml-auto" type="button" 
                            data-toggle="collapse" data-target="#navbar-nav" 
                            aria-controls="navbar-nav" aria-expanded="false" aria-label="Toggle navigation">
                            <span><i class="fas fa-bars"></i></span>
                        </button>
                        <div class="collapse navbar-collapse tm-nav" id="navbar-nav">
                            <ul class="navbar-nav text-uppercase">
                                <li class="nav-item">
                                    <a class="nav-link tm-nav-link" href="${contextPath }/index">Home</a>
                                </li>
                                <li class="nav-item">
									<c:choose>
										<c:when test="${loginUser != null }">
											<a class="nav-link tm-nav-link" href="${contextPath }/member/logout">LOGOUT</a>
										</c:when>
										<c:otherwise>
											<a class="nav-link tm-nav-link" href="${contextPath }/member/login">LOGIN</a>
										</c:otherwise>
									</c:choose>
                                </li>
                                <li class="nav-item">
                                     <c:choose>
										<c:when test="${loginUser != null }">
											<a class="nav-link tm-nav-link" href="${contextPath }/board/likes">LIKES</a>
										</c:when>
										<c:otherwise>
											<a class="nav-link tm-nav-link" href="${contextPath }/member/register_form">JOIN US</a>
										</c:otherwise>
									</c:choose>                         
                                </li>                            
                            </ul>                            
                        </div>                        
                    </nav>
                </div>
            </div>
            
            <div class="tm-row">
                <div class="tm-col-left"></div>
                <main class="tm-col-right tm-contact-main"> <!-- Content -->
                    <section class="tm-content tm-contact">
                        <h2 class="mb-4 tm-content-title">안뇽</h2>
                        <p class="mb-85">Etiam et egestas arcu. Fusce congue quis elit vitae commodo. Cras neque mauris, vehicula in ipsum sit amet, faucibus aliquam arcu.</p>
                    </section>
                </main>
            </div>
        </div>        

        <div class="tm-row">
            <div class="tm-col-left text-center">            
                <ul class="tm-bg-controls-wrapper">
                    <li class="tm-bg-control active" data-id="0"></li>
                    <li class="tm-bg-control" data-id="1"></li>
                    <li class="tm-bg-control" data-id="2"></li>
                </ul>            
            </div>        
            <div class="tm-col-right tm-col-footer">
                <footer class="tm-site-footer text-right">
                    <p class="mb-0">Copyright 2020 Diagoona Co. 
                    
                    | Design: <a rel="nofollow" target="_parent" href="https://templatemo.com" class="tm-text-link">TemplateMo</a></p>
                </footer>
            </div>  
        </div>

        <div class="tm-bg"> <!-- Diagonal background design -->
            <div class="tm-bg-left"></div>
            <div class="tm-bg-right"></div>
        </div>
    </div>


     <script src="${contextPath }/resources/js/jquery-3.4.1.min.js"></script>
    <script src="${contextPath }/resources/js/bootstrap.min.js"></script>
    <script src="${contextPath }/resources/js/jquery.backstretch.min.js"></script>
    <script src="${contextPath }/resources/js/templatemo-script.js"></script>
</body>
</html>