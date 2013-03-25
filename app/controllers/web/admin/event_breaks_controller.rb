class Web::Admin::EventBreaksController < Web::Admin::ApplicationController
  
  def new
    @break = Event::Break.new
  end

  def create
    @break = Event::Break.new params[:event_break]
    @break.changed_by = current_user
    if @break.save
      @break.move_to_schedule
      flash_success
      redirect_to admin_events_path
    else
      flash_error
      render :new
    end

  end

  def edit
    @break = Event::Break.find params[:id]
  end

  def update
    @break = Event::Break.find params[:id]
    @break.changed_by = current_user
    if @break.update_attributes params[:event_break]
      flash_success
      redirect_to admin_events_path
    else
      flash_error
      render :edit
    end
  end

  def destroy
    @break = Event::Break.find params[:id]
    @break.destroy
    redirect_to admin_events_path
  end
end
