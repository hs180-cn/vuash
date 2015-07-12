class MessagesController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def new
    @message = Message.new
  end

  def create
    @message = Message.create(message_params)
    @message.encrypt_body(params[:secret])

    if @message.save
      redirect_to [@message, secret: params[:secret]]
    else
      render :new
    end
  end

  def show
    @message = Message.find(params[:id])
  end

  def edit
    @message = Message.find(params[:id])
  end

  def update
    @message = Message.find(params[:id])
    @message.decrypt_body(params[:secret])
    @message.destroy
  end

  private
  def message_params
    params.require(:message).permit(:body)
  end
end
