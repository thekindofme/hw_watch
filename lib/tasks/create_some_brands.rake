namespace :hw_watch do

  desc 'create some brands'
  task :create_some_brands => ['environment'] do
    20.times do |number|
      Brand.create! do |s|
        s.name = "Brand#{number}"
        s.description = "#{number} brand's description"
        s.www_link = "http://www.#{s.name}.com"
        s.save
      end
      puts "created 20 brands"
    end
  end
end
