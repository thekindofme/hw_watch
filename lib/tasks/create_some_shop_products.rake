namespace :hw_watch do

  desc 'create some shop_products'
  task :create_some_shop_products => ['environment'] do
    400.times do |number|
      ShopProduct.create! do |s|
        s.shop_id=rand(40)
        s.product_id=number
        s.save
      end
    end
    puts "created 400 shop_products"
  end
end
