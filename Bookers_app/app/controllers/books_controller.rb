class BooksController < ApplicationController

  def index
    @books = Book.all
    @book = Book.new
  end

  def show

    @book = Book.find(params[:id])
  end

  def create
    @book = Book.new(book_params)
    if @book.save
       flash[:notice] = "Book was successfully created."
  	   redirect_to book_path(@book.id)
    else
      @books = Book.all.order(created_at: :desc)
      render ("index")
    end

  end

  def edit
    @book = Book.find(params[:id])
  end

  def destroy
    @books = Book.find(params[:id])
    @books.destroy
    redirect_to books_path
    flash[:notice] = "Book was successfully destroyed."
  end
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
       redirect_to book_path(@book.id)
       flash[:notice] = "Book was successfully updated."
    else
       render ("edit")
    end
  end

    private
  def book_params
    params.require(:book).permit(:title,:body)
  end

end
