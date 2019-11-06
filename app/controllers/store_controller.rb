class StoreController < ApplicationController
require "#{Rails.root}/app/assets/my_products.rb"
require "#{Rails.root}/app/assets/sales_tax.rb"
#skip_before_action :verify_authenticity_token
	def initialize
		super
		@products = MyProducts.new
	end 

	def index
		@my_products = @products.all
	end

	def receipt
		product_ids = params[:product_ids]
	    salestax = SalesTax.new
	    cart_products = JSON.parse(params[:cart_products])
	    cart_products.each {|v|
	    	product = @products.find(v['id'].to_i); 
	    	salestax.add_product(product, v['quantity'].to_i)
	    	v['name'] = product[:Name].to_s
	    }
	    list = salestax.get
	    @product_list = cart_products
	    @total_price = list[:total_price]
	    @total_tax = list[:total_tax]
	end
end
