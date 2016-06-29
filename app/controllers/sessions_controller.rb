class SessionsController < ApplicationController
  def create
    user_id = User.find(params[:user]).id
    cookies.signed[:user_id] = {
      value: user_id,
      expires: 1.day.from_now
    }
    redirect_to :back
  end

  def destroy
    cookies.signed[:user_id] = nil
    redirect_to :back
  end
end
