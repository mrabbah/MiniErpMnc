function firststep() {
    var interlocuteur=$("#interlocuteur").val();
    var fonction=$("#fonction").val();
    var nomProjet=$("#nomProjet").val();
    var nomCompletProjet=$("#nomCompletProjet").val();
    var website=$("#website").val();
    var aap=$("#aap").val();
    var budget=$("#budget").val();
    var duree=$("#duree").val();
    var dateDebut=$("#dateDebut").val();
    var dateFin=$("#dateFin").val();
    var resumeFrancais=$("#resumeFrancais").val();
    var resumeAnglais=$("#resumeAnglais").val();
    var lienAap=$("#lienAap").val();
    var motsCles=$("#motsCles").val();
    $.post("/MiniErpMnc/labelisationProjet/save",
              {
                    interlocuteur:interlocuteur,
                    fonction:fonction,
                    nomProjet:nomProjet,
                    nomCompletProjet:nomCompletProjet,
                    website:website,
                    aap:aap,
                    budget:budget,
                    duree:duree,
                    dateDebut:dateDebut,
                    dateFin:dateFin,
                    resumeFrancais:resumeFrancais,
                    resumeAnglais:resumeAnglais,
                    lienAap:lienAap,
                    motsCles:motsCles
              },
               function(data) {
               $.sticky("L'objet a été enregistré", {autoclose: 5000, position: "top-center"});      
              }
            );
}

function disablestep1(){
    
}