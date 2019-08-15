class BooksController < ApplicationController
  before_action :set_book, only: [:edit, :update, :destroy, :show]

  def index
    @books = current_user.books
  end
  
  def new
    @book = current_user.books.new
  end

  def edit
    # This is a HACK: don't move this without talking to andy
    @book.cover.cover_pdf
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
    response = HTTParty.post(Lulu.base_url+'/print-job-cost-calculations/',
      body: {
        "line_items" => [{
          "pod_package_id" => "0600X0900BWSTDPB060UW444MXX",
          "quantity" => 1,
          # "page_count" => @book.recipes.count * 2 + 2
          "page_count": 32
        }],
        "shipping_address" => {
        "city" => @book.user.profile.city,
        "country_code" => "US",
        "postcode" => @book.user.profile.zipcode,
        "state_code" => @book.user.profile.state,
        "street1" => @book.user.profile.street
        },
        "shipping_level" => "MAIL"
      }.to_json,
      headers: {
        "Content-Type" => "application/json",
        "Authorization" => "Bearer #{Lulu.token}"
      }
    )
    @price = JSON.parse(response.body)["total_cost_incl_tax"]
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
    params.require(:book).permit(:name, :subtitle, :dedication, :footer, :image)
  end
end
