class StripeCheckoutSessionService
  def call(event)
    order = Order.find_by(checkout_session_id: event.data.object.id)
    order.update(state: 'paid')
    @cart = Cart.find(session[:cart_id])
    session[:cart_id] = nil
  end
end
