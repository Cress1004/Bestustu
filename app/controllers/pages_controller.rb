class PagesController < ApplicationController
    def home
            
    end
    def signin

    end
    def signup

    end
    def show
        @user = User.find(params[:id])
    end
end