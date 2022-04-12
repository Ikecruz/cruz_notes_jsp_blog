<%-- 
    Document   : email
    Created on : Mar 30, 2022, 2:38:35 PM
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
        
        p{
            margin-bottom: 0;
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
        
        @media screen and (max-width: 992px) {
            .table-responsive-md{
                display: block;
            }
        }
        
        .action-btn{
            background: none;
            border: none;
            padding: 0 10px;
            display: block;
        }
        
        .action-btn.delete-btn{
            color: red;
        }
        
        td p{
            font-size: .9em;
            font-weight: 500;
            display: block;
        }
        
        td:nth-child(3) p{
            width: 250px;
        }
        
        .tags{
            color: gray;
            margin-right: 10px;
            margin-bottom: 5px;
        }
        
        .submit-btn{
            display: block;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            background: #222;
            font-size: .9em;
            color: white;
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
                <ul class="side_bar_list">
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
                <ul class="side_bar_list active">
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
                <p class="page_header">Emails</p>
                <p id="date_display">Monday, December 6 2022</p>
            </div>
            <div class="px-md-5 px-3">
                
                <div class="table_contain p-4">
                    <table id="example" class="table align-middle table-striped table-responsive-md" style="width:100%">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Email</th>
                                <th>Date Created</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody id="table_body">
                            
                            <!-- code injected -->
                            
                        </tbody>
                        <tfoot>
                            <tr>
                                <th>#</th>
                                <th>Email</th>
                                <th>Date Created</th>
                                <th>Actions</th>
                            </tr>
                        </tfoot>
                    </table>
                </div>
                
            </div>
        </div>
    </div>

    <script src="sidebar.js"></script>
    <script>
        let emails;
        
        const formatDate = (d) => {
            let days = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday']
            let months = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December']
            let newdate = new Date(d)

            let str = `\${days[newdate.getDay()]}, \${newdate.getDate()} \${months[newdate.getMonth()]} \${newdate.getFullYear()}`

            return str
        }
        
        $(document).ready(function() {
            $('#date_display').text(formatDate(new Date()))
            
            emails = ${emails}
            
            document.getElementById("table_body").innerHTML = ""
            
            emails.forEach((email, index) => {
                
                document.getElementById("table_body").innerHTML += `
                    
                    <tr>
                        <td>
                            <p>\${index + 1}</p>
                        </td>
                        <td>
                            <p>\${email.email_body}</p>
                        </td>
                        <td><p>\${formatDate(email.date_created)}</p></td>
                        <td>
                            <div class="d-flex">
                                <button title="Delete Post" class="action-btn delete-btn" data-id="\${index}">
                                    <i class="fal fa-trash"></i>
                                </button>
                            </div>
                        </td>
                    </tr>
                    
                `
                
            })
            
            $('#example').DataTable();
            
            $(".delete-btn").click((e) => {
                let id = $(e.currentTarget).attr('data-id')
                
                let parent = $(e.currentTarget).parent('div').parent('td').parent('tr')
                
                let email = emails[id]
                
                Swal.fire({
                    title: 'Are you sure?',
                    text: "You won't be able to revert this!",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Yes, delete it!'
                }).then((result) => {
                    if (result.isConfirmed) {
                        $.ajax({
                            url: "emails",
                            data: {email_id: email.email_id},
                            type: 'POST',

                            success: (msg) => {
                                msg = JSON.parse(msg)

                                if (msg.status === "success"){

                                    parent.fadeOut('slow')

                                    Swal.fire({
                                        toast: true,
                                        position: 'top-end',
                                        icon: 'success',
                                        title: "Email deleted successfully",
                                        showConfirmButton: false,
                                        timer: 3000,
                                        timerProgressBar: true,
                                    })
                                } else {
                                    Swal.fire({
                                        toast: true,
                                        position: 'top-end',
                                        icon: 'error',
                                        title: "Email delete failed",
                                        showConfirmButton: false,
                                        timer: 3000,
                                        timerProgressBar: true,
                                    })
                                }
                            },
                        })
                    }    
                })
                
                
            })
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