class BooksController < ApplicationController
  before_action :set_book, only: [:edit, :update, :destroy, :show]

  def index
    @books = current_user.books
  end
  
  def new
    @book = current_user.books.new
  end

  def edit
  end

  def create
    @book = current_user.books.new(book_params)
    if @book.save
      session[:book_id] = @book.id
      redirect_to books_path, notice: "#{@book.name} added!"
    else
      redirect_to new_book_path, alert: "#{@book.errors.full_messages.to_sentence.capitalize}."
    end
  end

  def update
    if @book.update(book_params)
      session[:book_id] = @book.id
      redirect_to books_path, notice: "#{@book.name} updated!"
    else
      redirect_to edit_book_path(@book), alert: "#{@book.errors.full_messages.to_sentence.capitalize}."
    end
  end


  def show
  end

  def destroy
    @book.destroy
    session[:book_id] = nil
    redirect_to books_path, notice: "#{@book.name} deleted!"
  end

  private

  def set_book
    @book = current_user.books.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:name)
  end
end
