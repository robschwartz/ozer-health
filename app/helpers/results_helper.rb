module ResultsHelper
  def self.full_address(home)
    "#{home.address}, #{home.city}, #{home.state}, #{home.zip}"
  end
end
