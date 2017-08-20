/* [ ---- Gebo Admin Panel - datatables ---- ] */

$(document).ready(function()
{
    
    $("#avisFavorable1").click(function() {
        $("#avisFavorable").show();
        $("#projetRejete").hide();
        
    });
    $("#rejete1").click(function() {
        $("#projetRejete").show();
        $("#avisFavorable").hide();
        
    });
    $("#nouvelleVersion").click(function() {
        $("#projetRejete").hide();
        $("#avisFavorable").hide();
        
    });
});