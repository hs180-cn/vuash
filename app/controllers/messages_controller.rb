class MessagesController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    @message.encrypt_body(params[:secret])

    if @message.save
      render :created
    else
      render :new
    end
  end

  def confirm
    @message = Message.find(params[:id])
  end

  def show
    @message = Message.find(params[:id])
    @message.decrypt_body(params[:secret])
    @message.destroy
  end

  private
  def message_params
    params.require(:message).permit(:body)
  end
end
