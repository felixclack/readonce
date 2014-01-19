class MessagesController < ApplicationController
  before_action :authenticate_user!
  
  respond_to :html
  
  def index
  end
  
  def new
  end
  
  def create
    @message = current_user.messages.create(message_params)
    respond_with message, location: messages_url
  end
  
  private
  
  def message_params
    params[:message].permit :body
  end
  
  def message
    @message ||= Message.new
  end
  helper_method :message
  
  def messages
    @messages ||= current_user.messages
  end
  helper_method :messages
end
