
#= require jquery
#= require jquery_ujs
#= require turbolinks
#= require_tree .

#= require batman/es5-shim

#= require batman/batman
#= require batman/batman.rails

#= require batman/batman.jquery

#= require_self

#= require_tree ./batman/lib
#= require_tree ./batman/controllers
#= require_tree ./batman/models
#= require_tree ./batman/views

Batman.config.pathToHTML = '/assets/html'

class Mipango extends Batman.App

  @resources 'plans', ->
    @resources( 'plots')

  # @resources 'products'
  # @resources 'discounts', except: ['edit']
  # @resources 'customers', only: ['new', 'show']

  # @resources 'blogs', ->
  #   @resources 'articles'

  # @resources 'pages', ->
  #   @collection 'count'
  #   @member 'duplicate'

  # @route 'apps', 'apps#index'
  # @route 'apps/private', 'apps#private', as: 'privateApps'

  @root 'plans#index'

(global ? window).Mipango = Mipango
