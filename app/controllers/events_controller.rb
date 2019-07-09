class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      flash[:success] = "Sub requested!"
      redirect_to subrequests_path
    else
      @event_items = []
      render 'static_pages/sub_requests'
    end
  end

  private

    def event_params
      params.require(:event).permit(:date, :shift, :message)
    end

end
