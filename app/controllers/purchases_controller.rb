class PurchasesController < ApplicationController
  include Rails.application.routes.url_helpers
  before_action :set_book

  def create
    HTTParty.post(
      Lulu.base_url + '/print-jobs/',
      body: {
        "contact_email" => current_user.email,
        "line_items" => [
          {
            "printable_normalization" => {
              "cover" => {
                "source_url" => url_for(@book.cover.pdf),
              },
              "interior" => {
                "source_url" => url_for(@book.interior_pdf)
              },
              "pod_package_id" => "0600X0900BWSTDPB060UW444MXX"
            },
            "quantity" => 1,
            "title" => @book.name
          }
        ],
        "production_delay" => 120,
        "shipping_address" => {
          "city" => current_user.profile.city,
          "country_code" => "US",
          "name" => current_user.profile.name,
          "phone_number" => current_user.profile.phone_number,
          "postcode" => current_user.profile.zipcode,
          "state_code" => current_user.profile.state,
          "street1" => current_user.profile.street
        },
        "shipping_level" => "MAIL"
      }.to_json,
      headers: {
        "Content-Type" => "application/json",
        "Authorization" => "Bearer #{Lulu.token}"
      }
    )
    render json: { location: book_purchase_path(@book) }
  end

  private

  def set_book
    @book = Book.find(params[:book_id])
  end
end
