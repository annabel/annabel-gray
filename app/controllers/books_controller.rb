class BooksController < ApplicationController
  def index
    @books = []
    Dir.glob(Rails.root.join('app', 'books', '*.yml')) do |book_file|
      @books << YAML.load_file(book_file)
    end
    @books.sort_by! { |book| Date.parse(book['date']) }.reverse!
  end

  def show
    @book = YAML.load_file(
      Rails.root.join('app', 'books', "#{params[:id]}.yml")
    )
  end
end
