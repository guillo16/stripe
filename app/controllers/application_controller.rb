class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  include CurrentCart
  before_action :set_cart
end
