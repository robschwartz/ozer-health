require 'csv'

URL_BASE="http://www.adulthomedirectory.com"
# scraper for
module SitePinger
  def self.start
    @all_city_links = []
    retrieve_state_links
    retrieve_city_links
    retrieve_facility_links
  end

  def self.retrieve_state_links
    @state_links = []
    page = Nokogiri::HTML(RestClient::Request.execute(method: :get, url: "#{URL_BASE}", verify_ssl: false, :proxy => nil))
    page.css('.state-list a').each do |link|
      @state_links << "#{URL_BASE}#{link['href'].gsub(" ", "%20")}"
    end
  end

  def self.retrieve_city_links
    @state_links.each do |state_link|
      puts "Finding city links for #{state_link}"
      page = Nokogiri::HTML(RestClient::Request.execute(method: :get, url: "#{state_link}", verify_ssl: false, :proxy => nil))
      page.css('.city-list a').each do |link|
        @all_city_links << "#{URL_BASE}#{link['href'].gsub(" ", "%20")}"
      end
    end
  end

  def self.retrieve_facility_links
    @all_city_links.each do |city_link|
      puts "Checking city page for #{city_link}"
      Nokogiri::HTML(RestClient.get(city_link))
      sleep(10)
    end
  end

end
