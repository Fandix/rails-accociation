class BooksController < ApplicationController
  before_action :author_info

  def index
    begin
      if @author.books
        render json: @author.books, status: :ok
      else
        render json: [], status: :not_found
      end
    rescue => e
      render json: "Error message: #{e}", status: :not_found
    end
  end

  def create
    @book = Book.new(book_params)
    @author.books.push(@book)
    render json: @author, status: :ok
  end

  def show
    @book = @author.books.find_by(id: params[:id])
    render json: @book, status: :ok
  end

  def update
    @book = @author.books.find_by(id: params[:id])
    if @book.update(book_params)
      render json: @book, status: :ok
    end
  end
  
  def destroy
    @book = @author.books.find_by(id: params[:id])
    @book.destroy
    render json: "Delete book successful.", status: :ok
  end
  
  private

  def book_params
    params.require(:book).permit(:name)
  end

  def author_info
    @author = Author.find_by(id: params[:author_id])
  end
  
end
