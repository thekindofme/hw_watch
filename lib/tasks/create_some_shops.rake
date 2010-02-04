namespace :hw_watch do

  desc 'create some shops'
  task :create_some_shops => ['environment'] do
    40.times do |number|
      Shop.create! do |s|
        s.name = "Shop#{number}"
        s.address = "#{number} street, adf lane, colombo #{rand(15)}"
        s.rating = rand(10)
        s.shop_link = "http://shop.#{s.name}.com"
        s.www_link = "http://www.#{s.name}.com"
        s.tel1 = rand(986792192).to_s[0..10]
        s.tel2 = rand(986792192).to_s[0..10]
        s.save
      end
      puts "created 40 shops"
    end
  end
end
