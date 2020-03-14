class PagesController < ApplicationController
    def home

    end

    def bpoint_page
      
    end

    def show
        @user = User.find(params[:id])
    end
end
