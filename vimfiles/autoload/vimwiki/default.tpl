<!DOCTYPE html>
<html lang="en">

<head>
    <title>%title%</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">

    <link type="text/css" rel="stylesheet" href="%root_path%css/bootstrap.min.css" />
    <link type="text/css" rel="stylesheet" href="%root_path%css/patch.css" />
    <link type="text/css" rel="stylesheet" href="%root_path%css/bootstrap-responsive.css" />
    <link type="text/css" rel="stylesheet" href="%root_path%css/docs.min.css" />
    <link type="text/css" rel="stylesheet" href="%root_path%css/monokai.css" />
    <link type="text/css" rel="stylesheet" href="%root_path%css/vimwiki.css" />
    <link type="text/css" rel="stylesheet" href="%root_path%css/font-awesome.css">
</head>

<body data-spy="scroll" data-target=".bs-docs-sidebar">
    <!--navbor-->
    <header class="navbar navbar-static-top bs-docs-nav" id="top" role="banner">
        <div class="container">
            <nav id="bs-navbar" class="collapse navbar-collapse">
                <ul class="nav navbar-nav">
                    <li class="">
                        <a href="%root_path%index.html">Index</a>
                    </li>
                    <li class="">
                        <a href="%root_path%workspace/index.html">Workspace</a>
                    </li>
                    <li class="">
                        <a href="%root_path%diary/diary.html">Diary</a>
                    </li>
                    <li class="">
                        <a href="%root_path%todo.html">To Do</a>
                    </li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <a class="brand" href="http://code.google.com/p/vimwiki/">Vimwiki</a>
                    </li>
                </ul>
            </nav>
    </header>

    <!--Container-->
    <div class="container bs-docs-container">
        <div class="row">
            <div class="col-md-9" role="main">
                <!--Body content-->
                %content%
            </div>
            <div class="col-md-3" role="complementary">
                <nav class="bs-docs-sidebar hidden-print hidden-xs hidden-sm affix-top" id="navSidebar">
                    <ul class="nav bs-docs-sidenav">
                    </ul>
                </nav>
            </div>
        </div>
    </div>

    <!--Backtotop-->
    <a href="#" class="backtotop"><i class="fa fa-arrow-circle-up fa-4x"></i></a>

    <!-- Footer
    ================================================== -->
    <footer class="bs-docs-footer" role="contentinfo">
        <div class="container">
            <p><a href="https://github.com/UglyMelon007/uglymelon007.github.com">Copyright2016 @ UglyMelon007</a>
                <ul class="bs-docs-footer-links text-muted"></ul>
        </div>
    </footer>

    <script type="text/javascript" src="%root_path%js/jquery.min.js"></script>
    <script type="text/javascript" src="%root_path%js/bootstrap.min.js"></script>
    <script type="text/javascript" src="%root_path%js/docs.min.js"></script>
    <script type="text/javascript" src="%root_path%js/highlight.pack.js"></script>
    <script type="text/javascript" src="%root_path%js/vimwiki.js"></script>
</body>

</html>

