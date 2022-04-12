/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

let sidebar = document.getElementById("sidebar")
let overlay = document.getElementById("overlay")

let isMobile = false

const setMobile = () => {
    isMobile = !isMobile

    if (isMobile){
        sidebar.classList.remove('mobile')
        overlay.style.display = "block"
    } else {
        sidebar.classList.add('mobile')
        overlay.style.display = "none"
    }
}
