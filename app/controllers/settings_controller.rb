class SettingsController < ApplicationController
  before_action :set_setting
  def edit
    if @setting == nil
      @setting = current_admin.create_setting(auto_text: "Please enter text here")
    end
  end

  def update
    if Setting.update(
        auto_text: params[:auto_text]
        ).first
      flash[:success] = "Settings saved!"
      redirect_to '/'
        
    else
      flash[:error] = "ERROR: We could not update the settings."
      redirect_to :edit
    end
  end

private

  def set_setting 
    @setting = current_admin.setting
  end


end
