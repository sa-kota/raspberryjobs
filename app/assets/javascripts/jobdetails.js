
$(document).ready(function($) {

    $('#externalLink').click(function(e){
        var email=prompt("Please enter Email Address");

        var goodEmail = "";

        if (email!=null && email!=""){
            goodEmail = email.match(/^([-A-Za-z0-9._\'\&+])+@[-A-Za-z0-9._\'+]+[.][A-Za-z]{2,}$/gi);
        }

        if (email!=null && email!="" && goodEmail)
        {
            $.post('/jobdetails/external', { jobdid: $('#jobdid').val(), email: email } , function(data,status) {
                if (status == "success"){
                    window.location.href = '/jobs/jobrecs?jobdid=' + $('#jobdid').val();
                }
                else
                {
                    $('#pageMessage').html("Server Error. Try again later");
                }
            });
        }
        else{
            $('#pageMessage').html("Invalid Email Address");
            e.preventDefault();
        }
    });

});