<%-- 
    Document   : CEprovince
    Created on : 22-jun-2016, 11:47:29
    Author     : ivan
--%>

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

            <title>Crear Editar Provincia</title>

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
          <!-- Contenido -->
        <form action="Provincia" method="POST">
            <% String action = request.getParameter("action");
                System.out.println(action);
            %>
            <input type="text" name="id" value="<c:out value="${province.id}"/>"  style="visibility:hidden"/><br>
            <!-- Large button group -->                                
            <label>Departamento</label>
            <select class="browser-default" name="department_id">
                <c:forEach items="${departments}" var="department">
                    <option value="<c:out value="${department.id}"/>">
                        <c:out value="${department.name}"/>
                    </option>
                </c:forEach>
            </select>        
            
            
                    
                   <br><br>
                <!-- fin button -->
            
             
            <div class="md-form">
                <i class="fa fa-terminal prefix"></i>
                <input type="text" id="form2" class="form-control" name="name" value="<c:out value="${province.name}"/>" />  
                <label for="form2">Nombre</label>
            </div>
                <div class="col-md-5">
                </div>
                <div class ="col-md-2">
                <button type="submmit" class="btn btn-success"> Guardar </button>
                </div>
                <div class="col-md-5">
                </div>
        </form>
             
                
              
             
               
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
