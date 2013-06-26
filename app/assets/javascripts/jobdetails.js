$(document).ready(function($) {
    $('#externalLink, #internalLink').click(function(){
        window.location.href = '/jobs/jobrecs?jobdid=' + $('#jobdid').val();
    });
});