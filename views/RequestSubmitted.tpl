<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Request Submitted</title>

    <!-- Bootstrap Core CSS -->
    <link href="static/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="static/css/business-casual.css" rel="stylesheet">

    <!-- Fonts -->
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800" rel="stylesheet" type="text/css">
    <link href="http://fonts.googleapis.com/css?family=Josefin+Slab:100,300,400,600,700,100italic,300italic,400italic,600italic,700italic" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

    <!-- Custom Scripts -->
    <script type="text/javascript">
  var latp = {{.LatitudeP}};
  var lonp = {{.LongitudeP}};
    </script>
    <script src="http://maps.googleapis.com/maps/api/js"></script>
    <script src="/static/js/todo.js" type="text/javascript"></script>
    <script src="/static/js/markerwithlabel.js" type="text/javascript"></script>
    <script>google.maps.event.addDomListener(window, 'load', initialize); </script>

</head>

<body>

    <div class="brand">Uber for Errands</div>
    <div class="address-bar">Team 18 | Carnegie Mellon University | Distributed Systems</div>

    <!-- Navigation -->
    <nav class="navbar navbar-default" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <!-- navbar-brand is hidden on larger screens, but visible when the menu is collapsed -->
                <a class="navbar-brand" href="/">Uber for Errands</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li>
                        <a href="/">Home</a>
                    </li>
                    <li>
                        <a href="initiateRequest">Request</a>
                    </li>
                    <li>
                        <a href="initiateProvide">Provide</a>
                    </li>
                    <li>
                        <a href="team">Our Team</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>

    <div class="container">

        <div class="row">
            <div class="box">
                <div class="col-lg-12">
                    <hr>
                    <h2 class="intro-text text-center">
                        <strong>Requestor</strong> 
                    </h2>
                    <hr>
                </div>
                <div class="col-md-6">
                <div id="googleMap" style="height:400px;width:100%"> </div>  
                </div>
                <div class="col-md-6">
                <p class="intro-text text-center"> Hi, <span id="uniquename">{{.Requester}}</span> <br>
                You've requested someone to 
                come here at ( <span id="lat">{{.Latitude}}</span>,<span id="lon">{{.Longitude}}</span> ) for {{.Service}} . <br>
                </p>
                <div class="intro-text text-center" style="color:red;"> {{.Provider}} {{.At}} {{.LatitudeP}} {{.Comma}} {{.LongitudeP}} {{.Sentence}}  </div>
                </div>
    
     <br>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>
    <!-- /.container -->

    <footer>
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <p>Copyright &copy; Team 18</p>
                </div>
            </div>
        </div>
    </footer>
    <!-- jQuery -->
    <script src="static/js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="static/js/bootstrap.min.js"></script>

</body>

</html>


