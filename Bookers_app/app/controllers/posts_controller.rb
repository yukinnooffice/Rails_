class PostsController < ApplicationController

  def index
    @books = Book.all.order(created_at: :desc)
  end

  def show

    @books = Book.find_by(id:params[:id])
  end

  def create
    @books = Book.new(title:params[:title],body:params[:body])
    @books.save
  	redirect_to("/posts/index")
  end

  def edit
    @books = Book.find_by(id:params[:id])
  end

  def destroy
    @books = Book.find(params[:id])
    @books.destroy
    redirect_to("/posts/index")
  end
  def update
    @books = Book.find_by(id:params[:id])
    @books.title = params[:title]
    @books.body = params[:body]
    @books.save
    redirect_to("/posts/index")
  end

end
