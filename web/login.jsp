<%-- 
    Document   : login
    Created on : Mar 30, 2022, 10:47:38 PM
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
    <link href="https://fonts.googleapis.com/css2?family=Exo+2:ital,wght@0,100;0,200;0,300;0,500;1,100;1,200;1,300&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <title>Login | Cruz Notes</title>

    <style>
        @import url('https://fonts.googleapis.com/css2?family=Shadows+Into+Light&display=swap');

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
            text-align: center;
            margin-bottom: 20px;
            display: block;
            color: black;
            text-decoration: none;
        }

        .brand:hover{
            color: #000;
        }

        .login_contain{
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .login_contain .login{
            width: 350px;
            padding: 10px;
        }

        .submit-btn{
            width: 100%;
            height: 35px;
            border-radius: 5px;
            border: none;
            background: #333;
            color: white;
        }

        .submit-btn:disabled{
            background: rgba(0, 0, 0, 0.5);
            cursor: not-allowed;
        }
    </style>
<body>

    <div class="login_contain">
        <form id="login-form">
            <div class="login">
                <a href="./" class="brand">Cruz Notes</a>
                <div id="warning" class="alert alert-danger d-none fade show" role="alert">
                                        
                </div>
                <div class="mb-4">
                    <label for="" class="form-label">Email</label>
                    <input type="email" name="email" class="form-control" required>
                </div>
                <div class="mb-4">
                    <label for="" class="form-label">Pasword</label>
                    <input type="password" name="password" class="form-control" required>
                </div>
                <div class="mb-4">
                    <button type="submit" id="submit-btn" class="submit-btn">Log in</button>
                </div>
            </div>
        </form>
    </div>

    <script>
        let form = document.getElementById("login-form");

        form.addEventListener('submit', (e) => {
            e.preventDefault()

            document.getElementById('warning').classList.replace('d-block', 'd-none')

            document.getElementById("submit-btn").disabled = true
            document.getElementById("submit-btn").textContent = "Loading..."

            let data = {
                email: form.email.value,
                password: form.password.value
            }

            setTimeout(() => {
                
                $.ajax({
                    url: "login",
                    data: data,
                    type: 'POST',

                    success: (msg) => {
                        msg = JSON.parse(msg)

                        if (msg.status === "success"){
                            window.location.replace("dashboard/home");
                        } else {
                            document.getElementById('warning').classList.replace('d-none', 'd-block')
                            document.getElementById('warning').innerHTML = "Email or password incorrect"
                            
                            document.getElementById("submit-btn").disabled = false
                            document.getElementById("submit-btn").textContent = "Log in"
                        }
                    },

                    error: (err) => {
                        document.getElementById('warning').classList.replace('d-none', 'd-block')
                        document.getElementById('warning').innerHTML = "An error occured...Please try again"

                        document.getElementById("submit-btn").disabled = false
                        document.getElementById("submit-btn").textContent = "Log in"
                    }
                })
            }, 1000)
        })
    </script>

</body>

</html>
