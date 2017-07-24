require 'telegram/bot'
require 'yaml'

CARS = %w(https://otvet.imgsmail.ru/download/215030284_bf361ada6ac3cecf842d8eaa401f4314_800.jpg http://farm8.static.flickr.com/7656/17346148161_4bbdb70902.jpg 
http://assets.volvocars.com/intl/~/media/shared-assets/images/galleries/inside/our-company/heritage/heritage-models/43_volvo740_sedan_large.jpg?w=480).freeze
PHRASES = %W(#{"Keep calm"} #{"Code in Ruby"}).freeze
MUSIC = {"/home/james/work/bot_archive/Survivor Eye of the Tiger - Eye of the Tiger.mp3" => "CQADAgADMwADUB0gS0rbxrYvbayWAg"}.freeze
                                                                                              
secrets = YAML.load_file('secrets.yml')
token = secrets['token']


Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|
      
  case message.text
  when '/start'
    bot.api.send_message(
      chat_id: message.chat.id,
      text: "Hello, #{message.from.first_name}"
    )
  when '/stop'
    bot.api.send_message(
      chat_id: message.chat.id,
      text: "Bye, #{message.from.first_name}"
    )
  when '/showcar'
    bot.api.send_photo(
      chat_id: message.chat.id,
      photo: CARS.sample
    )
  when '/phrases'
    bot.api.send_message(
      chat_id: message.chat.id,
      text: PHRASES.sample
    )
  when '/music'
    bot.api.send_audio(
      chat_id: message.chat.id,
      audio: 'CQADAgADNQADUB0gS54ER50b-6FQAg'
    )
  when '/help'
    bot.api.send_message(
      chat_id: message.chat.id, 
      text: "/start - start conversation
      /showcar - show photos of automobiles
      /phrases - give you a frase
      /stop - say goodbye to user
      /music - give you a song"
    )
  else
    bot.api.send_message(
      chat_id: message.chat.id, 
      text: "I don't understand what are you talking about."
    )
  end
  
  end
end
