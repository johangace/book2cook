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
      page_size: [450, 666],
      page_layout: :portrait
    ) do |pdf|
      # replace this with the actual book's recipes once you have a UI to add recipes to a book

      pdf.move_down 200

      pdf.font "Courier", style: :bold
      pdf.font_size(50) {
        pdf.text name, align: :center
      }

      pdf.move_down 10
      pdf.text "Meals with XXX", :align => :center
    
      pdf.start_new_page

      Recipe.all.each do |recipe|

        pdf.move_down 80
        pdf.font "Helvetica", style: :bold
    
        pdf.font "Helvetica", style: :normal
        pdf.text "By: #{recipe.user.email}" , :align => :right
        pdf.move_down 90

        # pdf.stroke { pdf.line [50, 150], [150, 150] }

        pdf.stroke_horizontal_rule
        pdf.pad_top(10) { pdf.font "Helvetica", style: :bold
        pdf.font_size(27) {pdf.text recipe.name ,
       :align => :center} } 
      pdf.stroke_horizontal_rule

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
        pdf.text recipe.instructions, :align => :center
        
        pdf.start_new_page

        # image_file = open(url_for(recipe.image))
        # pdf.image image_file.path, width: 350,  :align => :center
        # pdf.start_new_page
      end  
   
      string = "page <page> "
      # Green page numbers 1 to 7
      options = { 
      :align => :right,
      :page_filter => lambda{ |pg| pg > 1},
      :start_count_at => 2
    }   
      pdf.number_pages string, options
    end
  end
end



