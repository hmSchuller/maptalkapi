class Api::V1::MessagesController < ApplicationController
  def index
    meters = ((params[:m] || 20).to_f * 0.000621371).to_f
    lat = (params[:lat] || 49.000793).to_f
    lng = (params[:lng] || 12.095634).to_f
    @messages = Message.within(meters, origin: [lat, lng])
    render json: @messages.to_json, each_serializer: MessageSerializer
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      render json: @messages.to_json, serializer: MessageSerializer
    else
      render json: { errors: { message: "invalid" }}, status: 422
    end
  end


  private

  def message_params
    params.fetch(:message, [:lat, :lng, :text, :author])
  end
end
