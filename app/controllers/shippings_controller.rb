require "#{Rails.root}/lib/shippingwrapper.rb"
class ShippingsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def index
    #render json: variable.as_json(excet: [:created_at, :updated_at])
  # end
  end

  def info

    data_packages = params[:products_specs]
    data_destination = params[:destination]
    data_origin = params[:origin]

    # binding.pry
    total_result = ShippingWrapper.create_ups(data_origin, data_destination, data_packages)

    # ups_result = ShippingWrapper.create_fedex(data_origin, data_destination, data_packages)
    # total_result = {
      # fedex_result: fedex_result,
    #   ups_result: ups_result
    # }
    # binding.pry

    render json: total_result.as_json
    # render json: params.as_json
    # render json:
    # , status: :no_content
    # end
  end
 #

 # origin = ActiveShipping::Location.new(country: 'US',
 #                                       state: 'CA',
 #                                       city: 'Beverly Hills',
 #                                       zip: '90210')
 #
 # destination = ActiveShipping::Location.new(country: 'CA',
 #                                            province: 'ON',
 #                                            city: 'Ottawa',
 #                                            postal_code: 'K1P 1J1')


#shippings
#provider (UPS/FedEx)
#types
#cost
#tracking
#delivery


#This is what we need to save in our API.
#id
#address
#address2
#city
#state
#zipcode
#response
end
