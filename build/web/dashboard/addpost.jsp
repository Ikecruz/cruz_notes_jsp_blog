<%-- 
    Document   : addpost
    Created on : Mar 28, 2022, 2:29:41 AM
    Author     : devcruz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Exo+2:ital,wght@0,100;0,200;0,300;0,500;1,100;1,200;1,300&display=swap" rel="stylesheet">
    <script type="text/javascript" src="//code.jquery.com/jquery-3.6.0.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="sidebar.css">
    <!-- include summernote css/js -->
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <title>Add Post - Dashboard | Cruz Notes</title>
    <style>*{
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
        
        .form_contain{
            border: 1px solid #444;
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
                <ul class="side_bar_list">
                    <li><a href="home">Dashboard</a></li>
                </ul>
                <ul class="side_bar_list active">
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
                <p class="page_header">Add new post</p>
                <p id="date_display">Monday, December 6 2022</p>
            </div>
            <div class="px-md-5 px-3">
                
                <div class="form_contain p-4">
                    <form name="post_form">
                        <div class="row my-2">
                            <div class="col-md-8">
                                <div id="warning" class="alert alert-danger d-none fade show" role="alert">
                                    
                                </div>

                                <div class="mb-4">
                                    <label for="" class="form-label">Post title</label>
                                    <input type="text" name="post_title" class="form-control" placeholder="your post header here">
                                </div>

                                <div class="mb-4">
                                    <label for="formFile" class="form-label">Post Image</label>
                                    <input class="form-control" name="post_image" type="file" id="formFile" accept=".jpg, .jpeg, .png, .gif">
                                </div>

                                <div class="mb-4">
                                    <label for="exampleFormControlInput1" class="form-label">Post content</label>
                                    <textarea id="summernote" name="content"></textarea>
                                </div>

                                <div class="mb-4">
                                    <label for="formFile" class="form-label">Post Author</label>
                                    <input class="form-control" name="post_author" type="text" placeholder="author here">
                                </div>
                            </div>
                            <div class="col-md-4">
                                <p class="mb-2">Tags</p>
                                <div class="form-check">
                                    <input class="form-check-input" name="tags" type="checkbox" value="design" id="checkbox1">
                                    <label class="form-check-label" for="checkbox1">
                                        Design
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" name="tags" type="checkbox" value="tech" id="checkbox2">
                                    <label class="form-check-label" for="checkbox2">
                                        Tech
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" name="tags" type="checkbox" value="school" id="checkbox3">
                                    <label class="form-check-label" for="checkbox3">
                                        School
                                    </label>
                                </div>

                                <div class="my-4">
                                    <p class="mb-3">Upload your post</p>
                                    <button class="btn btn-main" type="submit">upload</button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                
            </div>
        </div>
    </div>

    <script src="sidebar.js"></script>
    <script>
        $(document).ready(function() {
            $('#summernote').summernote({
                placeholder: 'Post content here',
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
        });
    </script>

    <script>
        let form = document.getElementsByName("post_form")[0]

        const checkTags = () => {
            let res = false;

            form.tags.forEach(tag => {
                if (tag.checked) {
                    res = true
                }
            })

            return res
        }
        
        const processTags = () => {
            let res = []
            
            form.tags.forEach(tag => {
                if (tag.checked) {
                    res.push(tag.value)
                }
            })
            
            return res.join(',')
            
        }

        form.addEventListener('submit', (e)=> {
            e.preventDefault()

            if (form.post_title.value === "" || form.post_author.value === "" || form.post_image.value === "" || form.content.value === "" || !checkTags()) {
                document.getElementById("warning").classList.replace("d-none", "d-block")
                document.getElementById("warning").innerHTML = "<strong>Holy guacamole!</strong> You should check in on some of those fields below."
                
                return;
            }
            
            if (form.content.value.replace( /(<([^>]+)>)/ig, '').length < 100) {
                document.getElementById("warning").classList.replace("d-none", "d-block")
                document.getElementById("warning").innerHTML = "<strong>Holy guacamole!</strong> Your post content should be more than 100 characters"
                
                return;
            }
                
            document.getElementById("warning").classList.replace("d-block", "d-none")
            let formData = new FormData();
            formData.append('section', 'general');
            formData.append('action', 'previewImg');
            // Attach file
            formData.append('image', form.post_image.files[0]); 

            let post = {
                title: form.post_title.value,
                image: "",
                tags: processTags(),
                content: form.content.value,
                author: form.post_author.value
            }

            $.ajax({
                url: 'uploadImg.jsp',
                data: formData,
                type: 'POST',
                contentType: false,
                processData: false,

                success: (msg) => {
                    post.image = JSON.parse(msg).img_name

                    $.ajax({
                        url: 'addpost',
                        data: post,
                        type: 'POST',

                        success: (msg) => {
                            Swal.fire({
                                title: 'Done',
                                text: 'Post Uploaded',
                                icon: 'success',
                                confirmButtonText: 'Ok'
                            })
                        },

                        error: (err) => {
                            Swal.fire({
                                title: 'Failed',
                                text: 'An error occured',
                                icon: 'error',
                                confirmButtonText: 'Ok'
                            })
                        }

                    });
                },

                error: (err) => {
                    Swal.fire({
                        title: 'Failed',
                        text: 'An error occured',
                        icon: 'error',
                        confirmButtonText: 'Ok'
                    })
                }

            });
        })
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
