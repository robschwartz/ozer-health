class Provider < ApplicationRecord

  def self.medicare_available?(line)
    true if line.include?("Medicare")
  end

  def self.medicaid_available?(line)
    true if line.include?("Medicaid")
  end

  def self.import(line)
    Provider.find_or_create_by(provider_number: line[0]) do |prov|
      # need this as a hack to not have name set to array of the full line ?!?
      prov.health_inspection_rating = line[23],
      prov.name = line[1].split.map(&:capitalize).join(' '),
      prov.address = line[2].split.map(&:capitalize).join(' '),
      prov.city = line[3].split.map(&:capitalize).join(' '),
      prov.state = line[4],
      prov.zip = line[5],
      prov.phone = line[6],
      prov.county = line[8],
      prov.bed_count = line[10],
      prov.occupied_beds = line[11],
      prov.medicare = medicare_available?(line[12]),
      prov.medicaid = medicaid_available?(line[12]),
      prov.holding_company =line[14].split.map(&:capitalize).join(' '),
      prov.overall_rating = line[22]
    end
  end

  private

  def self.location_translator(location, loc_state=nil)
    results = {}
    # check if the search location is a state
    state = CS.states(:us).key(location)
    if state
      # return list of homes in the state
      results = {homes: Provider.where(state: state), city_list: relevant_cities(state), loc_type: "State"}
    else
      # if not a state, check if it's a city
      if loc_state
        provider_list = Provider.where(city: location, state: state = CS.states(:us).key(loc_state))
      else
        provider_list = Provider.where(city: location)
      end
      results = {homes: provider_list, loc_type: "City"}
      if provider_list.empty?
        # if not a city, check if it's a zip
        provider_list = Provider.where(zip: location.to_i)
        results= {homes: provider_list, type: "Zip"}
      end
      results
    end
  end

  # method to find Cities with Nursing homes within them for the searched state.
  def self.relevant_cities(state)
    all_cities = CS.cities(state, :us)
    home_cities = []

    byebug
    all_cities.each do |city|
      city_results = Provider.where(city: city, state: state)
      if !city_results.empty?
        puts "adding #{city}: #{city_results.count}"
        home_cities << city
      end
    end
    home_cities
  end

  def self.full_address(home)
    "#{home.address}, #{home.city}, #{home.state}, #{home.zip}"
  end
end
