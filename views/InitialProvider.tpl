<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Provide</title>

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
    <script src="/static/js/todo.js" type="text/javascript"></script>
    

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
                        <strong>Provide</strong> a service
                    </h2>
                    <hr>
                </div>
                <div class="col-md-8">
                    <img class="img-responsive img-border-left" src="static/img/provider.jpg" alt="">
                </div>
                <div class="col-md-4">
                <p class="intro-text text-center"> What do you want to provide ? </p><br>
    <div class="intro-text text-center">
    <form id="requestForm" name="requestForm" method="post" action="submitAdd">
        <select name="Service" class="form-control">
            <option value="Mow Lawn">Mow Lawn</option>
            <option value="Clean Dishes">Clean Dishes</option>
        </select>   
        <br>
        Name: <input type="text" name="Username">
        <br></br>
        
        <input type="hidden" name="Latitude" id="lat" >
        <input type="hidden" name="Longitude" id="lon" >
        <input type="button" onclick="getAndSetLocation()" value="Submit">
    </form>
    <p id = "demo"> </p>
    </div>
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
