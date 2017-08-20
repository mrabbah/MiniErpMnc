class UrlMappings {

	static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(controller: "securite")
//        "/accueil"(view:"/index")
//        "/calendrier"(view:"/calendar")
//        "/documentation"(view:"/documentation")
//        "/map"(view:"/map")
        "500"(view:'/error')
	}
}
