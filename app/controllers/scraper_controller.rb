class ScraperController < ApplicationController
  def index
    @entries = Entry.all.order('id DESC')
  end

  def scrape_site
    @results = SiteScraper.scrape_by_url "http://experienciasblack.lanacion.com.ar/"
  end
end
