function changepic(obj) {
    var newsrc = getObjectURL(obj.files[0]);
    document.getElementById('show').src = newsrc;
}

function getObjectURL(file) {
    var url = null ;
    if (window.createObjectURL != undefined) { // basic
    	url = window.createObjectURL(file) ;
    } else if (window.URL != undefined) { // mozilla(firefox)
        url = window.URL.createObjectURL(file) ;
    } else if (window.webkitURL != undefined) { // webkit or chrome
        url = window.webkitURL.createObjectURL(file) ;
    }
    return url ;
}