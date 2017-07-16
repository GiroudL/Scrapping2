require 'rubygems'
require 'open-uri'
require 'nokogiri'

def cours_cryptomonnaies
page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
  cours = page.css('.price')
  prix = cours.each do |dollar_usd| 
  result = dollar_usd.text
  puts result 
  end
end
   
cours_cryptomonnaies

def monnaies
page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
  nom = page.css('td.currency-name a')
  nom.each do |url| 
  result2 = url['href']
  puts result2
  end
end

monnaies

beau_tableau = {}
beau_tableau.store (result,result2)


puts beau_tableau
