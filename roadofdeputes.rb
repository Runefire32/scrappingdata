require 'rubygems'
require 'nokogiri'   
require 'open-uri'

@all_firstnames = []
@all_lastnames = []
@all_emails = []



def firstname
page1 = Nokogiri::XML(open("https://www.nosdeputes.fr/deputes/enmandat/xml"))
page1.css('prenom').each do |prenoms|
prenoms = prenoms.text
@all_firstnames << prenoms

end
end

firstname

def lastname
page2 = Nokogiri::XML(open("https://www.nosdeputes.fr/deputes/enmandat/xml"))
page2.css('nom_de_famille').each do |nomsdf|
nomsdf = nomsdf.text
@all_lastnames << nomsdf

end
end
lastname


def emails
page3 = Nokogiri::XML(open("https://www.nosdeputes.fr/deputes/enmandat/xml"))
page3.css('email[1]').each do |mails|
mails = mails.text
@all_emails << mails

end
end
emails

def perform 
	all_info = @all_firstnames.zip(@all_lastnames,@all_emails)
	puts all_info
end
perform