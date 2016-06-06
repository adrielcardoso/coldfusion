<cfoutput>
	<div class="container">

	  <div class="row">

	      <div class="col s12">
	      		<div class='row'>
		        	<h4>Nomes</h4>
				    <div class="collection">
				        <cfloop from="1" to="#arrayLen(data.data)#" index="i">
				        	<a href="?bundle=user&amp;event=user&amp;action=details&amp;id=#data.data[i].getId()#" class="collection-item">#data.data[i].getName()# - #data.data[i].getId()#</li>
				    	</cfloop>
				    </div>
	      		</div>
	      		<ul class="pagination">
			    <!--- class="disabled" ---><li><a href="?bundle=user&amp;event=user&amp;#data.pagination.pageLink(data.pages.prev)#"><i class="material-icons">chevron_left</i></a></li>
			    <cfloop from="#data.pages.numbers.start#" to="#data.pages.numbers.end#" index="i">
			    	<cfset class = data.pagination.getCurrentPage() IS i ? 'active' :'waves-effect' >
			    	<li class="#class#"><a href="?bundle=user&amp;event=user&amp;#data.pagination.pageLink(i)#">#i#</a></li>
			    </cfloop>
			    <li class="waves-effect"><a href="?bundle=user&amp;event=user&amp;#data.pagination.pageLink(data.pages.next)#"><i class="material-icons">chevron_right</i></a></li>
			  </ul>

	      </div>
	  </div>
	</div>
</cfoutput>