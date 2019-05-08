# frozen_string_literal: true

class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.find_by(name: params['user']['name']).try(:authenticate, params['user']['password'])
    if user
      session[:user_id] = user.id
      redirect_to '/'
    else
      flash[:alert] = 'Invalid Login Information'
      redirect_to '/login'
    end
  end

  def destroy
    session.clear
    redirect_to '/'
  end
end
