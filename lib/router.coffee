Router.configure
    layoutTemplate: 'layout'

Router.map ->
    this.route 'home',
        path: '/'
    this.route 'intro',
        path: '/intro'