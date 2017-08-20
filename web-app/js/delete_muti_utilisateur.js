$(document).ready(function() 
{  
    $('a.projet').click(function()
    {
         if (confirm('Etes vous sur de vouloir supprimer ce projet?')) 
                    {
                        var context11=$("#context1").val()+"/LabelisationProjet/delete_projet";
                       
         var url1=context11;
         var id1=$(this).attr("id");
    var data1={id:id1};
         $.ajax({
        type: 'POST',
        url: url1,
        data: data1,
        success: function(result) {
      location.reload();
        },
        dataType: "text",
        async: false
    });    
    }
        
    });
    
//$("input[type='checkbox']").click(function()
//{
//        var state;
//       if (this.checked) {
//        state="checked";
//        }
//        else {
//        state="unchecked";
//
//        }
//       $.post("/MiniErpMnc/Utilisateur/testcheck",
//            {
//              value:this.id,
//              state:state
//            },
//             function(data) {
//            // alert(data); 
//            }
//          );
//  });
  $("#supprimermultiutilisateur").click(function()
{
    var context11=$("#context1").val();
    var url=context11+"/Utilisateur/supprimermultiutilisateur1";
    var data=null;
    var got=false;
        $.ajax({
        type: 'POST',
        url: url,
        data: data,
        success: function(result) {
           
            if (result === "false") {
                got = false;
            }
            else
                {
                    if (confirm('Etes vous sur de vouloir supprimer des utilisateurs deja attacher à d\'autre projet ?')) 
                    {
         var url1=context11+"/Utilisateur/test1";
    var data1=null;
         $.ajax({
        type: 'POST',
        url: url1,
        data: data1,
        success: function(result) {
      location.reload();
        },
        dataType: "text",
        async: false
    });    
    }
    else
        {
                 var url1=context11+"/Utilisateur/test1";
    var data1=null;
         $.ajax({
        type: 'POST',
        url: url1,
        data: data1,
        success: function(result) {
      location.reload();
        },
        dataType: "text",
        async: false
    });    
            
        }
    
                   got = true; 
                }
        },
        dataType: "text",
        async: false
    });
    
  });
 
  
 });
 
 