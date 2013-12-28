App.DietsNewRoute = Ember.Route.extend(Ember.SimpleAuth.AuthenticatedRouteMixin,
  model: ->
    @get('store').transaction().createRecord(App.Diet, {})

  actions:
    save: ->
      @currentModel.transaction.commit()
      @transitionToAnimated 'diets.index', main: 'flip'
)





#App.EditRoute = Em.Route.extend
#    setupController: (controller, model) ->
#      this.set 'transaction', this.get('store').transaction()
#      this.get('transaction').add model
#    deactivate: ->
#      # if the transaction has already been committed or rolled back, this
#      # will have no effect
#      this.get('transaction').rollback()
#    events:
#      save: ->
#        # I prefer to keep the user on the edit view until the
#        # commit is complete, so that if an error occurs I can display
#        # it in the edit form
#        this.get('currentModel').on 'didUpdate', this, -> this.send('exit')
#        this.get('transaction').commit()
#      cancel: ->
#        # because rolling back is synchronous, trigger `exit` immediately
#        this.get('transaction').rollback()
#        this.send('exit')
#      exit: ->
#        this.transitionTo 'list'