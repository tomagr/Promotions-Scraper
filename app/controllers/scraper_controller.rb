class ScraperController < ApplicationController

  def index
    redirect_to "http://beta.alomacain.com"
  end

  def list
    #Get available first
    @entries = Entry.all.order('id DESC').limit(20)
  end

  def scrape
    @results = SiteScraper.scrape_by_url "http://experienciasblack.lanacion.com.ar/"
  end
end
