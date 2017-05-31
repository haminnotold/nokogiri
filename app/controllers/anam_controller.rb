class AnamController < ApplicationController
  require 'nokogiri'
  require 'open-uri'
  def index
      @mon = Anamhaksick.find_by_day("월")
      @tue = Anamhaksick.find_by_day("화")
      @wed = Anamhaksick.find_by_day("수")
      @thu = Anamhaksick.find_by_day("목")
      @fri = Anamhaksick.find_by_day("금")
      @sat = Anamhaksick.find_by_day("토")
  end

  def get_anam
    doc = Nokogiri::HTML(open("http://www.korea.ac.kr/user/restaurantMenuAllList.do?siteId=university&id=university_050402000000"))

    for i in [3, 5, 7, 9, 11, 13]
      anam = Anamhaksick.new
      if i == 3

        day = doc.css(".ku_restaurant//ul//li:nth-child(1)//ol:nth-child(#{i})//span.day").inner_text
        anam.day = day

        date = doc.css(".ku_restaurant//ul//li:nth-child(1)//ol:nth-child(#{i})//span.date//span")[0].inner_text + "/" +doc.css(".ku_restaurant//ul//li:nth-child(1)//ol:nth-child(#{i})//span.date//span")[1].inner_text
        anam.date = date

        breakfast_a = doc.css(".ku_restaurant//ul//li:nth-child(1)//ol:nth-child(#{i})//p")[0].inner_text.split("-")[1]
        anam.breakfast_a = breakfast_a

        breakfast_b = doc.css(".ku_restaurant//ul//li:nth-child(1)//ol:nth-child(#{i})//div")[0].inner_text.split("-")[1]
        anam.breakfast_b = breakfast_b

        lunch = doc.css(".ku_restaurant//ul//li:nth-child(1)//ol:nth-child(#{i})//div")[1].inner_text.split("-")[1]
        anam.lunch = lunch

        dinner = doc.css(".ku_restaurant//ul//li:nth-child(1)//ol:nth-child(#{i})//div")[2].inner_text.split("-")[1]
        anam.dinner = dinner

        elsif i == 5 || i == 7 || i == 9
          day = doc.css(".ku_restaurant//ul//li:nth-child(1)//ol:nth-child(#{i})//span.day").inner_text
          anam.day = day

          date = doc.css(".ku_restaurant//ul//li:nth-child(1)//ol:nth-child(#{i})//span.date//span")[0].inner_text + "/" +doc.css(".ku_restaurant//ul//li:nth-child(1)//ol:nth-child(#{i})//span.date//span")[1].inner_text
          anam.date = date

          breakfast_a = doc.css(".ku_restaurant//ul//li:nth-child(1)//ol:nth-child(#{i})//p//span")[0].inner_text.split("-")[1]
          anam.breakfast_a = breakfast_a

          breakfast_b = doc.css(".ku_restaurant//ul//li:nth-child(1)//ol:nth-child(#{i})//div")[0].inner_text.split("-")[1]
          anam.breakfast_b = breakfast_b

          lunch = doc.css(".ku_restaurant//ul//li:nth-child(1)//ol:nth-child(#{i})//div")[1].inner_text.split("-")[1]
          anam.lunch = lunch

          dinner = doc.css(".ku_restaurant//ul//li:nth-child(1)//ol:nth-child(#{i})//div")[2].inner_text.split("-")[1]
          anam.dinner = dinner

        else
          day = doc.css(".ku_restaurant//ul//li:nth-child(1)//ol:nth-child(#{i})//span.day").inner_text
          anam.day = day

          date = doc.css(".ku_restaurant//ul//li:nth-child(1)//ol:nth-child(#{i})//span.date//span")[0].inner_text + "/" +doc.css(".ku_restaurant//ul//li:nth-child(1)//ol:nth-child(#{i})//span.date//span")[1].inner_text
          anam.date = date

          breakfast_a = doc.css(".ku_restaurant//ul//li:nth-child(1)//ol:nth-child(#{i})//p//span")[0].inner_text.split("-")[1]
          anam.breakfast_a = breakfast_a

          lunch = doc.css(".ku_restaurant//ul//li:nth-child(1)//ol:nth-child(#{i})//div")[0].inner_text.split("-")[1]
          anam.lunch = lunch

          dinner = doc.css(".ku_restaurant//ul//li:nth-child(1)//ol:nth-child(#{i})//div")[1].inner_text.split("-")[1]
          anam.dinner = dinner
        end
        anam.save
    end
    redirect_to '/'
  end
end
