class ApplicationController < ActionController::API
  include Knock::Authenticable

  def authenticate_admin
    unless current_user && current_user.authenticate_admin
      render json: {}
    end
  end
end