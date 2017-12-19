class ProviderController < ActionController::Base
  layout 'application'

  def root
    redirect_to home_path
  end

  def home
    @states = CS.states(:us)
  end

  def search
    p params
    redirect_to location_path(location: params['search'])
  end

  def location_results
    @location = params['location'].split.map(&:capitalize).join(' ')
    results = Provider.location_translator(@location, params['state'])

    @homes = results[:homes].order("city ASC")
    @loc_type = results[:loc_type]

    if @loc_type == "State"
      @cities = results[:city_list]
    end

    if @homes.empty?
      flash[:error] = "Sorry! No Nursing Homes were found in #{@location}. Please enter a new search."
      redirect_to home_path
    end

  end


end
