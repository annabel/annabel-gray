class PagesController < ApplicationController
  def send_message
    @contact_message = Message.new(message_params)
    if @contact_message.valid?
      ContactMailer.contact_form(@contact_message).deliver
      render json: @contact_message, status: :created
    else
      render json: @contact_message.errors, status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(
      :name, :email, :content, :human
    )
  end

  def form
  end
end