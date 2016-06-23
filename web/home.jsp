<%-- 
    Document   : home
    Created on : 19-jun-2016, 19:23:13
    Author     : ivan
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
  HttpSession objsession = request.getSession(false);
  String usuario = (String)objsession.getAttribute("usuario");
  if(usuario.equals("")){
      response.sendRedirect("index.jsp");
  }  
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
            <!--Google Maps-->
            <script src="http://maps.google.com/maps/api/js"></script>
            
            
    </head>
    <body>
        
 
        <nav class="navbar navbar-dark bg-primary">

            <!-- Collapse button-->
            <button class="navbar-toggler hidden-sm-up" type="button" data-toggle="collapse" data-target="#collapseEx">
                <i class="fa fa-bars"></i>
            </button>

            <div class="container">

                <!--Collapse content-->
                <div class="collapse navbar-toggleable-xs" id="collapseEx">
                    <!--Links-->
                    <ul class="nav navbar-nav">
                        <li class="nav-item active">
                            <a class="nav-link waves-effect waves-light" href="Inicio?action=inicio">Inicio <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link waves-effect waves-light" href="DepartmentController?action=listDepartment">Departamentos</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link waves-effect waves-light" href="Provincia?action=listProvince">Provincias</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link waves-effect waves-light" href="#">Acerca de</a>
                        </li>
                    </ul>
                    <!--Search form-->
                    <form class="form-inline waves-effect waves-light">
                        <input class="form-control" type="text" placeholder="Buscar...">
                    </form>
                    
                </div>
                <!--/.Collapse content-->

            </div>

        </nav>
        
        <div class="col-md-10">
            
            
        </div>
        <div class="col-md-2">
            <div class="dropdown">
                <button class="btn btn-primary btn-lg dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <i class="fa fa-user"></i> <% out.println(usuario); %>
                </button>
                <div class="dropdown-menu" aria-labelledby="dropdownMenu1">
                  <a class="dropdown-item" href="#">Action</a>
                  <a class="dropdown-item" href="#">Another action</a>
                  <a class="dropdown-item" href="index.jsp">Cerrar Sesión</a>
                </div>
            </div>
        </div>
                <div class="col-md-12">
                    
                   <!-- Large button group -->                                
                    <div class="btn-group">
                        <button class="btn btn-primary-outline btn-lg dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Departamentos
                        </button>
                        <div class="dropdown-menu">
                            <c:forEach items="${departments}" var="department">
                                <a class="dropdown-item" 
                                   href="Inicio?action=buscar&id=<c:out value="${department.id}" />"
                                   <c:out value="${department.id}"/> >
                                    <c:out value="${department.name}" />
                                </a>
                            </c:forEach>
                            
                            
                            
                        </div>
                    </div>
                   <br><br>
                   <table class="table table-striped">
                        <thead class="thead-inverse">
                          <tr>
                           <th>Id</th>
                                <th>Departamento</th>
                                <th>Nombre</th>
                                <th>Actualizar</th>
                                <th>Eliminar</th>
                          </tr>
                        </thead>
                        <tbody>
                          <c:forEach items="${provinces}" var="province">
                                <tr>
                                <th scope="row"><c:out value="${province.id}"/></th>
                                <td><c:out value="${province.name_department}" /></td>
                                <td><c:out value="${province.name}" /></td>
                                <td><a href="Provincia?action=edit&id=<c:out value="${province.id}"/>">Editar</a></td>
                                <td><a href="Provincia?action=delete&id=<c:out value="${province.id}"/>">Eliminar</a></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                      </table>
                   
                </div>
        
        
        
        
   
    <!-- SCRIPTS -->

    <!-- JQuery -->
    <script type="text/javascript" src="js/jquery-2.2.3.min.js"></script>

    <!-- Bootstrap tooltips -->
    <script type="text/javascript" src="js/tether.min.js"></script>

    <!-- Bootstrap core JavaScript -->
    <script type="text/javascript" src="js/bootstrap.min.js"></script>

    <!-- MDB core JavaScript -->
    <script type="text/javascript" src="js/mdb.min.js"></script>
    <script>
        function init_map() {
    
    var var_location = new google.maps.LatLng(40.725118, -73.997699);

    var var_mapoptions = {
        center: var_location,
    
        zoom: 14
    };

    var var_marker = new google.maps.Marker({
        position: var_location,
        map: var_map,
        title: "New York"
    });

    var var_map = new google.maps.Map(document.getElementById("map-container"),
        var_mapoptions);

    var_marker.setMap(var_map);

}

google.maps.event.addDomListener(window, 'load', init_map);
        </script>
    
    </body>
</html>
