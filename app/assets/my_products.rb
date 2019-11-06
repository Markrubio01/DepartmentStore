class MyProducts
	def initialize
		@items = [
			{
			Id: 1,
			Name: 'book',
			Price: 12.49,
			IsTaxExcempt: true,
			IsImported: false
			},
			{
			Id: 2,
			Name: 'music cd',
			Price: 14.99,
			IsTaxExcempt: false,
			IsImported: false
			},
			{
			Id: 3,
			Name: 'chocolate bar',
			Price: 0.85,
			IsTaxExcempt: true,
			IsImported: false
			},
			{
			Id: 4,
			Name: 'imported box of chocolates',
			Price: 10.00,
			IsTaxExcempt: true,
			IsImported: true
			},
			{
			Id: 5,
			Name: 'imported bottle of perfume',
			Price: 47.50,
			IsTaxExcempt: false,
			IsImported: true
			},
			{
			Id: 6,
			Name: 'bottle of perfume',
			Price: 18.99,
			IsTaxExcempt: false,
			IsImported: false
			},
			{
			Id: 7,
			Name: 'packet of headache pills',
			Price: 9.75,
			IsTaxExcempt: true,
			IsImported: false
			},
			{
			Id: 8,
			Name: 'box of imported chocolates',
			Price: 11.25,
			IsTaxExcempt: true,
			IsImported: true
			},
			{
			Id: 9,
			Name: 'imported bottle of perfume 2',
			Price: 27.99,
			IsTaxExcempt: false,
			IsImported: true
			}
		]
	end
	def all
		@items
	end

	def find(id)
		item = {}
		for i in @items do
			if i[:Id] == id
				item = i
				break
			end
		end
		return item
	end
end