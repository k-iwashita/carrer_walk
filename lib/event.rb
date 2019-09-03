# require 'mechanize'

class Events
  def self.connpass_urls
    url = "https://connpass.com/search/?q=&start_from=2019%2F07%2F20&start_to=2020%2F01%2F05&prefectures=osaka&selectItem=osaka"
    links = []
    agent = Mechanize.new
    page = agent.get(url)
    elements = page.search('.summary')
    elements.each do |ele|
      links << ele[:href]
    end
    links.each do |link|
      get_event(link)
    end
  end

  def self.get_event(link)
    begin
      agent = Mechanize.new
      page = agent.get(link)
      title = page.at('.event_title').inner_text
      image = page.at('.event_header_area a')[:href] if page.at('.event_header_area a')
      location = page.at('.adr').inner_text if page.at('.adr')
      date = page.at('.ymd').inner_text if page.at('.ymd')

      event = Event.where(url: link).first_or_initialize
      event.title = title
      event.image = image
      event.location = location
      event.date = date
      event.save
    rescue => e
      puts e
    end
  end

  def self.techplay_urls
    url = "https://techplay.jp/event/search?keyword=&pref=27&from="
    links = []
    agent = Mechanize.new
    page = agent.get(url)
    elements = page.search('.title h3 a')
    elements.each do |ele|
      links << ele[:href]
    end
    links.each do |link|
      get_techplay(link)
    end
  end

  def self.get_techplay(link)
    begin
      agent = Mechanize.new
      page = agent.get(link)
      title = page.at('.title-heading h1').inner_text if page.at('.title-heading h1')
      image = page.at('.image img')[:src] if page.at('.image img')
      location = page.at('//*[@id="mainContentArea"]/div[1]/div[2]/div[2]/div[1]/dl[2]/dd').inner_text if page.at('//*[@id="mainContentArea"]/div[1]/div[2]/div[2]/div[1]/dl[2]/dd')
      date = page.at('.eventAside-day')[:datetime] if page.at('.eventAside-day')

      event = Event.where(url: link).first_or_initialize
      event.title = title
      event.image = image
      event.location = location
      event.date = date
      event.save
    rescue => e
      puts e
    end
  end

  def self.doorkeeper_urls
    url = "https://www.doorkeeper.jp/prefectures/osaka/events"
    links = []
    agent = Mechanize.new
    page = agent.get(url)
    elements = page.search('.events-list-item-title a')
    elements.each do |ele|
      links << ele[:href]
    end
    links.each do |link|
      get_doorkeeper(link)
    end
  end

  def self.get_doorkeeper(link)
    begin
      agent = Mechanize.new
      page = agent.get(link)
      title = page.at('.community-content-title').inner_text if page.at('.community-content-title')
      image = page.at('.event-main-visual')[:src] if page.at('.event-main-visual')
      location = page.at('.community-event-venue-map span').inner_text if page.at('.community-event-venue-map span')
      date = page.at('.community-event-info-date').inner_text if page.at('.community-event-info-date')

      event = Event.where(url: link).first_or_initialize
      event.title = title
      event.image = image
      event.location = location
      event.date = date
      event.save
    rescue => e
      puts e
    end
  end

  # def self.peatix_urls
  #   url = "https://peatix.com/search?country=JP&l.ll=34.6413315%2C135.5629394&l.text=%E5%A4%A7%E9%98%AA%E5%BA%9C&p=1&size=10&v=3.4&dr="
  #   links = []
  #   agent = Mechanize.new
  #   page = agent.get(url)
  #   elements = page.search('.event-list__medium .event-thumb_link')
  #   elements.each do |ele|
  #     links << ele[:href]
  #   end
  #   puts links
  #   links.each do |link|
  #     get_peatix(link)
  #   end
  # end

  # def self.get_peatix(link)
  #   agent = Mechanize.new
  #   page = agent.get(link)
  #   title = page.at('.event-name-ttl').inner_text if page.at('.event-name-ttl')
  #   image = page.at('.event-main-visual')[:src] if page.at('.event-main-visual')
  #   location = page.at('#field-event-venue_name a').inner_text if page.at('#field-event-venue_name a')
  #   date = page.at('#field-event-datetime').inner_text if page.at('#field-event-datetime')

  #   event = Event.where(url: link).first_or_initialize
  #   event.title = title
  #   event.image = image
  #   event.location = location
  #   event.date = date
  #   event.save
  # end
end

Events.connpass_urls
Events.techplay_urls
Events.doorkeeper_urls