class ProfilesController < ApplicationController
  before_action :authenticate_user!
  
  def show
    @user = current_user
    @reading_records = @user.reading_records.order(finished_on: :desc)
  end
end
