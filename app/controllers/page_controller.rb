class PageController < ActionController::Base
  layout 'application'

  def terms;end
  def privacy;end
  def about;end
  def thanks;end
  def contact;end

  def search_help
    @location = params['location']
    set_title_tag
  end

  private

  def set_title_tag
    @title = if !@location.blank?
              "Nursing Homes And Assisted Living Facilities Near #{@location}"
            elsif !@state.blank?
              "Nursing Homes, Assisted Living Facilities, Intermediate Care #{@state}"
            else
              "Nursing Homes, Assisted Living Facilities, Intermediate Care Near You"
            end
  end
end
