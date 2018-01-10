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
    redirect_to location_path(location: params['search'], home_type: params['home_type'])
  end

  def req_info
    # Send data from the form to our data-bucket
    ForwardData.send_to_bucket(params)
    redirect_to thank_you_path
  end

  def send_contact_form
    ContactUsMailer.contact(params).deliver_now
  end

  def location_results
    @home_type = params[:home_type]

    @location = params['location'].split.map(&:capitalize).join(' ')
    results = Provider.location_translator(@location, params['state'], params['home_type'])

    if !@home_type.blank?
      @homes = results[:homes].where(home_type: @home_type).order("city ASC")
    else
      @homes = results[:homes].order("city ASC")
    end

    @loc_type = results[:loc_type]

    if @loc_type == "State"
      @cities = results[:city_list]
    end

    if @homes.empty?
      flash[:error] = "Sorry! Your search returned 0 results. Please enter a new search."
      redirect_to home_path
    end

  end

  def show
    @home = Provider.find_by_name(params['name'])
    @state = CS.states(:us)[@home.state.to_sym]

  end


end
