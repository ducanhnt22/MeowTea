/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function Showtable() {
    var click = document.getElementById('mydiv');
    if (click.style.display == 'block') {
        document.getElementById('mydiv').style.display = 'none';
    } else {
        document.getElementById('mydiv').style.display = 'block';
    }
}