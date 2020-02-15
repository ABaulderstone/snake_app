class PaymentsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:webhook]

  def success

  end

  def webhook
    user_id = params[:data][:object][:client_reference_id] #Referencing perchaser (USER)
    payment_id =  params[:data][:object][:payment_intent]  #Referencing the payment ID 
    payment = Stripe::PaymentIntent.retrieve(payment_id)
    listing_id = payment.metadata.listing_id
  
    p "listing id " + listing_id 
    p "user id " + user_id
    p "payment id " + payment_id
  
    Order.create(user_id: user_id, listing_id: listing_id, payment_id: payment_id)
    render json: ""

  end


end
