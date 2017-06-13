require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'should be valid if name, price, quantity, category are present' do
      cat1 = Category.create! name: 'Apparel'
      p = Product.create!({
        name: 'a',
        price: 64.99,
        quantity: 4,
        category: cat1
      })
      expect(p).to(be_valid)
    end

    it 'should include an error message if name is nil' do
      cat1 = Category.create! name: 'Apparel'
      p = Product.create({
        name: nil,
        price: 64.99,
        quantity: 4,
        category: cat1
      })
      expect(p.errors.full_messages).to include("Name can't be blank")
    end
    
    it 'should include an error message if price is nil' do
      cat1 = Category.create! name: 'Apparel'
      p = Product.create({
        name: 'a',
        price: nil,
        quantity: 4,
        category: cat1
      })
     expect(p.errors.full_messages).to include("Price can't be blank")
    end
    
    it 'should include an error message if quantity is nil' do
      cat1 = Category.create! name: 'Apparel'
      p = Product.create({
        name: 'a',
        price: 45,
        quantity: nil,
        category: cat1
      })
      expect(p.errors.full_messages).to include("Quantity can't be blank")
    end
    it 'should include an error message if category is nil' do
      cat1 = Category.create! name: 'Apparel'
      p = Product.create({
        name: 'a',
        price: 45,
        quantity: 4,
        category: nil
      })
       expect(p.errors.full_messages).to include("Category can't be blank")
    end
  end
end
