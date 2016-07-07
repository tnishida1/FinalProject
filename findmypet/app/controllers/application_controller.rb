class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :append!

  def append!

    if Owner.where(user_id: current_user) == nil
      redirect_to new_owner_path
    end

  end

end
