<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html class="no-js" lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width" />
<title>raffles</title>

<link rel="stylesheet" href="/Raffles/Public/css/base.css" id="camera-css" />
<link rel="stylesheet" href="/Raffles/Public/css/framework.css" />
<link rel="stylesheet" href="/Raffles/Public/css/style.css" />
<link rel="stylesheet" href="/Raffles/Public/css/noscript.css" media="screen,all" id="noscript" />

<link rel="shortcut icon" href="/Raffles/Public/images/favicon.ico" />

<script src="/Raffles/Public/js/jquery.min.js"></script>
<script src="/Raffles/Public/js/jquery.easing-1.3.min.js"></script>
<script src="/Raffles/Public/js/tooltip.js"></script>
<script src="/Raffles/Public/js/dropdown.js"></script>
<script src="/Raffles/Public/js/tinynav.min.js"></script>
<script src="/Raffles/Public/js/camera.min.js"></script>
<script src="/Raffles/Public/js/jquery.fancybox.js?v=2.0.6"></script>
<script src="/Raffles/Public/js/jquery.fancybox-media.js?v=1.0.3"></script>
<script src="/Raffles/Public/js/jquery.ui.totop.min.js"></script>
<script src="/Raffles/Public/js/ddaccordion.js"></script>
<script src="/Raffles/Public/js/jquery.twitter.js"></script>
<script src="/Raffles/Public/js/jflickrfeed.min.js"></script>
<script src="/Raffles/Public/js/faq-functions.js"></script>
<script src="/Raffles/Public/js/theme-functions.js"></script>












<script>
$(document).ready(function() { 
    //Camera Jquery
    $('#camera-slide').camera({
        thumbnails: false,
        hover: false,
        pagination: false
    });	  	
});
</script> 

<!-- IE Fix for HTML5 Tags -->
<!--[if lt IE 9]><script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head>
<body>
<!-- header start here -->
<header>
    <div id="main-wrapper">
    
        <!-- top-social start here -->
        <div id="top-social">
            <a class="trigger" href="#"></a>
            <div class="social-panel">
                <ul>
                    <li><a href="#"><img src="/Raffles/Public/images/socials/social10.gif" alt="" /></a></li>
                    <li><a href="#"><img src="/Raffles/Public/images/socials/social32.gif" alt="" /></a></li>
                    <li><a href="#"><img src="/Raffles/Public/images/socials/social9.gif" alt="" /></a></li>
                    <li><a href="#"><img src="/Raffles/Public/images/socials/social15.gif" alt="" /></a></li>
                    <li><a href="#"><img src="/Raffles/Public/images/socials/social25.gif" alt="" /></a></li>
                </ul>
            </div>
        </div>            
        <!-- top-social end here -->
        
        <!-- logo start here -->
        <div id="logo">
            <a href="index.html"><img src="/Raffles/Public/images/logo.png" alt="mainlogo" /></a>
        </div>
        <!-- logo end here -->
        
        <!-- mainmenu start here -->
        <nav id="mainmenu">
            <ul id="menu">
                <li class="selected dropdown"><a href="index.html">home</a>
                	<ul> 
                        <li><a href="index-layout2.html"><span>-</span> home layout 2</a></li>
                        <li><a href="index-layout3.html"><span>-</span> home layout 3</a></li>
                        <li><a href="index-layout4.html"><span>-</span> home layout 4</a></li>    	
                    </ul>
                </li>
                <li><a href="about.html">about</a></li>
                <li><a href="services.html">services</a></li>
                <li class="dropdown"><a href="#">portfolio</a>
                    <ul> 
                        <li><a href="portfolio-2col.html"><span>-</span> portfolio 2 column</a></li>
                        <li><a href="portfolio-3col.html"><span>-</span> portfolio 3 column</a></li>
                        <li><a href="portfolio-4col.html"><span>-</span> portfolio 4 column</a></li>    	
                    </ul>
                </li>
                <li><a href="blog.html">blog</a></li>
                <li><a href="contact.html">contact</a></li>
                <li class="dropdown"><a href="#">pages</a>
                    <ul> 
                        <li><a href="column.html"><span>-</span> column page</a></li>
                        <li><a href="tables.html"><span>-</span> table page</a></li>
                        <li><a href="button-list.html"><span>-</span> button &amp; list page</a></li>
                        <li><a href="typhography.html"><span>-</span> typhography page</a></li>
                        <li><a href="testimonials.html"><span>-</span> testimonials page</a></li>  
                        <li><a href="pricing.html"><span>-</span> pricing page</a></li>
                        <li><a href="faq.html"><span>-</span> faq page</a></li>
                        <li><a href="single.html"><span>-</span> single page</a></li>  
                        <li><a href="fullwidth.html"><span>-</span> fullwidth page</a></li>
                        <li><a href="404.html"><span>-</span> 404 page</a></li>                           	
                    </ul>
                </li>
            </ul>
        </nav>
        <!-- mainmenu end here -->
        
    </div>
</header>
<!-- header end here -->
<?php if(is_array($dataname)): foreach($dataname as $key=>$tt): echo ($tt); ?>
    <br/><?php endforeach; endif; ?> 
<!-- slideshow start here -->
<section id="slideshow-wrapper">
    <div class="camera_wrap" id="camera-slide">
    
        <!-- slide 1 here -->
        <div data-src="/Raffles/Public/images/slideshow/bg-slide1.jpg">
            <div class="caption-type1 moveFromLeft">
                <h1>We build rock solid Responsive website</h1>
                <p>Used by thousands of creative freelancers and companies worldwide, Hyperion gives you everything you need to run your small business.</p>
                <a href="#" class="button-slide medium gray">Let's start something</a>
            </div>
            <div class="caption-type1 moveFromRight">
                <img src="/Raffles/Public/images/slideshow/slide1.png" alt="" />
            </div>
        </div>
        
        <!-- slide 2 here -->
        <div data-src="/Raffles/Public/images/slideshow/bg-slide2.jpg">
            <div class="caption-type2 moveFromTop">
                <h1>We build rock solid Responsive website</h1>
                <p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident similique sunt in culpa qui officia deserunt</p>
            </div>
            <div class="caption-type2 moveFromBottom">
                <img src="/Raffles/Public/images/slideshow/slide2.png" alt="" />
            </div>
        </div>
        
        <!-- slide 3 here -->
        <div data-src="/Raffles/Public/images/slideshow/bg-slide3.jpg">
            <div class="caption-type3 moveFromLeft">
                <img src="/Raffles/Public/images/slideshow/slide3.png" alt="" />
            </div>
            <div class="caption-type3 moveFromRight">
                <h1>Latest web technology</h1>
                <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium totam rem aperiam eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.</p>
                <img src="/Raffles/Public/images/slideshow/slide3a.png" alt="" class="html-badge" />
            </div>                
        </div>
        
        <!-- slide 4 here -->
        <div data-src="/Raffles/Public/images/slideshow/bg-slide4.jpg">                
            <div class="caption-type4 moveFromBottom">
                <img src="/Raffles/Public/images/slideshow/slide4.png" alt="" />
            </div>
        </div>   
    </div>
    <div id="slideshow-noscript"><h4>Hi, your javascript is off..!! for optimal results on this site please enable javascript in your browser</h4></div>
</section>
<!-- slideshow end here --> 
<div class="copyrights">Collect from <a href="http://www.mycodes.net/"  title="网站模板">网站模板</a></div>
<!-- featured client start here -->
<section id="featured-wrapper">
    <div id="featured-logo-list">
        <div class="row">
            <div class="two columns mobile-two mobile-view">
                <h6 class="featured-client">featured clients :</h6>
            </div>

            <?php if(is_array($data)): $i = 0; $__LIST__ = $data;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><div class="two columns mobile-two mobile-view">
                    <?php echo ($vo['logo']); ?>
                </div><?php endforeach; endif; else: echo "" ;endif; ?>


            <!--<?php if(is_array($data)): $i = 0; $__LIST__ = $data;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>-->
            <!--<div class="two columns mobile-two mobile-view">-->
                <!--<img src="<?php echo ($vo); ?>" alt="client-image" />-->
            <!--</div>-->
            <!--<?php endforeach; endif; else: echo "" ;endif; ?>-->
            <!--

            <div class="two columns mobile-two mobile-view">
                <img src="/Raffles/Public/images/sample-images/client1.png" alt="client-image" />
            </div>
            <div class="two columns mobile-two mobile-view">
                <img src="/Raffles/Public/images/sample-images/client2.png" alt="client-image" />
            </div>
            <div class="two columns mobile-two mobile-view">
                <img src="/Raffles/Public/images/sample-images/client3.png" alt="client-image" />
            </div>
            <div class="two columns mobile-two mobile-view">
                <img src="/Raffles/Public/images/sample-images/client4.png" alt="client-image" />
            </div>
            <div class="two columns mobile-two mobile-view">
                <img src="/Raffles/Public/images/sample-images/client5.png" alt="client-image" />
            </div>
            -->
        </div>
    </div>
</section>
<!-- featured client end here -->

<!-- maincontent start here -->
<section id="content-wrapper">
    <div class="row">
        <div class="three columns mobile-two">
            <h5>Make life happier &raquo;</h5>
            <div class="link-zoom">
                <a class="fancybox" href="/Raffles/Public/images/portfolio-big/pf-big.jpg" title="Hyperion">
                    <img src="/Raffles/Public/images/sample-images/front-img1.jpg" alt="" class="fade" />
                </a>
            </div>
        </div>
        <div class="three columns mobile-two">
            <h5>Why we made it &raquo;</h5>
            <div class="link-url">
                <a href="http://www.mycodes.net" target="_self">
                    <img src="/Raffles/Public/images/sample-images/front-img2.jpg" alt="" class="fade" />
                </a>
            </div>
        </div>
        <div class="three columns mobile-two">
            <h5>Known the process &raquo;</h5>
            <div class="link-more">
                <a href="about.html">
                    <img src="/Raffles/Public/images/sample-images/front-img3.jpg" alt="" class="fade" />
                </a>
            </div>
        </div>
        <div class="three columns mobile-two">
            <h5>Take a tour &raquo;</h5>
            <div class="link-video">
                <a class="fancybox" href="http://www.mycodes.net" title="Hyperion Sample Video">
                    <img src="/Raffles/Public/images/sample-images/front-img4.jpg" alt="" class="fade" />
                </a>
            </div>
        </div>
    </div>
    
    <div id="featured-wrapper2">
        <div class="row front-feature-icon">
            <div class="four columns mobile-one">
                <img src="/Raffles/Public/images/sample-images/front-icon1.png" alt="" class="img-center" />
                <h5>We made Responsive design</h5>
                <p>Lorem ipsum dolor sit amet consectetur incididunt ut labore et dolore magna aliqua adipisicing elit seddo eiusmod tempor.</p>
            </div>
            <div class="four columns mobile-one">
                <img src="/Raffles/Public/images/sample-images/front-icon2.png" alt="" class="img-center" />
                <h5>Complete pack of business idea</h5>
                <p>Lorem ipsum dolor sit amet consectetur incididunt ut labore et dolore magna aliqua adipisicing elit seddo eiusmod tempor.</p>
            </div>
            <div class="four columns mobile-one">
                <img src="/Raffles/Public/images/sample-images/front-icon3.png" alt="" class="img-center" />
                <h5>Simple, Efficient, and Low cost</h5>
                <p>Lorem ipsum dolor sit amet consectetur incididunt ut labore et dolore magna aliqua adipisicing elit seddo eiusmod tempor.</p>
            </div>
        </div>
    </div>
    
    <div class="row">
        <div class="twelve columns">
            <div class="featured-box">
                <div class="nine columns">
                    <h5>Are you ready to Grow your business with Hyperion HTML Template?</h5>
                    <p>Hyperion is a modern minimalist responsive HTML template created for business websites.</p>
                </div>
                <div class="three columns">
                    <a href="#" class="button medium gray arrow-icon">Try it free today</a>
                </div>
                <div class="clear"></div>
            </div>
        </div>
    </div>
</section>
<!-- maincontent end here -->



<!-- footer start here -->
<footer>
    <div class="row">
        <div class="three columns mobile-two">
            <img src="/Raffles/Public/images/logo2.png" alt="" class="img-left" />
            <p class="copyright-text">&copy; Copyright &copy; 2013.Company name All rights reserved.<a target="_blank" href="http://www.mycodes.net/153/">网站模板</a> -  More Templates <a href="http://www.mycodes.net/" target="_blank" title="源码之家">源码之家</a></p>
        </div>
        <div class="three columns mobile-two">
            <h5>Address</h5>
            <ul>
            	<li class="address-icon">Armistice Building<br />Jakarta, JKT 1220<br />PO BOX 1234</li>
            	<li class="phone-icon">Phone : +621 55566671</li>
            	<li class="email-icon">Email : info@crown.com</li>
            </ul>
        </div>
        <div class="three columns mobile-two">
            <h5>Company</h5>
            <ul>
                <li><a href="#">About Hyperion</a></li>
                <li><a href="#">Careers</a></li>
                <li><a href="#">Press &amp; Media</a></li>
                <li><a href="#">Environmental Impact</a></li>
                <li><a href="#">Affiliate Program</a></li>
                <li><a href="#">Privacy Policy</a></li>
            </ul>
        </div>
        <div class="three columns mobile-two">
            <h5>Flickr</h5>
            <ul id="flck-thumb" class="thumbs"><li class="no-image"></li></ul>
            
            <!-- Noscript Notification when your Javascript not active -->
            <div id="flickr-noscript">                	
                <p>Can't load Flickr feed, please activate your javascript first...</p>
            </div>
            <!-- End of Noscript Notification when your Javascript not active -->
        </div>
    </div>
</footer>
<!-- footer end here -->
<script>$('#noscript').remove();</script>
       	


</body>
</html>