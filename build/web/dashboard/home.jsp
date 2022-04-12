<%-- 
    Document   : home
    Created on : Mar 31, 2022, 3:48:03 PM
    Author     : devcruz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="sidebar.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.6.0/mdb.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/bs5/jq-3.3.1/dt-1.10.25/sc-2.0.4/datatables.min.css"/>
    <link href="https://fonts.googleapis.com/css2?family=Exo+2:ital,wght@0,100;0,200;0,300;0,500;1,100;1,200;1,300&display=swap" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/v/bs5/jq-3.3.1/dt-1.10.25/sc-2.0.4/datatables.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <!-- include summernote css/js -->
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
    <title>All Post - Dashboard | Cruz Notes</title>
    <style>
        *{
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Exo 2', sans-serif;
        }

        .page_header{
            font-weight: 900;
            font-size: 1.1em;
        }

        .btn-main,
        .btn-main:hover{
            background: #222;
            color: white;
        }
        
        #date_display{
            font-weight: 400;
            font-size: .9em;
            color: gray;
        }
        
        .table_contain{
            border: 1px solid #222;
            margin: 20px 0;
        }
        
        
    </style>
</head>
<body>
    <div class="dash_contain">
        <div id="overlay" onclick="setMobile()"></div>
        <div id="sidebar" class="side_bar mobile">
            <div class="my-4">
                <p class="brand dash_brand">Cruz Notes</p>
            </div>
            <div class="my-4">
                <ul class="side_bar_list active">
                    <li><a href="home">Dashboard</a></li>
                </ul>
                <ul class="side_bar_list">
                    <li><a href="addpost">New Post</a></li>
                </ul>
                <ul class="side_bar_list">
                    <li><a href="allpost">Posts</a></li>
                </ul>
                <ul class="side_bar_list">
                    <li><a href="comments">Comments</a></li>
                </ul>
                <ul class="side_bar_list">
                    <li><a href="emails">Emails</a></li>
                </ul>
                <ul class="side_bar_list">
                    <li id="logout"><a href="javascript:void(0)">Logout</a></li>
                </ul>
            </div>
        </div>
        <div class="main_contain">
            <div class="mobile_nav">
                <button onclick="setMobile()" class="nav_toggler"><i class="fal fa-bars"></i></button>
                <p class="brand">Cruz Notes</p>
            </div>
            <div class="px-md-5 px-3 py-4 border-bottom d-flex justify-content-between align-items-center">
                <p class="page_header">Dashboard</p>
                <p id="date_display">Monday, December 6 2022</p>
            </div>
            <div class="px-md-5 px-3">
                
                <div class="table_contain p-4">
                    
                </div>
                
            </div>
        </div>
    </div>

    <script src="sidebar.js"></script>
    <script>
        
        const formatDate = (d) => {
            let days = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday']
            let months = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December']
            let newdate = new Date(d)

            let str = `\${days[newdate.getDay()]}, \${newdate.getDate()} \${months[newdate.getMonth()]} \${newdate.getFullYear()}`

            return str
        }
        
        $(document).ready(function() {
            $('#date_display').text(formatDate(new Date()))
            
            
        });
    </script>

    <script>
        $('#logout').click(() => {
            Swal.fire({
                title: 'Are you sure?',
                text: "You will be logged out",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Yes, log me out!'
            }).then((result) => {
                if (result.isConfirmed) {
                    $.ajax({
                        url: "destroysession",
                        type: 'GET',

                        success: () => {
                            window.location.replace("../");
                        }
                    })
                }

            })
        })
    </script>
</body>
</html>

