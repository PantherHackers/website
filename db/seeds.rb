# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
class Hackathon
	def initialize html
		att_accessor @name = search_html(html, "h3").text


		@logo = search_html(html, 'img')[0]['src']


		@location = search_html(html, "p")[1].text


		@date = search_html(html, "p")[0].text


		@site = search_html(html, "a")[0]['href']


		@highschool = false
		
		unless (search_html(html, ".ribbon-wrapper").text == "")
			@highschool = true
		end
	end

	def to_s
		schema = %w[name logo location date site highschool]
		seed_line = "Hackathon.create("
		seed_line += seed_ify(schema[0], @name) + ", "
		seed_line += seed_ify(schema[1], @logo) + ", "
		seed_line += seed_ify(schema[2], @location) + ", "
		seed_line += seed_ify(schema[3], @date) + ", "
		seed_line += seed_ify(schema[4], @site) + ", "
		seed_line += seed_ify(schema[5], @highschool) + ")"
	end

	private
	def search_html html, details

		html.css(details)
	end
	def seed_ify schema, value
		"#{schema}: '" + value.to_s + "'"
	end
end

hackathon_page = Nokogiri::HTML(HTTParty.get("https://mlh.io/seasons/s2016/events"))
page_divs = hackathon_page.css('div')
hackathon_divs = page_divs[7]

hackathon_html = hackathon_divs.css('div.event')

hackathons = Array.new
hackathon_html.each do |event|
	hackathons << Hackathon.new(event)
end


hackathons.each do |hackathon|
	unless Hackathon.find_by()