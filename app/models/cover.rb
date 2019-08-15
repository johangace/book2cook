class Cover < ApplicationRecord
  belongs_to :book

  has_one_attached :image

  has_one_attached :interior_pdf

after_save :cover_pdf, if: :changed?

def cover_url(size="200x200")
    if image.attached?
      image.variant(resize: size)
    else
      'app/assets/images/frame1.jpeg'
end


def cover_pdf
  Prawn::Document.generate(
  "tmp/cover#{id}.pdf",
    page_size: [450, 666],
    page_layout: :portrait
  ) do |pdf|
    pdf.image Rails.root.join(cover_url), width: 400, at: [-10,580], align: :center
    pdf.image StringIO.open(cover_url.download), width: 560, at: [0, 560], align: :center
    pdf.move_down 250
    pdf.font "Times-Roman", style: :bold
    pdf.font_size(40) { pdf.text @books.name, align: :center }
    pdf.move_down 10
    pdf.font "Helvetica", style: :italic
    pdf.font_size(20) { pdf.text @books.subtitle, align: :center}
    end
  self.interior_pdf.attach(io: File.open(Rails.root.join('tmp', "cover#{id}.pdf")), filename: 'cover.pdf')
  end
end
