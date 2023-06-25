class CheckoutController < ApplicationController
	def create
		product =Product.find(params[:id])
		@session = Stripe::Checkout::Session.create({
			mode: 'payment',
			payment_method_types: ['card'],
			line_items: [{
			  price_data: {
			    currency: 'INR',
			      product_data: {
			        name: product.name,
			      },
			      unit_amount: product.price,
			    },
			    quantity: 1,
			  }],
			  success_url: root_url,
			  cancel_url: root_url,
			})
		respond_to do |format|
			format.js
		end
	end
end