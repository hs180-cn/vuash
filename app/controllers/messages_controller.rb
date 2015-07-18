class MessagesController < ApplicationController
  def new
    @message = Message.new
  end

  def create
    @message = Message.create(message_params)
  end

  def show
    @message = Message.find(params[:id])
  end

  def destroy
    @message = Message.destroy(params[:id])
  end

  private
  def message_params
    params.require(:message).permit(:data)
  end
end
