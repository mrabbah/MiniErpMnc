
/**
 *
 * @author RABBAH
 */
class SecuriteFilters {
    def filters = {
        loginCheck(controller: '*', action: '*', controllerExclude  : 'securite|mobile') {
            before = {
                if (!session.user) {
                    if(!(controllerName=='inscription' && (actionName=='index' || actionName==null || actionName=='inscrir')))
//                    if(!(controllerName=='inscription' && (actionName=='index' || actionName==null || actionName=='inscrir')) && !(controllerName=='labelisationProjet' && (actionName=='downloadLettreConfidentialitebp' || actionName=='downloadfichetechniquepresentationdetaille' || actionName=='downloadLettreConfidentialite1bp' || actionName=='downloadgrilleanalyse')))
                         {
                             
                        def g = new org.codehaus.groovy.grails.plugins.web.taglib.ApplicationTagLib()
                    def confirmurl= g.createLink(controller: controllerName, action: actionName, params:params,  absolute: 'true' )
                    session.lastURL=request.getHeader('referer') ?: confirmurl
                        
                        if(session.lastURL!=null)
                        {
                           redirect(controller:"securite",action:"index")
                             return false 
                        }
                        else
                        {
                           redirect(controller:"securite",action:"index")
                             return false 
                        }
                        
                             
                         }
                        
                    
                    
                }
//                else
//                {
//                    println("ok")
//                }
            }
        }
    }
}

