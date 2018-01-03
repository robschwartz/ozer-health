
namespace :ping do
  desc "Ping all website pages for to show activity"
  task :website => :environment do
    puts "Checking webpage availablity..."
    SitePinger.start
    puts "Done Checking"
  end

  desc "Ping data_bucket"
  task :bucket => :environment do
    puts "Checking webpage availablity..."
    RestClient::Request.execute(method: :get, url: "https://data-bucket.herokuapp.com/admin", verify_ssl: false, :proxy => nil)
    puts "Done Checking"
  end

end
