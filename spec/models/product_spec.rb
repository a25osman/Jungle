require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    it 'saves with all fields filled in' do
      category = Category.new(name:"candy")
      product = Product.new(
        name: 'pop',
        price: 3.50,
        quantity: 1000,
        category: category
      ) 
      expect(product).to be_valid
    end
  
    it 'is invalid without a name' do
      category = Category.new(name:"candy")
      product = Product.new(
        name: nil,
        price: 3.50,
        quantity: 1000,
        category: category
      ) 
      expect(product).to_not be_valid
    end
  
    it 'is invalid without a price' do
      category = Category.new(name:"candy")
      product = Product.new(
        name: 'pop',
        quantity: 1000,
        category: category
      ) 
  
      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include('Price can\'t be blank')
    end
  
    it 'is invalid without a quantity' do
      category = Category.new(name:"candy")
      product = Product.new(
        name: 'pop',
        price: 3.50,
        category: category
      )
      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include('Quantity can\'t be blank')
    end
  
    it 'invalid without a category' do
      category = Category.new(name:"candy")
      product = Product.new(
        name: 'pop',
        price: 3.50,
        quantity: 1000,
  
      ) 
      expect(product).to_not be_valid
    end


  end
end
