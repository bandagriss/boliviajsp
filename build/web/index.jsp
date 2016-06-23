<%-- 
    Document   : index
    Created on : 19-jun-2016, 17:23:44
    Author     : ivan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
            <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
            <meta http-equiv="x-ua-compatible" content="ie=edge">

            <title>Material Design Bootstrap</title>

            <!-- Font Awesome -->
            <!-- <link rel="stylesheet" href="css/font_awesome.css">-->
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.0/css/font-awesome.min.css">



            <!-- Bootstrap core CSS -->
            <link href="css/bootstrap.min.css" rel="stylesheet">

            <!-- Material Design Bootstrap -->
            <link href="css/mdb.min.css" rel="stylesheet">

            <!-- Template styles -->
            <link href="css/style.css" rel="stylesheet">


    </head>
   <body>


    

    <!--Mask-->
    <div class="view hm-black-strong">
        <div class="full-bg-img flex-center">
            <ul class="animated fadeInUp">
                <li>
                    <h1 class="h1-responsive">Sistema de Seguimiento Departamental</h1></li>
                <li>
                    <p>Para entrar puede iniciar sesión o registrarse.</p>
                </li>
                <li>
                    <a target="_blank" href="#" class="btn btn-primary btn-lg" class="btn btn-danger" data-toggle="modal" data-target="#modal-login">Iniciar Sesión</a>
                    <a target="_blank" href="#" class="btn btn-default btn-lg" data-toggle="modal" data-target="#modal-register">Registrarse</a>
                </li>
            </ul>
        </div>
    </div>
    <!--/.Mask-->
    
    
                                
<!-- Modal Login -->
<div class="modal fade modal-ext" id="modal-login" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <!--Content-->
        <form action="home" method="post">
        <div class="modal-content">
                <!--Header-->
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h3><i class="fa fa-user"></i> Iniciar Sesión</h3>
                </div>

                <!--Body-->
                <div class="modal-body">
                    <div class="md-form">
                        <i class="fa fa-user prefix"></i>
                        <input type="text" name="usuario" id="form2" class="form-control">
                        <label for="form2">Usuario</label>
                    </div>

                    <div class="md-form">
                        <i class="fa fa-lock prefix"></i>
                        <input type="password" name="password" id="form3" class="form-control">
                        <label for="form3">Contraseña</label>
                    </div>
                    <div class="text-xs-center">
                        <button type="submit" class="btn btn-primary btn-lg">Iniciar</button>
                    </div>
                </div>
            
            <!--Footer-->
            <!--<div class="modal-footer">
                <div class="options">
                    <p>Not a member? <a href="#">Sign Up</a></p>
                    <p>Forgot <a href="#">Password?</a></p>
                </div>
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>-->
        </div>
       </form>
        <!--/.Content-->
    </div>
</div>
<!-- FIN MODAL LOGIN -->

<!-- Modal Register -->
<div class="modal fade modal-ext" id="modal-register" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <form action="consultas" method="post">
        <!--Content-->
        <div class="modal-content">
            <!--Header-->
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h3><i class="fa fa-user"></i> Registrarse:</h3>
                <!--<button type="button" class="btn-floating btn-tw btn-small"><i class="fa fa-facebook"></i></button>
                <a href="" class="btn-floating btn-tw btn-small"><i class="fa fa-twitter"></i></a>
                <a href="" class="btn-floating btn-gplus btn-small"><i class="fa fa-google-plus"></i></a>
                <a href="" class="btn-floating btn-li btn-small"><i class="fa fa-linkedin"></i></a>
                <a href="" class="btn-floating btn-git btn-small"><i class="fa fa-github"></i></a>-->
            </div>
            <!--Body-->
            <div class="modal-body">
                <div class="md-form">
                    <i class="fa fa-chevron-right prefix"></i>
                    <input type="text" name="nombre" id="form2" class="form-control">
                    <label for="form2">Nombre</label>
                </div>

                <div class="md-form">
                    <i class="fa fa-chevron-right prefix"></i>
                    <input type="text" name="apellido" id="form3" class="form-control">
                    <label for="form3">Apellido</label>
                </div>
                
                <div class="md-form">
                    <i class="fa fa-user prefix"></i>
                    <input type="text" name="usuario" id="form3" required class="form-control">
                    <label for="form3">Usuario</label>
                </div>
                
                <div class="md-form">
                    <i class="fa fa-lock prefix"></i>
                    <input type="password" name="password" id="form4" required class="form-control">
                    <label for="form4">Password</label>
                </div>

                <div class="text-xs-center">
                    <button class="btn btn-primary btn-lg">Registrar</button>

                    <!--<fieldset class="form-group">
                        <input type="checkbox" id="checkbox1">
                        <label for="checkbox1">Subscribe me to the newsletter</label>
                    </fieldset>-->
                </div>
            </div>
            <!--Footer-->
            <div class="modal-footer">
                <div class="options">
                    <p>Tienes una cuenta? <a href="#" data-dismiss="modal">Iniciar Sesión</a></p>
                </div>
                <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
            </div>
        </div>
        </form>
        <!--/.Content-->
    </div>
</div>
<!-- FIN MODAL REGISTER -->

    <!--Footer-->
    <footer class="page-footer center-on-small-only">

        <!--Footer Links-->
        <div class="container-fluid">
            <div class="row">

                <!--First column-->
                <div class="col-md-3 col-md-offset-1">
                    <h5 class="title">ABOUT MATERIAL DESIGN</h5>
                    <p>Material Design (codenamed Quantum Paper) is a design language developed by Google. </p>

                    <p>Material Design for Bootstrap (MDB) is a powerful Material Design UI KIT for most popular HTML, CSS, and JS framework - Bootstrap.</p>
                </div>
                <!--/.First column-->

                <hr class="hidden-md-up">

                <!--Second column-->
                <div class="col-md-2 col-md-offset-1">
                    <h5 class="title">First column</h5>
                    <ul>
                        <li><a href="#!">Link 1</a></li>
                        <li><a href="#!">Link 2</a></li>
                        <li><a href="#!">Link 3</a></li>
                        <li><a href="#!">Link 4</a></li>
                    </ul>
                </div>
                <!--/.Second column-->

                <hr class="hidden-md-up">

                <!--Third column-->
                <div class="col-md-2">
                    <h5 class="title">Second column</h5>
                    <ul>
                        <li><a href="#!">Link 1</a></li>
                        <li><a href="#!">Link 2</a></li>
                        <li><a href="#!">Link 3</a></li>
                        <li><a href="#!">Link 4</a></li>
                    </ul>
                </div>
                <!--/.Third column-->

                <hr class="hidden-md-up">

                <!--Fourth column-->
                <div class="col-md-2">
                    <h5 class="title">Third column</h5>
                    <ul>
                        <li><a href="#!">Link 1</a></li>
                        <li><a href="#!">Link 2</a></li>
                        <li><a href="#!">Link 3</a></li>
                        <li><a href="#!">Link 4</a></li>
                    </ul>
                </div>
                <!--/.Fourth column-->

            </div>
        </div>
        <!--/.Footer Links-->

        <hr>

        <!--Call to action-->
        <div class="call-to-action">
            <h4>Material Design for Bootstrap</h4>
            <ul>
                <li>
                    <h5>Get our UI KIT for free</h5></li>
                <li><a target="_blank" href="#" class="btn btn-danger">Sign up!</a></li>
                <li><a target="_blank" href="#" class="btn btn-default">Learn more</a></li>
            </ul>
        </div>
        <!--/.Call to action-->

        <!--Copyright-->
        <div class="footer-copyright">
            <div class="container-fluid">
                © 2015 Copyright: <a href="http://www.MDBootstrap.com"> MDBootstrap.com </a>

            </div>
        </div>
        <!--/.Copyright-->

    </footer>
    <!--/.Footer-->


    <!-- SCRIPTS -->

    <!-- JQuery -->
    <script type="text/javascript" src="js/jquery-2.2.3.min.js"></script>

    <!-- Bootstrap tooltips -->
    <script type="text/javascript" src="js/tether.min.js"></script>

    <!-- Bootstrap core JavaScript -->
    <script type="text/javascript" src="js/bootstrap.min.js"></script>

    <!-- MDB core JavaScript -->
    <script type="text/javascript" src="js/mdb.min.js"></script>


</body>


</html>
