class EventsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      flash[:success] = "Sub request posted!"
      redirect_to subrequests_path
    else
      @event_items = []
      redirect_to subrequests_path
    end
  end

  def destroy
    @event.destroy
    flash[:success] = "Sub request deleted"
    redirect_to request.referrer || subrequests_path
  end

  private

    def event_params
      params.require(:event).permit(:date, :shift, :message)
    end

    def correct_user
      @event = current_user.events.find_by(id: params[:id])
      redirect_to subrequests_path if @event.nil?
    end

end
