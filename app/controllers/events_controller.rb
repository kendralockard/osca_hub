class EventsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def create
    @event = current_user.events.build(event_params)
    set_coop_id
    if @event.save
      flash[:success] = "Sub request posted!"
    end
    redirect_to subrequests_path
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
    UserMailer.push_event(@user, @event).deliver_now
    flash[:success] = "Your sub request has been pushed to \
                      #{Coop.find(@user.coop_id).name}."
    redirect_to root_url
  end

  private

    def set_coop_id
      @event.coop_id = current_user.coop_id
    end

    def event_params
      params.require(:event).permit(:date, :meal, :shift, :message)
    end

    def correct_user
      @event = current_user.events.find_by(id: params[:id])
      redirect_to subrequests_path if @event.nil?
    end

end
