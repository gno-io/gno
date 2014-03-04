###

Each collection has items, index (which contains an organization of those
items that the user can customize), and actions, which keeps track of which
items are used most often, which were used most recently, etc.

Items that have been published are stored in a separate database.

###
class GnoCore
    
    constructor: () ->
        this.collections = ['person','style','template','composition','note','finding','feed']
        for c in this.collections
            this[c] = {}
            this[c].items = new Meteor.Collection(c)
            this[c].index = new Meteor.Collection(c+'Index')
            this[c].actions = new Meteor.Collection(c+'Actions')
            this[c].publications = new Meteor.Collection(c+'Publications')
    
    # please()
    #
    # One polite function for greater readability elsewhere.
    #
    # 'please' takes: 
    #   - a string of a function named f,
    #   - an object,
    #   - and a spec object, which provides details about how that function 
    #       should be used
    # 
    # An example call:
    #   Gno.please 'find', _id: '234udhj234SD', 
    #       for: 'items'  # can also be 'index'
    #       of: 'feed'    # can also be any other collection
    #
    # This would be equivalent to Gno.feed.items.find({_id:'234udhj234SD'})
    please: (f, obj, spec) ->
        Gno[spec.of][spec.for][f](obj)
    
@Gno = new GnoCore()
    