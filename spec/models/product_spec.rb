require 'rails_helper'
require "#{Rails.root}/app/assets/sales_tax.rb"
require "#{Rails.root}/app/assets/my_products.rb"

RSpec.describe SalesTax, type: :class do
  # id:1 - book
  # id:2 - music cd
  # id:3 - chocolate bar
  # id:4 - imported box of chocolates
  # id:5 - imported bottle of perfume
  # id:6 - bottle of perfume
  # id:7 - packet of headache pills
  # id:8 - box of imported chocolates
  # id:9 - imported bottle of perfume 2

  before(:example) do
	@product = MyProducts.new
  end

  def compute(product_ids)
  		sales_tax = SalesTax.new
		product_ids.each {|p| sales_tax.add_product(@product.find(p), 1)}
		return sales_tax
  end

  context "checking output for input 1: " do
  	it "should return 1.50 total tax output for input 1" do
		input_product_ids = [1, 2, 3]
		result = compute(input_product_ids).get[:total_tax].round(2)
		expect(result).to eq(1.50)
  	end

  	it "should return 29.83 total price output for input 1" do
		input_product_ids = [1, 2, 3]
		result = compute(input_product_ids).get[:total_price].round(2)
		expect(result).to eq(29.83)
  	end
  end

  context "checking output for input 2: " do
  	it "should return 7.65 total tax output for input 2" do
		input_product_ids = [4, 5]
		result = compute(input_product_ids).get[:total_tax].round(2)
		expect(result).to eq(7.65)
  	end

  	it "should return 65.15 total price output for input 2" do
		input_product_ids = [4, 5]
		result = compute(input_product_ids).get[:total_price].round(2)
		expect(result).to eq(65.15)
  	end
  end

  context "checking output for input 3: " do
  	it "should return 6.70 total tax output for input 3" do
		input_product_ids = [9, 6, 7, 8]
		result = compute(input_product_ids).get[:total_tax].round(2)
		expect(result).to eq(6.70)
  	end

  	it "should return 74.68 total price output for input 3" do
		input_product_ids = [9, 6, 7, 8]
		result = compute(input_product_ids).get[:total_price].round(2)
		expect(result).to eq(74.68)
  	end
  end
end
