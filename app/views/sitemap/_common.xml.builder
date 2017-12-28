base_url = "http://#{request.host_with_port}/"

@pages.each do |page|
  xml.url do
    xml.loc base_url+page
    xml.changefreq("hourly")
    xml.priority "1.0"
  end

end
