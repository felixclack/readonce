class MessagesController < 
  def create
    Message.create message_params
    redirect_to root_url
  end
  
  private
  
  def message_params
    params[:message].permit :body
  end
end
