# iterThroughCollections()
#
# Helper function for publications below to abstract out common pattern.
#
# Takes an object of format:
#	compositions: [ ids ]
#	findings: [ ids ]
#	people: [ ids ]
#	...
# and for every collection, it applies param f to 

Iterates over every collection and 
# collects the result of calling f on that function in a new object
iterThroughCollections = (f, obj) ->
    


# and publishes the objects with those ids from those collections.
Meteor.publish 'itemData', (items) ->
	r = {}
	for collection, arr of items
		if arr.length > 0
			r[collection] = Gno.please 'find', _id: $in: arr,
			    for: 'items'
			    in: collection
			
		else
			r[collection] = Gno.please 'find', _id:0, 
			    for: 'items' # return empty cursor
			    in: collection

# Takes object of the same format as the above publication, but excludes the 
# actual content.
Meteor.publish 'handleData', (handles) ->
	r = {}
	for collection, arr of handles
		if arr.length > 0
			r[collection] = Gno.please 'find', { _id: $in: arr, fields: content: 0 },
			    for: 'items'
			    in: collection
			
		else
			r[collection] = Gno.please 'find', _id:0, 
			    for: 'items' # return empty cursor
			    in: collection

			
Meteor.publish 'indexData', (userId) ->
    r = {}
    for c in Gno.collections
        r[c] = Gno.please 'find', user: userId,
            for: 'index'
            in: c
	   
		
	