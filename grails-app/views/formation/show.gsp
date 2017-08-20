
<%@ page import="com.rabbahsoft.mnc.Formation" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'formation.label', default: 'Formation')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-formation" class="first">

	<table class="table table-striped table-bordered table-condensed">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="formation.acronymeFormation.label" default="Acronyme Formation" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: formationInstance, field: "acronymeFormation")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="formation.nomformation.label" default="Nomformation" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: formationInstance, field: "nomformation")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="formation.dateCreationFormation.label" default="Date Creation Formation" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${formationInstance?.dateCreationFormation}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="formation.etablissementFormation.label" default="Etablissement Formation" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: formationInstance, field: "etablissementFormation")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="formation.statutAdhesion.label" default="Statut Adhesion" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: formationInstance, field: "statutAdhesion")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="formation.accredidationEtat.label" default="Accredidation Etat" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: formationInstance, field: "accredidationEtat")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="formation.entite.label" default="Entite" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: formationInstance, field: "entite")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="formation.nomContact.label" default="Nom Contact" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: formationInstance, field: "nomContact")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="formation.telephone.label" default="Telephone" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: formationInstance, field: "telephone")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="formation.email.label" default="Email" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: formationInstance, field: "email")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="formation.descriptionFormation.label" default="Description Formation" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: formationInstance, field: "descriptionFormation")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="formation.diplome.label" default="Diplome" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: formationInstance, field: "diplome")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="formation.etatArt.label" default="Etat Art" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: formationInstance, field: "etatArt")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="formation.programmeFormation.label" default="Programme Formation" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: formationInstance, field: "programmeFormation")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="formation.stages.label" default="Stages" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: formationInstance, field: "stages")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="formation.reseaux.label" default="Reseaux" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: formationInstance, field: "reseaux")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="formation.interactionFormationEntreprise.label" default="Interaction Formation Entreprise" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: formationInstance, field: "interactionFormationEntreprise")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="formation.interactionActiviteEntreprise.label" default="Interaction Activite Entreprise" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: formationInstance, field: "interactionActiviteEntreprise")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="formation.comitesThematiques.label" default="Comites Thematiques" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${formationInstance.comitesThematiques}" var="c">
						<li><g:link controller="profil" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="formation.grillesAnalyse.label" default="Grilles Analyse" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${formationInstance.grillesAnalyse}" var="g">
						<li><g:link controller="grilleAnalyse" action="show" id="${g.id}">${g?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="formation.porteurProjet.label" default="Porteur Projet" /></td>
				
				<td valign="top" class="value"><g:link controller="utilisateur" action="show" id="${formationInstance?.porteurProjet?.id}">${formationInstance?.porteurProjet?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
