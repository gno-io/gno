Meteor.startup () ->
    Meteor.subscribe 'userView'
    
    emptyCollections = {}
    for c in Gno.collections
        emptyCollections[c] = []
    
    Session.set 'handles', emptyCollections
	Session.set 'items', emptyCollections
	
	Deps.autorun () ->
		Meteor.subscribe 'handleData', Session.get 'handles'
	Deps.autorun () ->
		Meteor.subscribe 'itemData', Session.get 'items'
	Deps.autorun () ->
		Meteor.subscribe 'indexData',
				user: Meteor.userId()
		
		