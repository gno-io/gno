# iterThroughCollections()
#
# Helper function for publications below to abstract out common pattern.
#
# Takes an obj of format:
#	composition: [ ids ]
#	finding: [ ids ]
#	person: [ ids ]
#	...
# and a params object to modify the find performed on each collection.
# collects the result of calling f on that function in a new object
iterThroughCollections = (obj, params) ->
    r = {}
    for collection, arr of obj
        if arr.length > 0
            r[collection] = Gno[collection].items.find({_id: $in: arr}, params)
        else
            r[collection] = Gno[collection].items.find _id:0
    return r
    
# See helper function above for format of param 'obj'.
#
# Publishes the complete items, content included.
Meteor.publish 'itemData', (items) ->
    iterThroughCollections items, {}

# See iterThroughCollections() above for format of param 'obj'.
#
# Publishes items without their content data (only title, author, brief)
Meteor.publish 'handleData', (handles) ->
    iterThroughCollections handles, fields: content: 0

Meteor.publish 'indexData', (userId) ->
    r = {}
    console.log userId
    for c in Gno.collections
        r[c] = Gno[c].index.find user: userId
        console.log c
    return r   