class MessagesController < ApplicationController

  def show
    @message = Message.find(params[:id])
  end

  def destroy
    @message = Message.find(params[:id])
    require_same_user
    @message.destroy
    redirect_to show_user_info_path(current_user.id)
  end

  private

    def require_same_user
      if current_user != @message.user
          redirect_to root_path
      end
    end

end
