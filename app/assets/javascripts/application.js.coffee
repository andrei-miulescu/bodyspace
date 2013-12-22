#= require jquery
#= require jquery_ujs
#= require underscore
#= require jquery.cookie
#= require bootstrap
#= require timelineJS/embed
#= require dropzone/dropzone
#= require datepicker/datepicker
#= require elastislide/jquery.elastislide
#= require ladda/ladda
#= require handlebars
#= require ember
#= require ember-data
#= require ember-simple-auth
#= require_self
#= require bodyspace
#= require_tree .

# for more details see: http://emberjs.com/guides/application/
window.App = Ember.Application.create(
    LOG_TRANSITIONS: true,
    LOG_ACTIVE_GENERATION: true
)
