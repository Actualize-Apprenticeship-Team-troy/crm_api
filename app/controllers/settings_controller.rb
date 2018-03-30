class SettingsController < ApplicationController
  # def create
  # end

  def blah
    binding.pry
    @setting = current_admin
  end

  def delete
  end

  def update
  end
end
