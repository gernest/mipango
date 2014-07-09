class Mipango.Plan extends Batman.Model
  @resourceName: 'plans'
  @storageKey: 'plans'

  @persist Batman.RailsStorage

  # Use @encode to tell batman.js which properties Rails will send back with its JSON.
  # @encode 'name'
  @hasMany 'plots'
  @encode 'title','user_id'
  @encodeTimestamps()

