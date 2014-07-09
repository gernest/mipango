class Mipango.Plot extends Batman.Model
  @resourceName: 'plots'
  @storageKey: 'plots'

  @persist Batman.RailsStorage

  # Use @encode to tell batman.js which properties Rails will send back with its JSON.
  # @encode 'name'
  @encodeTimestamps()

