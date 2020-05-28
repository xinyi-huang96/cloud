function changepic(obj) {
    var newsrc = getObjectURL(obj.files[0]);
    document.getElementById('show').src = newsrc;
    
    var objFile = body.find(obj).val();
    param.img = img;
    var params = {};
    params.productName = productName;
    params.sort = sort;
    params.description = decrp;
    params.img = img;
    $.ajax({
         url:"<%=request.getContextPath() %>/servlet/PhotoAdd",
         dataType:'json',
         type:"POST",
         data:params,
         cache:false,
         success:function (e) {
                parent.layer.msg(result.msg,{time:5000});
                if(e.returnValue="OK"){
                	$("input[name=photo]").val(e.result);
                    location.reload();
                 }
                 parent.layer.closeAll();
          }
    });
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