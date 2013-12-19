# http://emberjs.com/guides/models/using-the-store/

DS.RESTAdapter.map "App.Timeline",
  asset:
    embedded: "always"

DS.RESTAdapter.map "App.Post",
  asset:
    embedded: "always"


App.Store = DS.Store.extend
  revision: 11
  adapter: DS.RESTAdapter.extend
            buildURL: (record, suffix) ->
               @_super(record, suffix) + ".json"
