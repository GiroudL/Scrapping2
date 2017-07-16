require 'rubygems'
require 'open-uri'
require 'nokogiri'

LIST = []
Base = "http://annuaire-des-mairies.com"


#ajouter un regex avec if pour virer le vide
  def get_the_email_of_a_townhal_from_its_webpage
  regexcontact = /[\w.-]+@[\w-]+\.\w*/
   page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/95/cergy.html"))
   page.xpath('//tr/td/p').each do |node|
   result = node.text
   mails = result.match regexcontact  
     if result.match regexcontact
     puts mails
     else nil   
     end
  end 
end
get_the_email_of_a_townhal_from_its_webpage


def get_all_the_urls_of_val_doise_townhalls(url)

  page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
	news_url = page.css(".lientxt")
	news_url.each do |url| 
    adresse = url['href']

    LIST.push( Base + adresse)
  @name = Base + adresse
  puts @name
  end
end

get_all_the_urls_of_val_doise_townhalls




def on_est_bon
get_all_the_urls_of_val_doise_townhalls

   LIST.each do |page|

   url = Nokogiri::HTML(open(page))
   url.xpath('//tr/td/p').each do |email_g|
   e = email_g.text
   good = e.match(/[\w.-]+@[\w-]+\.\w*/)
       if e.match(/[\w.-]+@[\w-]+\.\w*/) 
       puts good
       else nil   
       end
    LIST.push(good)
  @good = good
   end
  end
end

on_est_bon


=begin



def scrap_all (url)
get_all_the_urls_of_val_doise_townhalls(url)
on_est_bon
end
 scrap_all


def  rangement
@mairies = {}

@mairies[@name] = Hash.new() #parent
@mairies[@name]["adresse:"] = @name #enfant
@mairies[@name]["e:"] = @good #enfant
=begin
@mairies.each do |adresse, good|
puts adresse + " " + good

puts @mairies[@name]
end

#rangement 


=begin
@mairies[@name].each do |:adresse, :e|
puts adresse + " " + e
=end
#.each do |adresse, e|
#puts adresse + " " + e