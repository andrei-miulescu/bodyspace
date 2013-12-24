#= require jquery
#= require jquery_ujs
#= require underscore
#= require jquery.cookie
#= require bootstrap
#= require ladda/spin
#= require ladda/ladda
#= require timelineJS/embed
#= require dropzone/dropzone
#= require datepicker/datepicker
#= require handlebars
#= require ember
#= require ember-data
#= require ember-simple-auth
#= require ember-animated-outlet
#= require moment
#= require_self
#= require bodyspace
#= require_tree .

# for more details see: http://emberjs.com/guides/application/
window.App = Ember.Application.create(
    LOG_TRANSITIONS: true,
    LOG_ACTIVE_GENERATION: true
)
