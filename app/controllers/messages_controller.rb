class MessagesController < ApplicationController
  protect_from_forgery except: :create

  def new
    @message = Message.new
  end

  def create
    @message = Message.create(message_params)
  end

  def show
    @message = Message.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render 'missing'
  end

  def destroy
    @message = Message.destroy(params[:id])
  end

  private
  def message_params
    params.require(:message).permit(:data)
  end
end
