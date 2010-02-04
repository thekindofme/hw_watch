namespace :hw_watch do

  desc 'create some products'
  task :create_some_products => ['environment'] do
    400.times do |number|
      Product.create! do |s|
        s.model = "Product#{number}"
        s.brand_id = rand(10)
        s.shop_id = rand(40)
        s.category_id = rand(20)
        s.url = "http://shop.#{s.model}.com"
        s.description = "description for #{s.model}"
        s.image_url = "http://railscasts.com/assets/sponsors/businessispleasure.jpg?1264456519"
        s.in_stock = true
        s.price = rand(982)
        s.sku = rand(4121243)
        s.warranty = "1 year"
        s.save
      end
      puts "created 40 products"
    end
  end
end
