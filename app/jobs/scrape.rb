# scraper for
module DataScraper
  def start
    retrieve_state_links
    retrieve_city_links
    retrieve_facility_links
    pull_data
    save_data
  end

  def retrieve_state_links
    @state_links = []
    page = Nokogiri::HTML(RestClient.get(""))
    page.css('').each {|link|
      @state_links << ""
    }
  end

  def retrieve_city_links
    @state_links.each do { |state_link|
      @city_links = []
      page = Nokogiri::HTML(RestClient.get(state_link))
      page.css('').each {|link|
        @city_links << ""
      }

    }
  end
end
