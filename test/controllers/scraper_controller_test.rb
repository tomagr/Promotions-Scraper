require 'test_helper'

class ScraperControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get scraper_index_url
    assert_response :success
  end

  test "should get scrape_site" do
    get scraper_scrape_site_url
    assert_response :success
  end

end
