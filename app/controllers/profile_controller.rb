class ProfileController < ApplicationController
  before_action :set_profile, only: %i[index]
  def index; end

  private

  def set_profile
    @account = Account.find_by(username: params[:username])
  end
end
