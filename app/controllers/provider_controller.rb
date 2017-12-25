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

  def req_info
    # Send data from the form to our data-bucket
    ForwardData.send_to_bucket(params)
    redirect_to thank_you_path
  end

  def send_contact_form
    SendgridMailer.send_mail(params)
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
