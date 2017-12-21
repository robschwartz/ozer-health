Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'provider#root'

  get '/nursing-home-finder', to: 'provider#home', as: 'home'

  post '/provider/search', to: 'provider#search'

  post '/provider/request-info', to: 'provider#req_info'

  get'/nursing-home-finder/nursing-homes/:location', to: 'provider#location_results', as: 'location'

  get'/nursing-home-finder/nursing-home/:id', to: 'provider#provider_page', as: 'provider_page'

end
