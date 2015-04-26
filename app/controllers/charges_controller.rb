class ChargesController < ApplicationController

def new
   @stripe_btn_data = {
     key: "#{ Rails.configuration.stripe[:publishable_key] }",
     description: "Premium membership - #{current_user.name}",
     amount: Amount.default
   }
 end


def create
  
  # Creates a Stripe customer object, for associating with a charge
  customer = Stripe::Customer.create(
    email: current_user.email,
    card: params[:stripeToken]
  )

  # Create a charge object and associate it with a customer id
  if charge = Stripe::Charge.create(
    customer: customer.id, # Different from user_id in app
    amount: Amount.default,
    description: "Premium membership - #{current_user.email}",
    currency: 'usd'
  )

    current_user.update(role: 'premium')
    flash[:success] = "Thank you for upgrading your account. Enjoy our Premium features."
    redirect_to wikis_path
  end  

  # Stripe will send back CardErrors, with friendly messages
  # when something goes wrong.
  # This `rescue block` catches and displays those errors.
  rescue Stripe::CardError => e
   flash[:error] = e.message
   redirect_to new_charge_path
end

end

class Amount
  
  def self.default
    member_fee = 15_00
    return member_fee
  end

end