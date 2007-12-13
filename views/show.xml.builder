xml.instruct!

xml.urlset "xmlns" => "http://www.google.com/schemas/sitemap/0.84" do
  xml.url do
    xml.loc         url_for(root_url)
    xml.lastmod     w3c_date(Time.now)
    xml.changefreq  "always"
  end
  
@widgets.each_key do |k|
  xml.url do
    xml.loc         url_for(send(@sitemap_config[k]["index_named_route"].to_sym))
    xml.lastmod     w3c_date(Time.now)
    xml.changefreq  @sitemap_config[k]["frequency_index"]
    xml.priority    @sitemap_config[k]["prioity"]
  end
  
  @widgets[k].each do |widget|
      xml.url do
        xml.loc         polymorphic_url(widget)
        xml.lastmod     w3c_date(Time.now)
        xml.changefreq  @sitemap_config[k]["frequency_show"]
        xml.priority    @sitemap_config[k]["prioity"]
      end
  end
end

end