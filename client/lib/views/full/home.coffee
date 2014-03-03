Template.home.helpers
    columns: ->
        r = {}
        if Meteor.user() && Meteor.user().view
            for collection, id of Meteor.user().view
                r[collection] = Gno[collection].index.findOne id
        return r