class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      flash[:success] = "Sub requested!"
      redirect_to subrequests_path
    else
      @event_items = []
      redirect_to subrequests_path
    end
  end

  def destroy
  end

  private

    def event_params
      params.require(:event).permit(:date, :shift, :message)
    end

end
