<!DOCTYPE html>
<html lang="en">

<head>
    <title>%title%</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
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
    <a id="skippy" class="sr-only sr-only-focusable" href="#content">
		<div class="container"><span class="skiplink-text">Skip to main content</span></div>
	</a>
    <!--navbor-->
    <header class="navbar navbar-static-top bs-docs-nav" id="top" role="banner">
        <div class="container">
            <nav id="bs-navbar" class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
                <span class="navbar-brand">导航菜单</span>
            </nav>
            <!-- /.navbar-header -->
            <nav id="bs-navbar" class="collapse navbar-collapse">
                <ul class="nav navbar-nav">
                    <li class="">
                        <a href="%root_path%index.html">主页</a>
                    </li>
                    <li class="">
                        <a href="%root_path%workspace/workspace.html">工作空间</a>
                    </li>
                    <li class="">
                        <a href="%root_path%diary/diary.html">日记</a>
                    </li>
                    <li class="">
                        <a href="%root_path%todo.html">任务列表</a>
                    </li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <a class="brand" href="http://code.google.com/p/vimwiki/">Vimwiki</a>
                    </li>
                </ul>
            </nav>
        </div>
    </header>

    <!--Container-->
    <div class="container bs-docs-container">
        <div class="row">
            <div class="col-xs-12 col-md-9" role="main" id="main">
                <!--Body content-->
                %content%
            </div>
            <div class="col-md-3" role="complementary">
                <nav class="bs-docs-sidebar hidden-print hidden-xs hidden-sm affix-top" id="navSidebar">
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
                <a id="cnzz_stat_icon_1257740965"></a>
            </p>
        </div>
    </footer>

    <script src="%root_path%js/jquery.min.js"></script>
    <script src="%root_path%js/bootstrap.min.js"></script>
    <script src="%root_path%js/docs.min.js"></script>
    <script src="%root_path%js/highlight.pack.js"></script>
    <script src="%root_path%js/vimwiki.js"></script>
    <script src="%root_path%js/MathJax.js?config=TeX-AMS-MML_HTMLorMML"></script>
</body>

</html>
