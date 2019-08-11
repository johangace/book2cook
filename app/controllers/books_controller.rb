class BooksController < ApplicationController
  def index 
    @books = Book.all
    
    if params[:user_id]
      @user = User.find_by(id: params[:user_id])
      if @user
        @books = @user.books
      else 
        redirect_to '/books?mine=true'
      end

    else
      @books = Book.all
      @books = current_user.books if (params[:mine])
    end
  end
  
  def new
    @book = current_user.books.new
    @recipes = current_user.recipes
  end

  def edit
    @book = Book.find(params[:id])
  end

  def create
    p params[:recipes]
    @book = current_user.books.new(book_params)
    if @book.save
      redirect_to @book, notice: "#{@book.name} added!"
    else
      redirect_to new_book_path, alert: "#{@book.errors.full_messages.to_sentence.capitalize}."
    end
  end

  def update
    
    if @book.update(book_params)
      redirect_to @books, notice: "#{@book.name} updated!"
    else
      redirect_to edit_book_path(@book), alert: "#{@book.errors.full_messages.to_sentence.capitalize}."
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
      .permit(:name, :id)
  end
  

end
