class SettingsController < ApplicationController
  def edit
    @setting = current_admin.setting

    if @setting == nil
      @setting = current_admin.create_setting(auto_text: "Please enter text here")

    elsif @setting == current_admin.setting
      # binding.pry
      @setting = Setting.update(
        auto_text: params[:auto_text]
        ).first
      
        
    else
      flash[:error] = "ERROR: We could not update the settings."
    end
  end

  def update
    # binding.pry
    @setting = current_admin.setting
    if @setting.update(
      auto_text: params[:auto_text]
      )
      flash[:success] = "Settings saved!"
      redirect_to '/'
    else
      flash[:error] = "ERROR: We could not update the settings."
      render :next
    end
  end
end
