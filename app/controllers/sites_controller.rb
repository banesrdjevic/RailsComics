class SitesController < ApplicationController
  require 'open-uri'
  require 'fastimage'
  require 'nokogiri'
    # respond_to :html, :js


  def index
    # puts "Helloohise0he0h8et40h8eth90erth90et490het490hjerg90hrg90hgr90hgre90hrgh09"
    @sites = Site.all
    # require pry; binding.pry
    # puts "h80se80hsf8g0sef08gsfe08gfse80gfes80gsef08gefs0g8esf"
  end

  def show
    @site = Site.all.sample
  end

  def create
    site = site_params[:site]
    domain = domain(@site)
    image = get_biggest_picture(@site, @domain)
    title = title(@site)
    Site.new(site_url: site, picture_url: image, domain: domain, title: title)
  end

  def image_size(picture)
    FastImage.size(picture) != nil ? FastImage.size(picture).inject(:*) : 0
  end

  def get_biggest_picture(site, domain)
    image_elements = Nokogiri::HTML(open(site)).search('img')
    images = image_elements.map{ |item| item.attributes["src"].value }
    images.map!{|img| url_shortener_filter(img, domain)}
    domain_filter = domain_filter(domain, images)
    w_filter = domain_filter.select{|img| wonder_filter(img)}
    w_filter.map!{|img| http_filter(img)}
    w_filter.sort!{|a,b| image_size(b) <=> image_size(a)}
    w_filter.first
  end

  def domain(site)
    site[/(?<=\.)[^_]+(?=\.)/]
  end

  def title(site)
    Nokogiri::HTML(open(site)).search('title').children[0].text
  end

  def wonder_filter(site)
    !site.include?('projectwonderful')
  end

  def domain_filter(domain, sites)
    filtered = sites.select{|site| site.include? domain}
    filtered != [] ? filtered : sites
  end

  def http_filter(site)
    site.include?('http:') ? site : "http:#{site}"
  end

  def url_shortener_filter(site, domain)
    site.include?('..') ? ("http://www." + domain + ".com" + site[/(?<=\.\.).*/]) : site
  end


  private

   def site_params
    params.require(:site).permit(:site_url)
  end

end