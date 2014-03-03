
Meteor.publish 'userView', () ->
    Meteor.users.find this.userId,
        fields:
            'view': 1

Accounts.onCreateUser (opts, user) ->
    console.log 'creating user ' + user._id
    
    sId = Gno.style.index.insert
        title: 'Styles'
        handles: []
        indexes: []
        user: user._id
	
    template = Gno.template.items.find
        title: 'Writing'
    .fetch()[0]._id
	
    tId = Gno.template.index.insert
        title: 'Templates'
        handles: [ template ]
        indexes: []
        user: user._id
	
    page = Gno.composition.items.insert
        title: 'Blank Page'
        brief: 'A fresh page, our treat.'
        content:
            struct: template
            user: user._id

    cId = Gno.composition.index.insert
        title: 'Compositions'
        handles: [ page ]
        indexes: [ ]
        user: user._id
		
    note = Gno.note.items.insert
        title: 'A Note'
        brief: 'Probably not the most useful note.'
        user: user._id
	    
    nId = Gno.note.index.insert
        title: 'Notes'
        handles: [ note ]
        indexes: [ ]
        user: user._id
	
    cId = Gno.composition.index.insert
        title: 'Compositions'
        handles: [ page ]
        indexes: [ ]
        user: user._id
		
    findingsId = Gno.finding.index.insert
        title: 'Findings'
        handles: []			
        indexes: []
        user: user._id
		
    fIds = Gno.feed.items.insert [
            title: 'Gno'
            brief: 'Updates and tutorials from Gno'
            content:
                source: 'gno'
        ,
            title: 'Pocket'
            brief: 'Content you\'ve pocketed'
            content:
                source: 'pocket'
        ,
            title: 'History'
            brief: 'Content you\'ve already opened'		
            content:
                source: 'history'
    ]
    fId = Gno.feed.index.insert
        title: 'Feeds'
        handles: fIds
        indexes: []
        user: user._id
	
    user.view = 
        style: sId
        template: tId
        composition: cId
        note: nId
        finding: findingsId
        feed: fId

    return user