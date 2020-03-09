class ChatroomsController < ApplicationController
  def index
    # if params[:query].present?
    #   @chatrooms = Chatroom.where("sender_id ILIKE ?", "%#{User.find_by_username(params[:query]).id}%")
    # else
      @chatrooms = Chatroom.where(sender_id: current_user).or(Chatroom.where(receiver_id: current_user)).order(:updated_at).reverse
    # end

    @chatroom = Chatroom.where(sender_id: current_user).or(Chatroom.where(receiver_id: current_user)).last
    @message = Message.new
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end
end
