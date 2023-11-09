class HomeController < ApplicationController
  def index

  end

  def events
    @events = Event.all
  end

  def new_events
    event = Event.new(event_params)

    event.save
  end

  def event_params
    params[:event].permit(:title, :description, :week_date, :hour, :team)
  end
end
