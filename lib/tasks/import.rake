require 'csv'

namespace :import do
  desc "import providers"
  task :providers => :environment do
    import_file = ARGV[1]
    puts "importing #{CSV.read(import_file, {:headers => true, :encoding => 'ISO-8859-1'}).length} providers"
    count = 0
    CSV.foreach(import_file, {:headers => true, :encoding => 'ISO-8859-1'}) do |line|
      Provider.import(line)
    end
  end

end
