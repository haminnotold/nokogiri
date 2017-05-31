require 'nokogiri'
require 'open-uri'
doc = Nokogiri::HTML(open("http://www.korea.ac.kr/user/restaurantMenuAllList.do?siteId=university&id=university_050402000000"))

for i in [3, 5, 7, 9, 11, 13]

  if i == 3

    day = doc.css(".ku_restaurant//ul//li:nth-child(1)//ol:nth-child(#{i})//span.day").inner_text
    puts day

    date = doc.css(".ku_restaurant//ul//li:nth-child(1)//ol:nth-child(#{i})//span.date//span")[0].inner_text + "/" +doc.css(".ku_restaurant//ul//li:nth-child(1)//ol:nth-child(#{i})//span.date//span")[1].inner_text
    puts date

    breakfast_a = doc.css(".ku_restaurant//ul//li:nth-child(1)//ol:nth-child(#{i})//p")[0].inner_text.split("-")[1]
    puts breakfast_a

    breakfast_b = doc.css(".ku_restaurant//ul//li:nth-child(1)//ol:nth-child(#{i})//div")[0].inner_text.split("-")[1]
    puts breakfast_b

    lunch = doc.css(".ku_restaurant//ul//li:nth-child(1)//ol:nth-child(#{i})//div")[1].inner_text.split("-")[1]
    puts lunch

    dinner = doc.css(".ku_restaurant//ul//li:nth-child(1)//ol:nth-child(#{i})//div")[2].inner_text.split("-")[1]
    puts dinner

  elsif i == 5 || i == 7 || i == 9 
      day = doc.css(".ku_restaurant//ul//li:nth-child(1)//ol:nth-child(#{i})//span.day").inner_text
      puts day

      date = doc.css(".ku_restaurant//ul//li:nth-child(1)//ol:nth-child(#{i})//span.date//span")[0].inner_text + "/" +doc.css(".ku_restaurant//ul//li:nth-child(1)//ol:nth-child(#{i})//span.date//span")[1].inner_text
      puts date

      breakfast_a = doc.css(".ku_restaurant//ul//li:nth-child(1)//ol:nth-child(#{i})//p//span")[0].inner_text.split("-")[1]
      puts breakfast_a

      breakfast_b =       doc.css(".ku_restaurant//ul//li:nth-child(1)//ol:nth-child(#{i})//div")[0].inner_text.split("-")[1]
      puts breakfast_b

      lunch = doc.css(".ku_restaurant//ul//li:nth-child(1)//ol:nth-child(#{i})//div")[1].inner_text.split("-")[1]
      puts lunch

      dinner = doc.css(".ku_restaurant//ul//li:nth-child(1)//ol:nth-child(#{i})//div")[2].inner_text.split("-")[1]
      puts dinner

    else
      day = doc.css(".ku_restaurant//ul//li:nth-child(1)//ol:nth-child(#{i})//span.day").inner_text
      puts day

      date = doc.css(".ku_restaurant//ul//li:nth-child(1)//ol:nth-child(#{i})//span.date//span")[0].inner_text + "/" +doc.css(".ku_restaurant//ul//li:nth-child(1)//ol:nth-child(#{i})//span.date//span")[1].inner_text
      puts date

      breakfast_a = doc.css(".ku_restaurant//ul//li:nth-child(1)//ol:nth-child(#{i})//p//span")[0].inner_text.split("-")[1]
      puts breakfast_a

      lunch = doc.css(".ku_restaurant//ul//li:nth-child(1)//ol:nth-child(#{i})//div")[0].inner_text.split("-")[1]
      puts lunch

      dinner = doc.css(".ku_restaurant//ul//li:nth-child(1)//ol:nth-child(#{i})//div")[1].inner_text.split("-")[1]
      puts dinner
    end

end
