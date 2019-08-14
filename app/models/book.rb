class Book < ApplicationRecord
  belongs_to :user
  has_many :cookbook_entries
  has_many :recipes, through: :cookbook_entries
  
  has_one_attached :image

  validates :name, :subtitle, presence: true
  
  
  after_save :make_pdf
  after_save :cover_pdf
 

  def cover_url
    if image.attached?
       image
    else
      'app/assets/images/frame1.jpeg'
    end
  end


  def cover_pdf
    Prawn::Document.generate(
    "tmp/cover#{id}.pdf",
    
      page_size: [450, 666],
      page_layout: :portrait
    ) do |pdf|
      
      pdf.image Rails.root.join(cover_url), width: 400, at: [-10,580], align: :center
      # pdf.image StringIO.open(cover_url.download), width: 560, at: [0, 560], align: :center
      pdf.move_down 250
      pdf.font "Times-Roman", style: :bold
      pdf.font_size(40) { pdf.text name, align: :center }
      pdf.move_down 10
      pdf.font "Helvetica", style: :italic
      pdf.font_size(20) { pdf.text subtitle, align: :center}

      end
    end
  


def make_pdf
  Prawn::Document.generate(
   "tmp/cookbook#{id}.pdf",
     page_size: [450, 666],
    page_layout: :portrait
  ) do |pdf|

    pdf.move_down 10
    pdf.font "Helvetica", style: :italic
    pdf.font_size(17) { pdf.text dedication, align: :center}

    recipes.each do |recipe|
      pdf.move_down 60
      pdf.stroke_horizontal_rule
      pdf.pad_top(11) { pdf.font_size(20) { pdf.text recipe.name.upcase, style: :normal, align: :center} }
      pdf.stroke_horizontal_rule
      pdf.move_down 50
      pdf.font_size(10) { pdf.text "Recipe by: #{recipe.user.email}", style: :italic }
      pdf.move_down 80
      pdf.font_size(15) { pdf.text_box "Ingredients:", at: [0, 365], style: :normal }
      pdf.font_size(11)
      pdf.text_box recipe.ingredients, at: [0, 340], height: 100, width: 120, style: :normal
      pdf.font_size(15) { pdf.text_box "Instructions:", at: [165, 365],  style: :normal
        pdf.font_size(11) { pdf.text_box recipe.instructions, at: [165, 340], width: 200, style: :normal }
      }
      pdf.start_new_page
      pdf.image StringIO.open(recipe.image.download), width: 377, at: [0, 560], align: :center
      pdf.start_new_page
    end
    options = {
      align: :center,
      page_filter: lambda{ |pg| pg > 1},
      start_count_at: 2,
      at: [ 0, 5]
    }
    pdf.number_pages " <page> ", options
  end
end
end
