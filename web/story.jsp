<%-- 
    Document   : story.jsp
    Created on : Mar 28, 2022, 10:35:12 AM
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
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script type="text/javascript" src="//code.jquery.com/jquery-3.6.0.min.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Exo+2:ital,wght@0,100;0,200;0,300;0,500;1,100;1,200;1,300&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <title> | Cruz Notes</title>

    <style>
        @import url('https://fonts.googleapis.com/css2?family=Shadows+Into+Light&display=swap');
        
        html{
            background: #fdf8ea;
        }

        *{
            padding: 0;
            margin: 0;
            box-sizing: border-box;
            font-family: 'Exo 2', sans-serif;
        }
        
        .brand{
            font-family: 'Shadows Into Light', cursive;
            font-size: 1em;
            font-weight: bold;
            color: white;
        }

        p{
            margin-bottom: 2px;
        }

        body{
            background: #fdf8ea;
        }

        @media screen and (min-width: 992px) {
            .container.edit{
                max-width: 880px
            }
        }
        
        .bg_main{
            background: #fdf8ea;
        }
        
        #back_btn{
            background: none;
            border: 1px solid #e0e0e0;
            width: 35px;
            height: 35px;
            margin-bottom: 20px;
            border-radius: 100%;
            font-size: .8em;
            font-weight: 900;
        }

        .news_date{
            margin-bottom: 10px;
            font-size: .9em;
            font-weight: 400;
            color: gray;
        }

        .news_header{
            font-weight: 900;
            font-size: 1.2em;
            margin-bottom: 10px;
        }

        .news_author{
            margin-bottom: 5px;
            font-size: .9em;
            font-weight: 400;
            color: gray;
        }

        .news_image{
            height: 400px;
            background: whitesmoke;
        }

        @media screen and (min-width: 992px){
            .news_image{
                max-width: 1080px;
            }
        }

        @media screen and (max-width: 992px){
            .news_image{
                height: 250px;
            }
        }

        .news_image img{
            height: 100%;
            width: 100%;
            object-fit: cover;
        }

        .news_body{
            font-size: .9em;
            color: #444;
            margin-bottom: 10px;
        }
        
        .btn_main,
        .btn_main:hover{
            background:  #333;
            color: white;
        }
        
        .comment_card{
            display: flex;
            padding: 10px;
            margin-bottom: 20px;
        }
        
        .comment_card .image{
            height: 70px;
            width: 70px;
            border-radius: 50px;
            background: #333;
            margin-right: 20px;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        
        .comment_card .image p{
            color: white;
            font-weight: 900;
        }
        
        .comment_card .text_contain{
            flex: 1;
        }
        
        .comment_card .text_contain .name{
            font-weight: 900;
            margin-bottom: 7px
        }
        
        .comment_card .text_contain .date{
            color: gray;
            font-size: .8em;
            font-weight: 400;
            margin-bottom: 10px
        }
        
        .comment_card .text_contain .body{
            color: #444;
            font-weight: 400;
            margin-bottom: 10px;
            font-size: .9em;
        }
        
        .no_comment_card{
            height: 200px;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
            text-align: center;
        }
        
        .no_comment_card i{
            margin-bottom: 20px;
            font-size: 2.3em;
        }

        .tags_contain{
            display: flex;
            flex-wrap: wrap;
        }

        .tags_contain .tag{
            margin-right: 10px;
            color: gray;
            font-size: .9em;
            font-weight: 300;
        }

        .a2a_kit a{
            margin-bottom: 10px;
        }
        
        footer{
            display: flex;
            justify-content: center;
            margin: 10px 0;
        }
        
        footer .footer-contain{
            width: 600px;
            padding: 20px;
            text-align: center;
            display: flex;
            align-items: center;
            flex-direction: column;
        }
        
        footer .footer-contain > p{
            font-size: .9em;
            font-weight: 900;
        }
        
        footer .footer-contain > p > i{
            font-weight: 400;
        }
    </style>
</head>
<body>

    <%@ include file = "navbar.html" %>
    
    <main>
        <div class="container edit my-4">
            <div class="col-md-9">
                <button id="back_btn">
                    <i class="fal fa-chevron-left"></i>
                </button>
                
                <p id="date" class="news_date">30 January 2021, 04:00am</p>
                <p id="title" class="news_header">Lorem ipsum, dolor sit amet consectetur adipisicing elit. Consectetur ipsum aliquam dolore, aperiam saepe commodi.aperiam saepe commodi.</p>
                <p id="author" class="news_author">Edward Davids</p>
            </div>
        </div>

        <div class="container_fluid">
            <div class="news_image">
                <img id="post_img" src="./post_images/" alt="">
            </div>
        </div>

        <div class="container edit my-4">
            <div class="row gx-4">
                <div class="col-md-9">
                    <div id="body" class="news_body">
                    
                        <!-- code injected -->
                        
                    </div>
                    
                    <div class="my-4">
                        <p class="mb-3">Add comment</p>
                        <div id="warning" class="alert alert-danger d-none fade show" role="alert">
                            <strong>Holy guacamole!</strong> You should check in on some of those fields below.
                        </div>
                        <form id="comment_form">
                            <div class="mb-3">
                                <input type="text" placeholder="name" name="comment_name" class="form-control bg_main" />
                            </div>
                            
                            <div class="mb-3">
                                <textarea class="form-control bg_main" name="comment_body" placeholder="comment body"></textarea>
                            </div>
                            
                            <button type="submit" class="btn btn_main">submit</button>
                        </form>
                    </div>
                    
                    <div class="my-4">
                        <p class="mb-3">Comments</p>
                        
                        <div id="comment_container">
                            
                            <!-- code injected -->
                            
                        </div>
                        
                    </div>
                </div>
                <div class="col-md-3">
                    <div id="tags" class="tags_contain">
                        
                        <!-- code injected -->
                        
                    </div>
                    <!-- AddToAny BEGIN -->
                    <div class="a2a_kit a2a_kit_size_32 a2a_default_style d-flex my-3 flex-wrap" data-a2a-icon-color="#333333">
                        <a class="a2a_button_facebook"></a>
                        <a class="a2a_button_twitter"></a>
                        <a class="a2a_button_email"></a>
                        <a class="a2a_button_whatsapp"></a>
                        <a class="a2a_button_linkedin"></a>
                        <a class="a2a_button_telegram"></a>
                    </div>
                    <!-- AddToAny END -->
                </div>
            </div>
        </div>
    </main>
    
    <%@ include file = "footer.html" %>
    
    <script async src="https://static.addtoany.com/menu/page.js"></script>
    <script>
        let post;
        let comments;
        
        const formatDate = (d) => {
            let days = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday']
            let months = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December']
            let newdate = new Date(d)

            let str = `\${days[newdate.getDay()]}, \${newdate.getDate()} \${months[newdate.getMonth()]} \${newdate.getFullYear()}`

            return str
        }
        
        const updateCommentDOM = (comms) => {
            document.getElementById("comment_container").innerHTML = ""
            
            if (comms.length > 0 ) {
                
                comms.forEach((comm) => {
                    document.getElementById("comment_container").innerHTML += `
                        
                        <div class="comment_card">
                            <div class="image">
                                <p>\${comm.user_name[0]}</p>
                            </div>
                            <div class="text_contain">
                                <p class="name">\${comm.user_name}</p>
                                <p class="date">\${formatDate(comm.comment_date)}</p>
                                <p class="body">\${comm.comment_body}</p>
                            </div>
                        </div>
                        
                    `
                })
                
            } else{
                document.getElementById("comment_container").innerHTML += `
                    <div class="no_comment_card">
                        <div>
                            <i class="fal fa-exclamation-circle"></i>
                            <p>This Post has no comment yet</p>
                        </div>
                     </div>
                `
            }
        }
        
        const getComments = () => {
            $.ajax({
                url: 'postcomments',
                data: "post_id=" + post.id,
                type: 'GET',
                
                success: (msg) => {
                    comments = JSON.parse(msg)
                    updateCommentDOM(comments)
                },
                
                error: (err) => {
                    console.log(err)
                }
            })
        }
        
        $(document).ready(function() {
            post = ${post}
            
            document.title = `\${post.title} | Cruz Notes`
            
            document.getElementById("body").innerHTML = post.content
            
            post.tags.split(',').forEach(tag => {
                document.getElementById("tags").innerHTML += `<p class="tag">#\${tag}</p>`
            })
            
            document.getElementById("post_img").src += post.image
            
            document.getElementById("author").innerHTML = post.author
            
            document.getElementById("title").innerHTML = post.title
            
            document.getElementById("date").innerHTML = formatDate(post.date_created)
            
            getComments()
            
        })
        
        let form = document.getElementById("comment_form")
        
        form.addEventListener('submit', (e) => {
            e.preventDefault()
            
            if (form.comment_name.value === "" || form.comment_body.value === ""){
                document.getElementById("warning").classList.replace("d-none", "d-block")
            } else {
                document.getElementById("warning").classList.replace("d-block", "d-none")
                
                let data = {
                    post_id: post.id,
                    user_name: form.comment_name.value,
                    comment_body: form.comment_body.value
                }
                
                $.ajax({
                    url: 'postcomments',
                    data: data,
                    type: 'POST',
                    
                    success: (msg) => {
                        msg = JSON.parse(msg)
                        
                        if(msg.status === "success"){
                            Swal.fire({
                                toast: true,
                                position: 'bottom-end',
                                icon: 'success',
                                title: "Comment posted successfully",
                                showConfirmButton: false,
                                timer: 2000,
                                timerProgressBar: true,
                            })
                            getComments()
                        } else {
                            Swal.fire({
                                toast: true,
                                position: 'bottom-end',
                                icon: 'error',
                                title: "An error occured, Please retry",
                                showConfirmButton: false,
                                timer: 2000,
                                timerProgressBar: true,
                            })
                        }
                    },

                    error: (err) => {
                        console.log(err)
                    }
                })
            }
        })
        
        document.getElementById("back_btn").addEventListener('click', () => {
            window.location.href = "./"
        })
    </script>
</body>
</html>
