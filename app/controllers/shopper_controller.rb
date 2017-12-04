class ShopperController < ApplicationController
    skip_before_action :authorize
    include CurrentCart
    before_action :set_cart

    def index
        @search = ProductSearch.new(params[:search])
        @products = @search.scope
        #@products = Product.order( :name)
    end
end
