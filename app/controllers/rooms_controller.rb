class RoomsController < ApplicationController

  def index
    rooms = Room.all
    render json: rooms, status: :ok
  end

  def create
    room = Room.new(rooms_params)
    if room.save
      head :created
    else
      render json: { errors: room.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def room_params
    params.require(:rooms).permit(:name)
  end
end
