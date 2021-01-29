require 'telegram/bot'

token = '1623236783:AAH5FSbvWmxbIKNAU4TLvSFHnujyEGyxSa8'

Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|
    case message.text
    when '/start'
      bot.api.sendMessage(chat_id: message.chat.id, text: "Поздравляю, #{message.from.first_name}, ты балбес!")
    end
  end
end
