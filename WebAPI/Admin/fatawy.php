<?php
/**
 * Created by PhpStorm.
 * User: mamdouhelnakeeb
 * Date: 8/28/17
 * Time: 5:33 AM
 */


require ("../secure/access.php");
require ("../secure/qassemconn.php");


$access = new access(DB_HOST, DB_USER, DB_PASSWORD, DB_NAME);
$access->connect();

$result = $access->getTableContent("fatawy");

?>


<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png" />
    <link rel="icon" type="image/png" href="assets/img/favicon.png" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

    <title>Fatawy</title>

    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />


    <!-- Bootstrap core CSS     -->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />

    <!--  Material Dashboard CSS    -->
    <link href="assets/css/material-dashboard.css" rel="stylesheet"/>

    <!--  CSS for Demo Purpose, don't include it in your project     -->
    <link href="assets/css/demo.css" rel="stylesheet" />

    <!--     Fonts and icons     -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300|Material+Icons' rel='stylesheet' type='text/css'>

    <link href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css" rel="stylesheet">
</head>

<body>

<div class="wrapper">
    <div class="sidebar" data-color="green" data-image="assets/img/sidebar-1.png">
        <!--
        Tip 1: You can change the color of the sidebar using: data-color="purple | blue | green | orange | red"
        Tip 2: you can also add an image using data-image tag

        -->

        <div class="logo">
            <a href="http://ahalyalqassim.com" class="simple-text">
                Ahaly Al-Qassim
            </a>
        </div>


        <div class="sidebar-wrapper">
            <ul class="nav">
                <li>
                    <a href="index.php">
                        <i class="material-icons">dashboard</i>
                        <p>الرئيسية</p>
                    </a>
                </li>
                <li>
                    <a href="tayeh.php">
                        <i class="material-icons">location_on</i>
                        <p>الحاج الضائع</p>
                    </a>
                </li>
                <li>
                    <a href="chairOrders.php">
                        <i class="material-icons">airline_seat_recline_normal</i>
                        <p>طلب كرسي</p>
                    </a>
                </li>
                <li>
                    <a href="messages.php">
                        <i class="material-icons">mail</i>
                        <p>الرسائل</p>
                    </a>
                </li>
                <li class="active">
                    <a href="#">
                        <i class="material-icons">content_copy</i>
                        <p>الفتاوى</p>
                    </a>
                </li>
                <li>
                    <a href="camps.php">
                        <i class="material-icons">location_on</i>
                        <p>موقعنا بالمشاعر</p>
                    </a>
                </li>
                <li>
                    <a href="gather.php">
                        <i class="material-icons text-gray">map</i>
                        <p>أماكن التجمع</p>
                    </a>
                </li>
            </ul>
        </div>
    </div>

    <div class="main-panel">
        <nav class="navbar navbar-transparent navbar-absolute">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#">Fatawy</a>
                </div>
                <!--
                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li>
                            <a href="#pablo" class="dropdown-toggle" data-toggle="dropdown">
                                <i class="material-icons">dashboard</i>
                                <p class="hidden-lg hidden-md">Dashboard</p>
                            </a>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <i class="material-icons">notifications</i>
                                <span class="notification">5</span>
                                <p class="hidden-lg hidden-md">Notifications</p>
                            </a>
                            <ul class="dropdown-menu">
                                <li><a href="#">Mike John responded to your email</a></li>
                                <li><a href="#">You have 5 new tasks</a></li>
                                <li><a href="#">You're now friend with Andrew</a></li>
                                <li><a href="#">Another Notification</a></li>
                                <li><a href="#">Another One</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="#pablo" class="dropdown-toggle" data-toggle="dropdown">
                                <i class="material-icons">person</i>
                                <p class="hidden-lg hidden-md">Profile</p>
                            </a>
                        </li>
                    </ul>

                    <form class="navbar-form navbar-right" role="search">
                        <div class="form-group  is-empty">
                            <input type="text" class="form-control" placeholder="Search">
                            <span class="material-input"></span>
                        </div>
                        <button type="submit" class="btn btn-white btn-round btn-just-icon">
                            <i class="material-icons">search</i><div class="ripple-container"></div>
                        </button>
                    </form>
                </div>
                -->
            </div>
        </nav>

        <div class="content">
            <div class="container-fluid">

                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header" data-background-color="green">
                                <h4 class="title">الفتاوى</h4>
                                <p class="category">أسئلة فتاوى الحجاج و إجاباتها</p>
                            </div>
                            <div class="card-content table-responsive">
                                <table class="table">
                                    <thead class="text-primary">

                                    <th>إجابة الفتوى</th>
                                    <th>سؤال الفتوى</th>
                                    <th>البريد الإلكترونى</th>
                                    <th>رقم الجوال</th>
                                    <th>الاسم</th>
                                    </thead>
                                    <tbody>

                                    <?php

                                    while ($row = mysqli_fetch_array($result)) {
                                        //if ($row["status"] ===  "waiting"){

                                        ?>
                                        <tr>

                                            <?php
                                                if ($row["answer"] != null){
                                            ?>
                                                    <td><?php echo $row["answer"]; ?></td>
                                            <?php
                                                }
                                                else{
                                            ?>
                                                    <td class="text-primary">
                                                        <button id="showAnswerBtn" onclick="showAnswerDiv(this, <?php echo $row["id"]; ?>)" class="btn btn-primary pull-right">إدخل إجابة</button>
                                                        <br>

                                                        <div class="col-md-8" id="<?php echo $row["id"]; ?>" style="display: none;">
                                                            <div class="card">
                                                                <div class="card-header" data-background-color="red">
                                                                    <h4 class="title">إجابة الفتوى</h4>
                                                                    <p class="category">إدخل إجابة الفتوى</p>
                                                                </div>
                                                                <div class="card-content">
                                                                    <form  onsubmit="submitForm(this)">

                                                                        <div class="row">
                                                                            <div class="col-md-12">
                                                                                <div class="form-group">
                                                                                    <label>الإجابة</label>
                                                                                    <div class="form-group label-floating">
                                                                                        <label class="control-label"></label>
                                                                                        <input name="id" id="id" value="<?php echo $row["id"]; ?>" style="display: none;">
                                                                                        <textarea name="answer" id="answer" class="form-control" rows="5"></textarea>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>

                                                                        <button type="submit" class="btn btn-primary pull-right">إدخل إجابة</button>
                                                                        <div class="clearfix"></div>
                                                                    </form>
                                                                </div>
                                                            </div>
                                                        </div>

                                                    </td>



                                            <?php
                                                }
                                            ?>
                                            <td><?php echo $row["question"]; ?></td>
                                            <td><?php echo $row["email"]; ?></td>
                                            <td><?php echo $row["mobile"]; ?></td>
                                            <td><?php echo $row["name"]; ?></td>

                                        </tr>

                                        <?php
                                        //}
                                    }
                                    ?>

                                    </tbody>
                                </table>

                            </div>
                        </div>
                    </div>
                </div>

                <div id="modal-dialog" class="modal">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <a href="#" data-dismiss="modal" aria-hidden="true" class="close">×</a>
                                <h3>Are you sure</h3>
                            </div>
                            <div class="modal-body">
                                <p>Do you want to submit the form?</p>
                            </div>
                            <div class="modal-footer">
                                <a href="#" id="btnYes" class="btn confirm">Yes</a>
                                <a href="#" data-dismiss="modal" aria-hidden="true" class="btn secondary">No</a>
                            </div>
                        </div>
                    </div>
                </div>


            </div>
        </div>

        <footer class="footer">
            <div class="container-fluid">
                <nav class="pull-left">
                    <ul>
                        <li>
                            <a href="http://ahalyalqassim.com" target="_blank">
                                Ahaly Al-Qassim
                            </a>
                        </li>
                        <li>
                            <a href="https://play.google.com/store/apps/details?id=com.khaled.hegg" target="_blank">
                                Android
                            </a>
                        </li>
                        <li>
                            <a href="https://itunes.apple.com/us/app/%D8%A3%D9%87%D8%A7%D9%84%D9%89-%D8%A7%D9%84%D9%82%D8%B5%D9%8A%D9%85/id1272801796?ls=1&mt=8" target="_blank">
                                iOS
                            </a>
                        </li>

                    </ul>
                </nav>
                <p class="copyright pull-right">
                    &copy; <script>document.write(new Date().getFullYear())</script> <a href="http://nakeeb.me">Mamdouh El Nakeeb</a>, All rights reserved
                </p>
            </div>
        </footer>
    </div>
</div>

</body>

<script>

    function showAnswerDiv(btn, id) {
        document.getElementById(id).style.display = "block";
        btn.style.display = "none";
    }

    function submitForm(form) {
        //var form = document.getElementById(form.id);

        form.style.display = 'none';

        var processing = document.createElement('span');

        processing.appendChild(document.createTextNode('processing ...'));

        form.parentNode.insertBefore(processing, form);

        var id = $("input#id").val();
        var answer = $("textarea#answer").val();

        var dataString = 'id='+ id + '&answer=' + answer;
        //alert (dataString);return false;
        $.ajax({
            type: "POST",
            url: "../updateFatwa.php",
            data: dataString,
            success: function() {
                alert("Answer Submitted");
            }
        });
        return false;


    }

    function removeFatwa(fatwa) {
        $('#fatwaQ').text(fatwa);
    }

    $('#removeBtnCon').click(function(){
        /* when the submit button in the modal is clicked, submit the form */
        alert('submitting');
        $('#formfield').submit();

        var dataString = 'id='+ id;

        $.ajax({
            type: "POST",
            url: "../removeFatwa.php",
            data: dataString,
            success: function() {
                alert("Fatwa Removed");
            }
        });
        return false;
    });

    $('#modal-dialog').on('show', function() {
        var link = $(this).data('link'),
            confirmBtn = $(this).find('.confirm');
    })

</script>

<!--   Core JS Files   -->
<script src="assets/js/jquery-3.1.0.min.js" type="text/javascript"></script>
<script src="assets/js/bootstrap.min.js" type="text/javascript"></script>
<script src="assets/js/material.min.js" type="text/javascript"></script>

<!--  Charts Plugin -->
<script src="assets/js/chartist.min.js"></script>

<!--  Notifications Plugin    -->
<script src="assets/js/bootstrap-notify.js"></script>

<!--  Google Maps Plugin    -->
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js"></script>

<!-- Material Dashboard javascript methods -->
<script src="assets/js/material-dashboard.js"></script>

<!-- Material Dashboard DEMO methods, don't include it in your project! -->
<script src="assets/js/demo.js"></script>

<script src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>

</html>
