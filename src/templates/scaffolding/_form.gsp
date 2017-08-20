<%=packageName%>
<% import grails.persistence.Event %>

<%  excludedProps = Event.allEvents.toList() << 'version' << 'dateCreated' << 'lastUpdated'
	persistentPropNames = domainClass.persistentProperties*.name
	boolean hasHibernate = pluginManager?.hasGrailsPlugin('hibernate') || pluginManager?.hasGrailsPlugin('hibernate4')
	if (hasHibernate) {
		def GrailsDomainBinder = getClass().classLoader.loadClass('org.codehaus.groovy.grails.orm.hibernate.cfg.GrailsDomainBinder')
		if (GrailsDomainBinder.newInstance().getMapping(domainClass)?.identity?.generator == 'assigned') {
			persistentPropNames << domainClass.identifier.name
		}
	}
	props = domainClass.properties.findAll { persistentPropNames.contains(it.name) && !excludedProps.contains(it.name) && (domainClass.constrainedProperties[it.name] ? domainClass.constrainedProperties[it.name].display : true) }
	Collections.sort(props,comparator.constructors[0].newInstance([domainClass] as Object[]))
        Integer i=0
        Integer l=0
        for (p in props) {
          l++
        }
	for (p in props) {
          
		if (p.embedded) {
			def embeddedPropNames = p.component.persistentProperties*.name
			def embeddedProps = p.component.properties.findAll { embeddedPropNames.contains(it.name) && !excludedProps.contains(it.name) }
			Collections.sort(embeddedProps, comparator.constructors[0].newInstance([p.component] as Object[]))
			%><fieldset class="embedded"><legend><g:message code="${domainClass.propertyName}.${p.name}.label" default="${p.naturalName}" /></legend><%
				for (ep in p.component.properties) {
				renderFieldForProperty(ep, p.component, "${p.name}.",l)
				}
			%></fieldset><%
		} else {
			        renderFieldForProperty(p,domainClass,i,l)
		}
                i++
	}

        private renderFieldForProperty(p, owningClass, prefix = "",Integer i,l) {
	boolean hasHibernate = pluginManager?.hasGrailsPlugin('hibernate') || pluginManager?.hasGrailsPlugin('hibernate4')
	boolean required = false
	if (hasHibernate) {
		cp = owningClass.constrainedProperties[p.name]
		required = (cp ? !(cp.propertyType in [boolean, Boolean]) && !cp.nullable && (cp.propertyType != String || !cp.blank) : false)
	} %>
                       
                         <% if(i%2==0){ %>
                         <table class="widthtable">
                         <tr>
                        <div class="\${hasErrors(bean: ${propertyName}, field: '${prefix}${p.name}', 'error')} ${required ? 'required' : ''}">
                        <td width="250"><label for="${prefix}${p.name}" class="control-label"><g:message code="${domainClass.propertyName}.${prefix}${p.name}.label" default="${p.naturalName}" /><% if (required) { %><span class="required-indicator">* :</span><% } %></label></td>
			<div>
                        <td>${renderEditor(p)}</td>
			<span class="help-inline">\${hasErrors(bean: ${propertyName}, field: '${p.name}', 'error')}</span>			
                        </div>
			</div>
                        <%  } %>
                        <% if(i%2==1){ %>
                        <div class="\${hasErrors(bean: ${propertyName}, field: '${prefix}${p.name}', 'error')} ${required ? 'required' : ''}">
                        <td width="250"><label for="${prefix}${p.name}" class="control-label"><g:message code="${domainClass.propertyName}.${prefix}${p.name}.label" default="${p.naturalName}" /><% if (required) { %><span class="required-indicator">* :</span><% } %></label></td>
			<div>
                        <td>${renderEditor(p)}</td>
			<span class="help-inline">\${hasErrors(bean: ${propertyName}, field: '${p.name}', 'error')}</span>			
                        </div>
			</div>
                        </tr>
                        </table>
                        <%  } %>
                        <% if(i==l-1 && i%2==0){ %>
                        </tr>
                        </table>
                         <%  } %>                         
<% } %>
