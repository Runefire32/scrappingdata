=begin
require 'rubygems'
require 'nokogiri'
require 'open-uri'






def get_all_url
	paage = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
	all_url = paage.css(".lientxt")
	all_url.each do |link|
		puts emails(link['href'])
end
 all_url.css(".lientxt").text 


end






def emails(url)
	page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/" + url))
 links = []
    puts page.css("body > div > main > section:nth-child(2) > div > table > tbody > tr:nth-child(4) > td:nth-child(2)").text

end




get_all_url
=end 

require 'awesome_print'
require 'nokogiri'
require 'open-uri'


def emails(url)

	

    page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/" + url))
    scraper = page.css("body > div > main > section:nth-child(2) > div > table > tbody > tr:nth-child(4) > td:nth-child(2)").text  

end


def get_all_url
    doc = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html")) #pageweb a scrape
    all_url = doc.css(".lientxt") # URLs a chercher = .lientext -> stock dans all_url

    url_list = [] #array pour stocker les url + methode email
	municipality = [] #array pour stocker le nom des villes
    all_url.each do |link| # chaque Url a chercher dans la page
        mail = emails(link['href']) # utilise la methode mail (pour recup mail) avec le href recupérer 
         "{mail}\r" # Pour afficher sur la même ligne chaque mail
        if mail == nil # Si le mail n'est pas renseigné
  			mail = "Email non renseigné" # email = email non renseigné
  			url_list << href # push dans url_list
  		else
   		url_list << mail # si le mail est renseigné, push dans url_list

   		 #emails(link['href']) 
   		# puts email_val
   		end
		end
		#NOM DE LA VILLE
		all_url.each do |city| #cherche dans doc.css(lientxt) 
  		municipality << city.text #push le texte du href dans le hash
  		# puts municipality
  	
		
			# Faire un hash avec nom de ville & email
		  	infos_villes = Hash[municipality.zip(url_list)]
			# affiche le hash avec la gem awesome print a installer
  			ap infos_villes
		
		

end
# all_url.css(".lientxt").text 
puts url_list #afficher le tableau puts url
end

get_all_url