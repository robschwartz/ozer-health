@providers.each do |item|
  xml.url do
    xml.loc provider_page_url(item.name)
    xml.changefreq("daily")
    xml.priority "0.8"
    xml.lastmod item.updated_at.strftime("%Y-%m-%dT%H:%M:%S.%2N%:z")
  end

end
