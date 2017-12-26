Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'provider#root'

  get '/nursing-home-finder', to: 'provider#home', as: 'home'

  get'/nursing-home-finder/nursing-homes/:location', to: 'provider#location_results', as: 'location'

  get'/nursing-home-finder/nursing-home/:id', to: 'provider#provider_page', as: 'provider_page'

  # form requests
  post '/provider/search', to: 'provider#search'

  post '/provider/request-info', to: 'provider#req_info'

  post '/send-contact-form', to: 'provider#send_contact_form'

  # info pages

  get '/terms', to: 'page#terms'
  get '/privacy', to: 'page#privacy'
  get '/about', to: 'page#about'
  get '/thank-you', to: 'page#thanks'

  get 'sitemap.xml', :to => 'sitemap#index', :defaults => {:format => 'xml'}
end
