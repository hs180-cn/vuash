class MessagesController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def new
    @message = Message.new
  end

  def create
    @message = Message.create(message_params)
  end

  def confirm
    @message = Message.find(params[:id])
  end

  def show
    @message = Message.destroy(params[:id])
  end

  private
  def message_params
    params.require(:message).permit(:data)
  end
end
