class SalesTax
	def initialize
		@collection = []
	end

	def add_product(product, quantity)
		@collection.push({product: product, quantity: quantity})
	end

	def count_decimal(value)
		count = value.to_s.split(".")[1].length
		return count
	end

	def round_to_nearest(num)
		num_dec = num.to_f.to_s.split(".")[1]
	   	whole_num = num.to_i
	   	count = 2 - num_dec.length
	   	(1..count).each do
	   		num_dec += '0'
	   	end
	   	result = num_dec[1]
	   	if num_dec[1].to_i == 0
       		result = 0
	   	elsif (num_dec[1].to_i <= 5)
	   		result = 5
	   	elsif (num_dec[0] == '9')
	   		whole_num += 1
	   		num_dec[0] = '0';
	   		result = 0;
	   	else
	   		num_dec[0] = (1 + num_dec[0].to_i).to_s;
	   		result = 0;
	   	end

	   	result = ((num_dec[0] + result.to_s).to_i * 0.01) + whole_num
		return result
	end

	def round_val(val)
		result = val.to_f
		if !val.to_f.to_s.split(".")[1][1].nil?
			if val.to_f.to_s.split(".")[1][1].to_i > 5
				result = val.round(1)
			end
		end
		return result
	end

	def calculate(product)
		total_tax = 0
		total_price = 0
		tax = 0
		tax += 10 if !product[:IsTaxExcempt] #10% tax for all products except food, medical and books
		tax += 5 if product[:IsImported] #5% tax for imported products

		total_tax += round_to_nearest(((tax*product[:Price].to_f)/100))
		total_price += product[:Price].to_f + total_tax

		return {total_tax: round_val(total_tax), total_price: total_price}
	end

	def get
		@total_tax = 0
		@total_price = 0
		for p in @collection
			val = calculate(p[:product])
			@total_tax += (val[:total_tax] * p[:quantity]).round(2)
			@total_price += (val[:total_price] * p[:quantity]).round(2)
		end

		return {total_tax: @total_tax, total_price: @total_price}
	end

end