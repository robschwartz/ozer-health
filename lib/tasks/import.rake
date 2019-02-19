require 'csv'

namespace :import do
  desc "import nursing_homes"
  task :nursing_homes => :environment do
    import_file = ARGV[1]
    puts "importing #{CSV.read(import_file, {:headers => true, :encoding => 'ISO-8859-1'}).length} providers"
    CSV.foreach(import_file, {:headers => true, :encoding => 'ISO-8859-1'}) do |line|
      Provider.import_nursing_homes(line)
    end
  end

  desc "import assisted living facilities"
  task :assisted_living => :environment do
    import_file = ARGV[1]
    puts "importing #{File.read(import_file).length} providers"
    File.foreach(import_file) do |line|
      Provider.import_assisted_living(line)
    end
  end

end