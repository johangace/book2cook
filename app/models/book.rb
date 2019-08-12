class Book < ApplicationRecord
  belongs_to :user
  has_many :cookbook_entries
  has_many :recipes, through: :cookbook_entries

  validates :name, presence: true

  require "open-uri"
  include Rails.application.routes.url_helpers

  after_create :make_pdf


  def make_pdf
    Prawn::Document.generate(
     "cookbook#{id}.pdf",
    #  :background => "app/assets/images/frame1.jpeg",
       page_size: [450, 666],
      page_layout: :portrait
    ) do |pdf|
      # replace this with the actual book's recipes once you have a UI to add recipes to a book

      pdf.move_down 250

      pdf.font  "Times-Roman", style: :bold
      pdf.font_size(40) {
        pdf.text name, align: :center
      }

      pdf.move_down 10
      pdf.font  "Helvetica", style: :italic
      pdf.text "Meals with XXX", :align => :center
    
      pdf.start_new_page

      Recipe.all.each do |recipe|       


        pdf.move_down 72
        
  
        pdf.stroke_horizontal_rule
        pdf.pad_top(11) {
        pdf.font_size(20) {pdf.text recipe.name.upcase ,
        style: :normal,
       :align => :center} } 
      pdf.stroke_horizontal_rule

      pdf.move_down 50
        
      pdf.font_size(10) {
        pdf.text "Recipe by: #{recipe.user.email}" , 
        style: :italic}
        

        pdf.move_down 80
       
        pdf.font   
        pdf.font_size(15) {
        pdf.text_box "Ingredients:",  
        :at => [0, 365],
        style: :normal
         }

        pdf.font   
        pdf.font_size(11) 
        pdf.text_box  recipe.ingredients ,
        :at => [0, 340],
        :height => 100,
        :width => 120,
        style: :normal
       
        pdf.font_size(15) {
       pdf.text_box "Instructions:" , 
       :at => [165, 365] 
       pdf.font_size(11) { 
       pdf.text_box recipe.instructions,
         :at => [165, 340],
         :width => 200 }}
      
        
        pdf.start_new_page

        # image_file = open(url_for(recipe.image))
        # pdf.image image_file.path, width: 350,  :align => :center
        # pdf.start_new_page
      end  
   
   
      string = " <page> "
      # Green page numbers 1 to 7
      options = { 
      :align => :center,
      :page_filter => lambda{ |pg| pg > 1},
      :start_count_at => 2,
       :at => [ 0, 5]
    }   
      pdf.number_pages string, options
    end
  end
end



