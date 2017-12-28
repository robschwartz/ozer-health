class SitemapController < ApplicationController
  layout nil

  def index

    @pages = ['', 'about.html', 'thank-you.html']

    @providers = Provider.all

    respond_to do |format|
      format.xml
    end
    render :layout => nil
  end
end
