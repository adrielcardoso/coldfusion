<cfoutput>
	<div class="container">

	  <div class="row">

	      <div class="col s12">
	      		<div class='row'>
		        	<h4>Usuário</h4>
		        	Nome: #data.user.getName()#<br>
		        	Usuário: #data.user.getUsername()#<br>
		        	Tipo: #data.user.getType()#<br>
		        	Aniversário: #data.user.getBirthdate()#<br>
		        	<h4>Perfis</h4>
		        	<cfset profile = data.user.getProfile() > 
		        	<cfloop array="#profile#" index="i">
					    <div class="chip">
						    #i.getName()# <i class="material-icons">close</i>
						</div>
		        	</cfloop>
		        	<br><br>
				    <a href="?bundle=user&amp;event=user&amp;action=update&amp;id=5" class="btn-floating btn-large red"><i class="large material-icons">mode_edit</i></a>
	      		</div>
	      </div>
	  </div>
	</div>
</cfoutput>