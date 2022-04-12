<%-- 
    Document   : allposts
    Created on : Mar 29, 2022, 1:30:18 PM
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
        
        td:nth-child(2) p{
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
                <ul class="side_bar_list active">
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
                <p class="page_header">All Posts</p>
                <p id="date_display">Monday, December 6 2022</p>
            </div>
            <div class="px-md-5 px-3">
                
                <div class="table_contain p-4">
                    <table id="example" class="table align-middle table-striped table-responsive-md" style="width:100%">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Title</th>
                                <th>Tags</th>
                                <th>Views</th>
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
                                <th>Title</th>
                                <th>Tags</th>
                                <th>Views</th>
                                <th>Date Created</th>
                                <th>Action</th>
                            </tr>
                        </tfoot>
                    </table>
                </div>
                
                <div class="modal fade" id="editModal" tabindex="-1" aria-labelledby="editModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
                        <div class="modal-content">
                            <form name="edit-form">
                                <div class="modal-header">
                                    <p id="exampleModalLabel">Modal title</p>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <div id="warning" class="alert alert-danger d-none fade show" role="alert">
                                        
                                    </div>
                                    <div class="mb-4">
                                        <label class="form-label">Post Title</label>
                                        <input id="post_title" type="text" value="" class="form-control" readonly />
                                    </div>
                                    <div class="mb-4">
                                        <label class="form-label">Post content</label>
                                        <textarea id="summernote" value="" name="content"></textarea>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="submit" class="submit-btn">Save changes</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                
            </div>
        </div>
    </div>

    <script src="sidebar.js"></script>
    <script>
        let posts;
        
        $('#summernote').summernote({
            tabsize: 2,
            height: 120,
            toolbar: [
            ['style', ['style']],
            ['font', ['bold', 'underline', 'clear']],
            ['color', ['color']],
            ['para', ['ul', 'ol', 'paragraph']],
            ['table', ['table']],
            ['insert', ['link', 'picture']],
            ['view', ['help']]
            ]
        });
        
        const formatDate = (d) => {
            let days = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday']
            let months = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December']
            let newdate = new Date(d)

            let str = `\${days[newdate.getDay()]}, \${newdate.getDate()} \${months[newdate.getMonth()]} \${newdate.getFullYear()}`

            return str
        }
        
        const returnTags = (tags) => {
            
            let rt = "";
            
            tags.split(',').forEach((tag) => {
                rt += `<p>#\${tag}</p>`
            })
            
            return rt
        }
        
        $(document).ready(function() {
            $('#date_display').text(formatDate(new Date()))
            
            posts = ${posts}
            
            document.getElementById("table_body").innerHTML = ""
            
            posts.forEach((post, index) => {
                
                document.getElementById("table_body").innerHTML += `
                    
                    <tr>
                        <td>
                            <p>\${index + 1}</p>
                        </td>
                        <td>
                            <p>\${post.title}</p>
                        </td>
                        <td>
                            <div class="d-flex">
                                \${returnTags(post.tags)}
                            </div>
                        </td>
                        <td><p>\${post.views}</p></td>
                        <td><p>\${formatDate(post.date_created)}</p></td>
                        <td>
                            <div class="d-flex">
                                <button title="Delete Post" class="action-btn delete-btn" data-id="\${index}">
                                    <i class="fal fa-trash"></i>
                                </button>
                                <button title="Edit Post" class="action-btn edit-btn" data-id="\${index}">
                                    <i class="fal fa-edit"></i>
                                </button>
                            </div>
                        </td>
                    </tr>
                    
                `
                
            })
            
            $('#example').DataTable();
            
            $(".edit-btn").click((e) => {
                let id = $(e.currentTarget).attr('data-id')
                
                let post = posts[id]
                
                $('#editModal').modal('show')
                
                $('#post_title').val(post.title)
                $('.note-editable').html(post.content)
                
                let form = document.getElementsByName("edit-form")[0]
                
                form.addEventListener('submit', (e) => {
                    
                    e.preventDefault();
                    
                    if ($('#post_title').val() === "" || $('.note-editable').html() === "" ) {
                        document.getElementById("warning").classList.replace("d-none", "d-block")
                        document.getElementById("warning").innerHTML = "<strong>Holy guacamole!</strong> You should check in on some of those fields below."
                        
                        return;
                    }
                    
                    if ($('.note-editable').html().replace( /(<([^>]+)>)/ig, '').length < 100) {
                        document.getElementById("warning").classList.replace("d-none", "d-block")
                        document.getElementById("warning").innerHTML = "<strong>Holy guacamole!</strong> Your post content should be more than 100 characters"

                        return;
                    }
                       
                    document.getElementById("warning").classList.replace("d-block", "d-none")
                        
                    let data = {
                        post_id: post.id,
                        content: $('.note-editable').html()
                    }

                    $.ajax({
                        url: "adminpost",
                        data: data,
                        type: 'POST',

                        success: (msg) => {
                            msg = JSON.parse(msg)

                            if (msg.status === "success"){

                                $('#editModal').modal('hide')

                                Swal.fire({
                                    toast: true,
                                    position: 'top-end',
                                    icon: 'success',
                                    title: "Post update successfully",
                                    showConfirmButton: false,
                                    timer: 3000,
                                    timerProgressBar: true,
                                })
                            } else {
                                Swal.fire({
                                    toast: true,
                                    position: 'top-end',
                                    icon: 'error',
                                    title: "Post update failed",
                                    showConfirmButton: false,
                                    timer: 3000,
                                    timerProgressBar: true,
                                })
                            }
                        },

                        error: (err) => {
                            console.log(err)
                        }
                    })   
                    
                })
                
            })
            
            $(".delete-btn").click((e) => {
                let id = $(e.currentTarget).attr('data-id')
                
                let parent = $(e.currentTarget).parent('div').parent('td').parent('tr')
                
                let post = posts[id]
                
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
                            url: "adminpost",
                            data: "post_id=" + post.id,
                            type: 'GET',

                            success: (msg) => {
                                msg = JSON.parse(msg)

                                if (msg.status === "success"){

                                    parent.fadeOut('slow')

                                    Swal.fire({
                                        toast: true,
                                        position: 'top-end',
                                        icon: 'success',
                                        title: "Post deleted successfully",
                                        showConfirmButton: false,
                                        timer: 3000,
                                        timerProgressBar: true,
                                    })
                                } else {
                                    Swal.fire({
                                        toast: true,
                                        position: 'top-end',
                                        icon: 'error',
                                        title: "Post delete failed",
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
