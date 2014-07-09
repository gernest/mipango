class Mipango.PlansController extends Mipango.ApplicationController
  routingKey: 'plans'

  index: (params) ->
    @set('plans', Mipango.Plan.get('all'))

  show: (params) ->
    Mipango.Plan.find params.id, @errorHandler (plan) =>
      @set('plan', plan)

  edit: (params) ->

  new: (params) ->

  create: (params) ->

  update: (params) ->

  destroy: (params) ->

