class ChatroomsController < ApplicationController
  def index
    @chatrooms = Chatroom.where(sender_id: current_user).or(Chatroom.where(receiver_id: current_user)).order(:updated_at).reverse
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end
end
