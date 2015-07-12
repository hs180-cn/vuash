class MessagesController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def new
    @message = Message.new
  end

  def create
    @message = Message.create(message_params)
    render :new unless @message.save
  end

  def show
    @message = Message.find_by(secret: params[:secret])
    render :not_found unless @message
  end

  def update
    @message = Message.find_by(secret: params[:secret])
    @message.destroy

  end

  private
  def message_params
    params.permit(:body)
  end
end
