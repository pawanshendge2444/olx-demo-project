Stripe.api_key = 'sk_test_51MJW55SIBEkZWIhYLrJZtOZ78F5axpA6uOd99XZftVc55pMNj9VV0Tg0chbL0aC3vnfMgm4ChEthl7KfciH7gicc00TACF6AVv'
# Stripe.api_key = Rails.application.credentials.stripe_secret_key


# Stripe.api_key = Rails.configuration.stripe[:secret_key]

Rails.configuration.stripe = {
:publishable_key =>  ENV['PUBLISHABLE_KEY'],
:secret_key => ENV['SECRET_KEY']
}

