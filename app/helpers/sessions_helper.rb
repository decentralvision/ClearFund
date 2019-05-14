# frozen_string_literal: true

module SessionsHelper
    def logged_in?
        !!session[:user_id]
    end

    def current_user
        logged_in? ? User.find(session[:user_id]) : nil
    end

    def authenticate_user
        if current_user
            byebug
            current_user.id == params[:id].to_i
        else
           redirect_to root_path
        end
    end
end
