class AuthorsController < ApplicationController
  def index
    @authors = Author.all
    render json: @authors, status: :ok
  end

  def create
    @author = Author.new(author_params)
    if @author.save
      render json: @author, status: :created
    end
  end

  def show
    @author = Author.find(params[:id])
    if @author
      render json: @author, status: :ok
    elsif
      render json: "Author not found!", status: :not_found
    end
  end

  def update
    @author = Author.find(params[:id])
    if (@author.update!(author_params))
      render json: @author, status: :ok
    end
  end

  def destroy
    Author.find(params[:id]).destroy
  end

  private

  def author_params
    params.require(:author).permit(:name)
  end
end
