$(document).ready(function($) {
    $('#externalLink').click(function(){
        window.location.href = '/jobs/jobrecs?jobdid=' + $('#jobdid').val();
    });
});