require 'rubygems'
require 'nokogiri'   
require 'open-uri'
@all_cours = []
@all_name = []


def cryptocours
page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
courscryp = page.css("a.price").each do |cours|
cours = cours.text
	@all_cours << cours
end
end
		cryptocours


def cryptonames
	page2 = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
	page2.css("a.currency-name-container.link-secondary").each do |names|
	


		names = names.text
		@all_name << names
	
end

end
cryptonames

def perform 
		allinfo = Hash[@all_name.zip(@all_cours)]
			puts allinfo
end
		perform
