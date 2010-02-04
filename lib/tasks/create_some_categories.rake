namespace :hw_watch do

  desc 'create some categories'
  task :create_some_categories => ['environment'] do
    40.times do |number|
      Category.create! do |s|
        s.name = "category#{number}"
        s.description = "#{number} description"
        s.save
      end
      puts "created 40 categories"
    end
  end
end
