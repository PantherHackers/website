# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts "Currently seeding the PH Site with data from the 2017 hackathon season. If you need to change this,
visit the seeds.rb file in the path ./db/migrate/seeds.rb and change the value of the 'mlh_hackathons_site' to the current
MLH Web page and then update this message. If you are still confused, message kenneth to let him know 'the seeds done broke'"

#Test post information
Blog.create(
	id: 2,
	title: "Test post #1",
	body:
	%Q{### There Is Something You Should Know!

  This is my very first post using markdown!

  How do you like it?  I learned this from [RichOnRails.com](http://richonrails.com/articles/rendering-markdown-with-redcarpet)!}
)


#Hackathon seeding info (INCLUDES WEB SCRAPING)
mlh_hackathons_site = "https://mlh.io/seasons/na-2017/events?utm_source=na-2017&utm_medium=TrustBadge&utm_campaign=na-2017&utm_content=white"
class HackathonTemplate
	def initialize html
		@name = search_html(html, "h3").text

		@logo = search_html(html, 'img')[0]['src']


		@location = html.at('div[itemprop="address"]').text.gsub(/\s+/, "").gsub(',', ', ')


		@date = html.at('meta[itemprop="startDate"]')['content']

		@site = search_html(html, "a")[0]['href']


		@highschool = false
		
		unless (search_html(html, ".ribbon-wrapper").text == "")
			@highschool = true
		end
	end
	def to_s
		"#{@name}, #{@date}, #{@location}, #{@site}, #{@logo}"
	end
	def save
		Hackathon.create(name: @name, logo: @logo, location: @location, date: @date, site: @site, highschool: @highschool)
	end

	private
	def search_html html, details
		html.css(details)
	end
end

hackathon_page = Nokogiri::HTML(HTTParty.get(mlh_hackathons_site).body)
page_divs = hackathon_page.css('div')
hackathon_divs = page_divs[7]

hackathon_html = hackathon_divs.css('div.event')




hackathons = Array.new
hackathon_html.each do |event|
	hackathons << HackathonTemplate.new(event)
end




hackathons.each do |hackathon|
	hackathon.save
end
