class EventsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def create
    @event = current_user.events.build(event_params)
    @event.coop_id = current_user.coop_id
    if @event.save
      flash[:success] = "Sub request posted!"
      redirect_to subrequests_path
    else
      @event_items = []
      redirect_to subrequests_path
    end
  end

  def destroy
    @event = Event.find(params[:event_id])
    @event.destroy
    flash[:success] = "Sub request deleted"
    redirect_to subrequests_path
  end

  def push_event
    @event = Event.find(params[:id])
    @user = @event.user
    UserMailer.push_subrequest(@user, @event).deliver_now
    flash[:success] = "Your sub request has been pushed to #{Coop.coops[@user.coop_id]}."
    redirect_to root_url
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
