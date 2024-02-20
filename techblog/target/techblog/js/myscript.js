var toggle=false;
function doLike(pid, uid){
    console.log(pid);
    toggle=!toggle;
    var operation = toggle ? 'Like' : 'disLike';
    
    var data = {
        uid: uid,
        pid: pid,
        operation: operation
    };
  $.ajax({
    url:'LikeServlet',
    data:data,
    success:function(data ,textStatus,jqXHR){
        console.log(data)
        
        var likeBtn = document.getElementById('likeBtn_'+pid);
        var likeIcon = document.getElementById('likeIcon_'+pid);
    likeIcon.className = toggle ? 'fa fa-thumbs-up' : 'fa fa-thumbs-o-up';

            if (toggle) {
                likeBtn.classList.remove('btn-outline-light');
                likeBtn.classList.add('btn-light');
                if(data){
                    let id='#'+$.escapeSelector(pid);
                    let c=$(id).html();
                    c++;
                    $(id).html(c);
                }
                
            } else {
                likeBtn.classList.remove('btn-light');
                likeBtn.classList.add('btn-outline-light');
                let id='#'+$.escapeSelector(pid);
                let c=$(id).html();
                c--;
                $(id).html(c);
            }
    },
    error:function(jqXHR,textStatus,errorThrown){
        console.log(errorThrown)
    }
})

  
}
