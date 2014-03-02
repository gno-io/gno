###

Each pair of collections here represents a column that the user can see and
organize.

###

@Gno = 
    collections: ['people','styles','templates','compositions','findings','feeds']
    
    people:
        index: new Meteor.Collection 'personIndex'
        items: new Meteor.Collection 'person'
    styles:
        index: new Meteor.Collection 'styleIndex'
        items: new Meteor.Collection 'style'
    templates:
        index: new Meteor.Collection 'templateIndex'
        items: new Meteor.Collection 'template'
    compositions:    
        index: new Meteor.Collection 'compositionIndex'
        items: new Meteor.Collection 'composition'
    findings:
        index: new Meteor.Collection 'findingIndex'
        items: new Meteor.Collection 'finding'
    feeds:
        index: new Meteor.Collection 'feedIndex'
        items: new Meteor.Collection 'feed'    
    
    # 'please' takes: 
    #   - a string of a function name f,
    #   - an object,
    #   - and a spec object
    # 
    # An example call:
    #   Gno.please 'find', _id: '234udhj234SD', 
    #       for: 'items'  # can also be 'index'
    #       in: 'feeds'   # or any other collection
    #
    # One unreadable function for the greater readability of all.
    please: (f, obj, spec) ->
        Gno[spec['in']][spec['for']][f](obj)
        
    
    
    