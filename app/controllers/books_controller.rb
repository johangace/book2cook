class BooksController < ApplicationController
  def index 
    @books = Book.all
  end
  
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to @book, notice: "#{@book.name} added!"
    else
      redirect_to new_book_path, alert: "#{@book.errors.full_messages.to_sentence.capitalize}."
    end
  end

  def show
    @book = Book.find(params[:id])
    send_file "cookbook#{@book.id}.pdf", type: 'application/pdf', disposition: 'inline'
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end


  def book_params
    params.require(:book)
      .permit( :name )
  end

end
