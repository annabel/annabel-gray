class BooksController < ApplicationController
  def index
    @available_years = Dir.glob(Rails.root.join('app', 'books', '*'))
                         .select { |path| File.directory?(path) }
                         .map { |path| path.split('/').last }
                         .sort
                         .reverse

    year_param = ActionController::Base.helpers.sanitize(params[:year])
    @current_year =
      if @available_years.include?(year_param)
        year_param
      else
        Time.zone.now.year.to_s
      end

    @books = []
    Dir.glob(Rails.root.join('app', 'books', @current_year, '*.yml')) do |book_file|
      @books << YAML.load_file(book_file)
    end
    @books.sort_by! { |book| Date.parse(book['date']) }.reverse!
  end

  def show
    title = ActionController::Base.helpers.sanitize(params[:id])
    file_path = Dir.glob(Rails.root.join('app', 'books', "**/*"))
                   .select { |path| path.split('/').last == "#{title}.yml" }
                   .first

    if file_path && File.file?(file_path)
      @book = YAML.load_file(file_path)
    else
      raise ActionController::RoutingError, 'Not Found'
    end
  end
end
