class MessagesController < ApplicationController
  def index
    room = Room.find(params[:room_id])
    messages = room.messages.limit(20)

    render json: messages, status: :ok
  end

  def create
    room = Room.find(params[:room_id])
    message = room.messages.build(message_params)
    if message.save
      render json: message, status: :created
    else
      render json: { errors: message.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :sender_name)
  end
end
