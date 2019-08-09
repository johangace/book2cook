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
    # 
  Prawn::Document.generate(
  "cookbook1.pdf",
  page_size: [450, 666],
  page_layout: :portrait
) do |pdf|
  # replace this with the actual book's recipes once you have a UI to add recipes to a book
  pdf.move_down 200
   
  

  pdf.font "Helvetica", style: :bold 
  pdf.font_size(50) {
  pdf.text "Our family's CookBook", :align => :center} 

  pdf.move_down 10
  pdf.text "Meals with XXX", :align => :center

  pdf.start_new_page
  
  Recipe.all.each do |recipe|  
    pdf.move_down 80
    pdf.font "Helvetica", style: :bold 

    pdf.font "Helvetica", style: :normal
    pdf.text "By: #{recipe.user.email}" , :align => :right
    pdf.move_down 90

    pdf.font "Helvetica", style: :bold 
    pdf.font_size(30) {
    pdf.text recipe.name , 
    :align => :center}
    pdf.move_down 70
    
    pdf.font "Helvetica", style: :normal
    pdf.font_size(22) {
    pdf.text "Ingredients:"   ,:align => :center} 
    pdf.font "Helvetica", style: :normal
    pdf.text recipe.ingredients ,
    :align => :center

    pdf.move_down 70
    pdf.font "Helvetica", style: :normal
    pdf.font_size(22) {
    pdf.text "Instructions:"   ,:align => :center} 

    pdf.font "Helvetica", style: :normal
    pdf.text recipe.instructions ,
     :align => :center
    pdf.start_new_page

    
    # image_file = open(url_for(recipe.image))
    #  pdf.image image_file.path, width: 350,  :align => :center
    # pdf.start_new_page

  end
    send_data pdf.render , 
     filename: "book",  
     type: "application/pdf",  
     disposition: "inline"
  end
end

  def book_params
    params.require(:book)
      .permit( :name )
  end

end
