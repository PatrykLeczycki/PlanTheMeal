<%--
  Created by IntelliJ IDEA.
  User: patryk
  Date: 19.04.19
  Time: 14:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Home</title>
    <%@include file="utils/files.jsp"%>
</head>
<body>

<%@include file="sections/header/header.jsp"%>

<section class="padding-large bg-light">
    <div id="carouselExampleControls" class="carousel slide main-slider" data-ride="carousel">
        <div class="carousel-inner container">
            <div class="carousel-item active">
                <div class="container w-75 d-flex">
                    <div class="carousel-caption d-block">
                        <h1>Start eating better</h1>
                        <h3>Let PlanTheMeal help you with eating healthily and tastily and start planning your meals for whole week.</h3>
                    </div>
                </div>
            </div>
            <div class="carousel-item">
                <div class="container w-75 d-flex">
                    <div class="carousel-caption d-block">
                        <h1>Share your ideas</h1>
                        <h3>Our users have already created ${plans} plans and ${recipes} recipes.</h3>
                    </div>
                </div>
            </div>
            <div class="carousel-item">
                <div class="container w-75 d-flex">
                    <div class="carousel-caption d-block">
                        <h1>Don't wait</h1>
                        <h3>Register today and benefit from all features for free.</h3>
                    </div>
                </div>
            </div>
        </div>
        <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
</section>

<section class="section-more padding-small" style="display: none">
    <div class="container d-flex justify-content-between">
        <div class="mr-4">
            <h1 class="pb-3">Lorem ipsum dolor sit amet</h1>
            <h4 class="pt-1">consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore
                magna aliqua.</h4>
        </div>
        <div class="ml-4 align-self-center">
            <button class="btn btn-color rounded-0 mt-4 pl-4 pr-4">
                <a href="${pageContext.request.contextPath}/">Lorem ipsum</a>
            </button>
        </div>
    </div>
</section>

<section class="padding-small details bg-light" style="display: none">
    <div class="container">
        <div class="row">
            <div class="col text-center">
                <i class="fas fa-check icon-details"></i>
                <h1>Lorem ipsum dolor sit amet</h1>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam at porttitor sem.  Aliquam erat volutpat. Donec placerat nisl magna, et faucibus arcu condimentum sed.
                </p>
            </div>
            <div class="col text-center pr-4 pl-4 mr-4 ml-4">
                <i class="far fa-clock icon-details"></i>
                <h1>Lorem ipsum dolor sit amet</h1>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam at porttitor sem.  Aliquam erat volutpat. Donec placerat nisl magna, et faucibus arcu condimentum sed.
                </p>
            </div>
            <div class="col text-center">
                <i class="fas fa-list icon-details"></i>
                <h1>Lorem ipsum dolor sit amet</h1>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam at porttitor sem.  Aliquam erat volutpat. Donec placerat nisl magna, et faucibus arcu condimentum sed.
                </p>
            </div>
        </div>
    </div>
</section>


<section class="newsletter-section padding-small" style="display: none">
    <div class="container">
        <div class="row">
            <div class="col">
                <h1>Lorem ipsum dolor sie amet</h1>
            </div>
            <div class="col-5">
                <div class="input-group mb-3">
                    <input type="text" class="form-control border-0 rounded-0" placeholder=""
                           aria-label="Recipient's username" aria-describedby="basic-addon2">
                    <div class="input-group-append">
                        <button class="input-group-text btn-color border-0 rounded-0" type="submit" id="basic-addon2">
                            <a href="${pageContext.request.contextPath}/">Lorem</a>
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="padding-medium story bg-light" id="about" style="display: none">
    <div class="container d-flex justify-content-center align-items-center">
        <div class="row">
            <div class="col-4 mr-4">
                <div class="div-img">
                </div>
            </div>

            <div class="col-7 ml-4">
                <h1 class="pb-1">Lorem ipsum dolor sit amet</h1>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam at porttitor sem. Aliquam erat
                    volutpat. Donec placerat nisl magna, et faucibus arcu condimentum sed. Lorem ipsum dolor sit
                    amet, consectetur adipiscing elit. Aliquam at porttitor sem. Aliquam erat volutpat. Donec
                    placerat nisl magna, et faucibus arcu condimentum sed.
                </p>
            </div>
        </div>
    </div>
</section>

<section class="last-info-section padding-small" id="contact" style="display: none">
    <div class="container">
        <div class="row">
            <div class="col">
                <h3 class="mb-4">Lorem ipsum dolor</h3>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam at porttitor sem.  Aliquam erat volutpat. Donec placerat nisl magna.</p>
            </div>
            <div class="col pl-4 ml-4">
                <h3 class="mb-4">Lorem ipsum dolor</h3>
                <ul class="container">
                    <li>consectetur adipiscing elit</li>
                    <li>sed do eiusmod tempor</li>
                    <li>incididunt ut labore</li>
                    <li>et dolore magna aliqua</li>
                </ul>
            </div>
            <div class="col">
                <h3 class="mb-4">Lorem ipsum dolor</h3>
                <div class="input-group mb-3">
                    <input type="text" class="form-control border-0 rounded-0" placeholder=""
                           aria-label="Recipient's username" aria-describedby="basic-addon2">
                    <div class="input-group-append">
                        <button class="input-group-text btn-color border-0 rounded-0" type="submit" id="basic-addon2"><a
                                href="${pageContext.request.contextPath}/">Lorem</a></button>
                    </div>
                </div>
                <div class="container d-flex-row">
                    <a href="#">
                        <i class="fab fa-facebook-square mr-4 icon-social"></i>
                    </a>
                    <a href="#">
                        <i class="fab fa-twitter-square mr-4 icon-social"></i>

                    </a>
                    <a href="#">
                        <i class="fab fa-instagram icon-social"></i>
                    </a>
                </div>
            </div>
        </div>
    </div>
</section>

<%@include file="sections/footer.jsp"%>

<%@include file="utils/scripts.jsp"%>

</body>
</html>
