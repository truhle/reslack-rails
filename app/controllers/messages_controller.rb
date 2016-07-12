class MessagesController < ApplicationController
  include ::ActionController::Serialization
  
  
  before_action :set_message, only: [:show, :update, :destroy]

  # GET /messages
  def index
    @messages = Message.all

    render json: @messages
  end

  # GET /messages/1
  def show
    render json: @message
  end

  # POST /messages
  def create
    @message = Message.new(message_params)

    if @message.save
      serializer = ActiveModel::Serializer.serializer_for(@message)
      serializer_instance = serializer.new(@messsage, new_message: true)
      
      # Workaround for a bug giving a nil object on the first call to 
      # serializer.new(@message)
      if serializer_instance.object == nil
        serializer_instance = serializer.new(@message, new_message: true)
      end
      
      message = serializer_instance.to_json
      ActionCable.server.broadcast('messages', message)
      render json: :ok
    else
      render json: @message.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /messages/1
  def update
    if @message.update(message_params)
      render json: @message
    else
      render json: @message.errors, status: :unprocessable_entity
    end
  end

  # DELETE /messages/1
  def destroy
    @message.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def message_params
      params.require(:message).permit(:beginning, :content, :sender, :timestamp, :user_id, :channel_id, :group_id)
    end
end
