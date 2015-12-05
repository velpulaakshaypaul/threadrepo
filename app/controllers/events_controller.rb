class EventsController < ApplicationController
  def new
    @event = Event.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @event = Event.new(event_params)

    if @event.save
      render json: {msg: 'your event was saved.'}
    else
      render json: {msg: 'error: something go wrong.' }, status: 500
    end
  end

  def index
    @events = Event.between(params['start'], params['end']) if (params['start'] && params['end'])

    respond_to do |format|
      format.html
      format.json { render :json => @events }
    end
  end

  def event_params
    params.permit(:title).merge start_at: params[:start].to_time, end_at: params[:end].to_time, user_name: params[:user_name]
  end
end
