class Api::V1::MessagesController < ApplicationController
  respond_to :json

  before_action :set_message, only: [:show, :edit, :update, :destroy]

  def index
    @messages = Message.all
    respond_with @messages
  end

  def show
    respond_with @message
  end

  def create
    @message = Message.new(message_params)
    @message.save
    respond_with @message
  end


  private
    def set_message
      @message = Message.find(params[:id])
    end

    def message_params
      params.fetch(:message, {})
    end
end
