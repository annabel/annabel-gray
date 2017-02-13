class PagesController < ApplicationController
  def send_message
    @contact_message = Message.new(message_params)
    if @contact_message.save
      render json: @contact_message, status: :created
    else
      render json: @contact_message.errors, status: :unprocessable_entity
    end
  end

  def books
    @books = []
    Dir.glob(Rails.root.join('app', 'books', '*.yml')) do |book_file|
      @books << YAML.load_file(book_file)
    end
    @books.sort_by! { |book| Date.parse(book['date']) }.reverse!
  end

  private

  def message_params
    params.require(:message).permit(:name, :email, :content, :human)
  end
end
