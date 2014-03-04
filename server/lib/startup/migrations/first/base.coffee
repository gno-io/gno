
Meteor.startup () ->
	# Migrations.add 'composition-1', () ->
    if Gno.template.items.find(title:'Writing').count() == 0
        wId = Gno.template.items.insert
            title: 'Writing'
            brief: 'Everything written here will be processed with Markdown.'
            user:0 # signifies Gno
            content:
                structure: 
                    md: 'Content' # md stands for markdown	
        tId = Gno.template.items.insert
            title: 'Plaintext'
            brief: 'For short lines of text.'
            user:0 # signifies Gno
            content:
                structure: 
                    text: 'Text'
###
		sId = Gno.template.items.insert
		    title: 'List'
		    brief: 'For creating a list of a certain kind of template.'
		    user:0
		    content:
		        structure:
		            list: 'Template'
###
		            
		
	