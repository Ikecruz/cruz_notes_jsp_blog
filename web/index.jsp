<%-- 
    Document   : index
    Created on : Mar 25, 2022, 11:44:23 AM
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
    <script type="text/javascript" src="//code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <link href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Exo+2:ital,wght@0,100;0,200;0,300;0,500;1,100;1,200;1,300&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <title>Cruz Notes</title>
</head>
<body>

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

        .today_news_contain_scroll{
            width: 100%;
            display: flex;
            overflow-x: auto;
        }

        .today_news_contain_scroll::-webkit-scrollbar {
            height: 2px;
        }
        
        .today_news_contain_scroll::-webkit-scrollbar-track {
            background: #f1f1f1; 
        }
        
        .today_news_contain_scroll::-webkit-scrollbar-thumb {
            background: #333; 
        }

        .today_news_contain_scroll::-webkit-scrollbar-thumb:hover {
            background: #111;
        }

        .today_news_contain{
            display: flex;
            padding: 20px 0;
        }

        .today_news_contain .today_news{
            display: block;
            width: 500px;
            height: 300px;
            background: whitesmoke;
            border-radius: 5px;
            overflow: hidden;
            position: relative;
        }

        @media screen and (max-width: 992px){
            .today_news_contain .today_news{
                height: 250px;
                width: 400px;
            }
        }

        @media screen and (max-width: 768px){
            .today_news_contain .today_news{
                height: 200px;
                width: 300px;
                font-size: .9em;
            }
        }

        .today_news_contain .today_news:not(:last-child){
            margin-right: 25px;
        }

        @media screen and (max-width: 768px){
            .today_news_contain .today_news:not(:last-child){
                margin-right: 15px;
            }
        }

        .today_news_contain .today_news .today_news_img{
            height: 100%;
            width: 100%;
        }

        .today_news_contain .today_news .today_news_img img{
            height: 100%;
            width: 100%;
            object-fit: cover;
        }

        .today_news_contain .today_news .today_news_text{
            position: absolute;
            top: 0;
            left: 0;
            height: 100%;
            width: 100%;
            background: rgba(0, 0, 0, 0.4);
            color: white;
            padding: 10px 20px;
            display: flex;
            align-items: flex-end;
        }

        .today_news_contain .today_news .today_news_text .today_news_header{
            margin-bottom: 10px;
        }

        .today_news_contain .today_news .today_news_text .today_news_name_date > span{
            font-weight: 200;
        }

        .latest_news_card{
            display: block;
            margin-bottom: 30px;
            border-radius: 5px;
            overflow: hidden;
            color: #222;
            text-decoration: none;
        }

        .latest_news_card:hover{
            color: #222;
            text-decoration: none;
        }

        .latest_news_card .latest_news_img{
            height: 150px;
            width: 100%;
        }

        .latest_news_card .latest_news_img img{
            height: 100%;
            width: 100%;
            object-fit: cover;
        }

        @media screen and (max-width: 768px){
            .latest_news_card .latest_news_img{
                height: 100px;
                width: 100%;
            }
        }

        .latest_news_card .latest_news_header{
            border-top: 1.5px solid #333;
            border-bottom: 1.5px solid #333;
            margin: 15px 0;
            padding: 10px 0;
        }

        .latest_news_card .latest_news_header p{
            font-size: .9em;
            font-weight: 900;
            display: -webkit-box;
            -webkit-line-clamp: 3;
            -webkit-box-orient: vertical;  
            overflow: hidden;
        }

        .latest_news_card .latest_news_body p{
            font-size: .8em;
            font-weight: 400;
            display: -webkit-box;
            -webkit-line-clamp: 4;
            -webkit-box-orient: vertical;  
            overflow: hidden;
            margin-bottom: 10px;
        }
        
        .latest_news_date p{
            font-size: .8em;
        }

        .news_letter_contain{
            width: 100%;
            background: #222;
            border-radius: 5px;
            padding: 30px 20px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            color: white;
            text-align: center;
        }
        
        .news_letter_contain i{
            font-size: 1.3em;
            margin-bottom: 10px;
        }
        
        .news_letter_contain .header{
            font-size: 1.1em;
            margin-bottom: 10px;
            font-weight: 900;
        }
        
        .news_letter_contain .sub_text{
            margin-bottom: 15px;
            font-size: .9em;
            font-weight: 300;
        }
        
        .news_letter_contain #input_form{
            width: 100%;
            height: 40px;
            padding: 5px 10px;
            border-radius: 5px;
            background: white;
            display: flex;
        }
        
        .news_letter_contain #input_form input{
            border: none;
            outline: none;
            height: 100%;
            width: 80%;
            padding-right: 10px;
            font-size: .9em;
        }
        
        .news_letter_contain #input_form button{
            border: none;
            outline: none;
            height: 100%;
            width: 20%;
            background: #222;
            color: white;
            border-radius: 5px;
/*            display: flex;
            justify-content: center;
            align-items: center;*/
            font-size: .7em;
        }
        
        .news_letter_contain #input_form button i{
            margin: 0;
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

    <%@ include file = "navbar.html" %>
    
    <main>
        <div class="container">
            <p class="fs-5 my-3 fw-bold">Trending</p>
            
            <div class="today_news_contain_scroll">

                <div id="feat_news_contain" class="today_news_contain">

                    <!-- code injected -->

                </div>

            </div>
        </div>

        <div class="container py-4">
            <p class="fs-5 my-4 fw-bold">Latest Updates</p>
            <div class="row gx-4">
                <div class="col-md-9">
                    <div id="latest_news_contain" class="row gx-4">
                     
                        <!-- code injected -->
                        
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="news_letter_contain">
                        <i class="fal fa-inbox-in"></i>
                        <p class="header">Subscribe</p>
                        <p class="sub_text">Enter your email and Receive e-mails of new posts</p>
                        
                        <form id="input_form">
                            <input type="email" name="user_email" required />
                            <button type="submit">
                                <i class="fal fa-paper-plane"></i>
                            </button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </main>
    
    <%@ include file = "footer.html" %>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <script>
        const formatDate = (d) => {
            let days = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday']
            let months = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December']
            let newdate = new Date(d)

            let str = `\${days[newdate.getDay()]}, \${newdate.getDate()} \${months[newdate.getMonth()]} \${newdate.getFullYear()}`

            return str
        }
        
        const formatFeatDate = (d) => {
            let days = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday']
            let months = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December']
            let newdate = new Date(d)

            let str = `\${months[newdate.getMonth()]} \${newdate.getDate()},  \${newdate.getFullYear()}`

            return str
        }
        
        const featuredNews = (featnews) => {
            const sortNumbers = (a, b) => {
                if (a.views < b.views) {
                  return 1;
                } else if (b.views < a.views) {
                  return -1;
                } else {
                  return 0;
                }
            }
                    
            
            featnews.sort( sortNumbers ).splice(0,3).forEach((news) => {
                document.getElementById("feat_news_contain").innerHTML += `
                
                    <a href="story?query_id=\${news.id}" class="today_news">
                        <div class="today_news_img">
                            <img src="./post_images/\${news.image}" alt="">
                        </div>
                        <div class="today_news_text">
                            <div>
                                <p class="today_news_header">\${news.title}</p>
                                <p class="today_news_name_date">\${news.author} | <span>\${formatFeatDate(news.date_created)}</span></p>
                            </div>
                        </div>
                    </a>
                
                `
            })
        }
        
        const loadLatestNews = (news) => {
            news.forEach((latest_news) => {
                document.getElementById("latest_news_contain").innerHTML += `
                
                    <div class="col-6 col-md-4">
                        <a href="story?query_id=\${latest_news.id}" class="latest_news_card">
                            <div class="latest_news_img">
                                <img src="./post_images/\${latest_news.image}" alt="">
                            </div>
                            <div class="latest_news_header">
                                <p> \${latest_news.title}</p>
                            </div>
                            <div class="latest_news_body">
                                <p>\${latest_news.content.replace( /(<([^>]+)>)/ig, '')}</p>
                            </div>
                            <div class="latest_news_date">
                                <p>\${formatDate(latest_news.date_created)}</p>
                            </div>
                        </a>
                    </div>
                    
                    
                `
            })
        }
        
        $(document).ready(function() {
            $.ajax({
                url: 'getpost',
                type: 'GET',

                success: (msg) => {
                    loadLatestNews(JSON.parse(msg))
                    featuredNews(JSON.parse(msg))
                },

                error: (err) => {
                    console.log("failed")
                }

            });
        })
        
        let form = document.getElementById("input_form")
        
        form.addEventListener('submit', (e) => {
            e.preventDefault()
            
            $.ajax({
                url: 'setemail',
                data: {email: form.user_email.value},
                type: 'POST',

                success: (msg) => {
                    msg = JSON.parse(msg)
                    
                    if (msg.status === "success"){
                        
                        Swal.fire({
                            toast: true,
                            position: 'top-end',
                            icon: 'success',
                            title: "You've subscriced successfully",
                            showConfirmButton: false,
                            timer: 3000,
                            timerProgressBar: true,
                        })
                        
                        return;
                    }
                    if (msg.status === "emailexists") {
                        Swal.fire({
                            toast: true,
                            position: 'top-end',
                            icon: 'error',
                            title: "Email exists",
                            showConfirmButton: false,
                            timer: 3000,
                            timerProgressBar: true,
                        })
                    }
                    
                    if (msg.status === "error") {
                        Swal.fire({
                            toast: true,
                            position: 'top-end',
                            icon: 'error',
                            title: "Subscription failed",
                            showConfirmButton: false,
                            timer: 3000,
                            timerProgressBar: true,
                        })
                    }
                },

                error: (err) => {
                    console.log(err)
                }

            });
        })
    </script>
</body>
</html>