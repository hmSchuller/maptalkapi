class Api::V1::MessagesController < ApplicationController
  before_action :set_headers

  def index
    meters = ((params[:m] || 20).to_f * 0.000621371).to_f
    lat = (params[:lat] || 49.000793).to_f
    lng = (params[:lng] || 12.095634).to_f
    message_type = (params[:type] || 'comment').to_s
    @m_scope = Message.where(message_type: message_type)
    @messages = @m_scope.within(meters, origin: [lat, lng])
    render json: @messages, each_serializer: ::MessageSerializer
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      render json: @message, serializer: ::MessageSerializer
    else
      render json: { errors: { message: "invalid" }}, status: 422
    end
  end




  private
  def set_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
    headers['Access-Control-Request-Method'] = '*'
    headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
  end

  def message_params
    params.require(:message).permit([:lat, :lng, :text, :author]).to_h
  end
end
