<!DOCTYPE html>
<html>
<head>
<title>Portfolio Website Sign-Up  </title>
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7; IE=EmulateIE9">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no"/>
    <link rel="stylesheet" type="text/css" href="css/styleNEWFORM.css" media="all" />
    <link rel="stylesheet" type="text/css" href="css/demoNEWFORM.css" media="all" />
        <link href="css/bootstrap.css" rel="stylesheet">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <script src="js/modernizr.custom.js"></script>
        <script type="text/javascript" src="https://mandrillapp.com/api/docs/js/mandrill.js"></script>
        <script type="text/javascript" src="js/formscript.js"></script>
        <link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon">
        <link rel="icon" href="img/favicon.ico" type="image/x-icon">


<!-- Google Analytics -->
<script>
(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
})(window,document,'script','//www.google-analytics.com/analytics.js','ga');

ga('create', 'UA-47502519-2', 'auto');
ga('send', 'pageview');

</script>
<!-- End Google Analytics -->

</head>
<body>
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="navigation">
            <div class="navbar-header">
                <a href="index.html">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span style="color:gray">Home</span>
                    
                </button>
            </a>
                <!-- You'll want to use a responsive image option so this logo looks good on devices - I recommend using something like retina.js (do a quick Google search for it and you'll find it) -->
                <a class="navbar-brand"><strong>Recsy</strong>        <img src="img/pandatiny.png">           <small><small>websites for students</small></small></a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="https://recsy.com">Return Home (progress may be lost)</a>
                    </li>
                    
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>



<link rel="stylesheet" type="text/css" href="css/styleNEWFORM.css" media="all" />
    <link rel="stylesheet" type="text/css" href="css/demoNEWFORM.css" media="all" />
        <script src="js/modernizr.custom.js"></script>
        <script type="text/javascript" src="https://mandrillapp.com/api/docs/js/mandrill.js"></script>
        <script type="text/javascript" src="js/formscript.js"></script>

    <div class="headerintro">
            <header>
                <h1><br><br><center>Portfolio Website Sign-Up</center></h1><p><center>$7/month, billed annually</center></p><br>
            </header>   <br><br> 
        </div>


      <div  class="form">
            <form id="contactform"> 
                <p class="contact"><label for="name">Name</label></p> 
                <input id="name" name="name" placeholder="First and last name" required="" tabindex="1" type="text"> 
                 
                <p class="contact"><label for="email">Email</label></p> 
                <input id="email" name="email" placeholder="example@gmail.com" required="" type="email"> 
                
                <p class="contact"><label for="phone">Phone number</label></p> 
                <input id="phone" name="phone" placeholder="555-555-5555" required="" type="text"> <br>
                 
                <p class="contact"><label for="linkedin">LinkedIn URL (if applicable)</label></p> 
                <input id="linkedin" name="linkedin" placeholder="555-555-5555" required="" type="text"> <br>

        <p class="contact"><label for="domain">Top 3 domain choices</label></p> 
                <input id="domain" name="domain" placeholder="johndoe.com, johnathandoe.com, johnfdoe.com" required="" type="text"> <br>

<br><select class="select-style gender" name="careerpath" id="careerpath"><br>
            <option value="select">Intended career path?</option>
            <option value="m">pre-med</option>
            <option value="f">graduate school</option>
            <option value="others">finance</option>
            <option value="m">consulting</option>
            <option value="f">human resources</option>
            <option value="others">computer science</option>
                <option value="m">education</option>
            <option value="f">engineering</option>
            <option value="others">marketing</option>
                <option value="m">liberal arts</option>
            <option value="f">sales</option>
            <option value="others">arts</option>
                <option value="m">music</option>
            <option value="f">other*</option>
            </select><br>
            
            <p class="contact"><label for="other"><br><br>*If other, explain?</label></p> 
                <input id="other" name="other" placeholder="I want to be a freelance web developer" required="" type="text">


                <p class="contact"><label for="summary"><br>Front page summary</label></p> 
<textarea id="summary" name="summary" type="text1" placeholder="My name is John Doe. I'm a senior at Vanderbilt University studying marketing. I'm looking to bring my blend of quantitative and creative skills to an internship role this summer." rows="4"></textarea>

<p class="contact"><label for="skills5"><br>Top 5 skills?</label></p> 
<textarea maxlength="50" id="skills5" name="skills5" type="text1" placeholder="SEO, social media marketing, sales, team leadership, HTML/CSS" rows="2"></textarea><br>


            
  
            

<p class="contact"><label for="achievements3"><br>Top 3 achievements?</label></p> 
          <textarea id="achievements3" name="achievements3" type="text1" placeholder="I drove $$$ in sales for ABC company, I'm the founding president for Vandy XYZ, and I spent XXX hours last year doing ____ for ABC charity." rows="3"></textarea>

<p class="contact"><label for="nextstep"><br>What's your next anticipated career step?</label></p> 
                <input id="nextstep" name="nextstep" placeholder="Summer internship with a bulge bracket investment bank" required="" type="text">

<p class="contact"><label for="fewyears"><br>Where do you want to be in a few years?</label></p> 
                <input id="fewyears" name="fewyears" placeholder="Senior consultant at an MBB management consulting firm" required="" type="text">



<pre id="response">
</pre>

   </form> 



<p class="contact"><label for="phone"><br>Upload your resume and a picture of yourself</label></p> 
<form id="uploadform" action="uploader.php" method="post" enctype="multipart/form-data" target="uploadframe" onsubmit="uploading(this); return false" align="left">
  <input type="file" class="file_up" name="file_up[]" />
    <input type="file" class="file_up" name="file_up[]" />
      <input class="buttom" name="submit" id="submit" tabindex="5" value="Upload Files" type="submit" align="left">
</form>
<script type="text/javascript" src="js/upload.js"></script><br><br>




<?php require_once('php/config.php'); ?>


<br><form action="chargePortfolio.php" method="post" align="center" onclick="sendTheMail(); return false">
  <script src="https://checkout.stripe.com/v2/checkout.js" class="stripe-button"
          data-key="<?php echo $stripe['publishable_key']; ?>"
          data-amount="8400" 
          data-description="12 months ($7/month)" 
          data-image="img/pandalogoStripe.png"
          data-name="Portfolio Website Design"
        data-label="Submit Your Order!"></script>
</form><br><br><br>




</div>  


</div>



<br><br><br>


</body>
</html>
