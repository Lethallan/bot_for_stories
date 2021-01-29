require 'telegram/bot'
require_relative 'story'
require_relative '../token'
require_relative '../assets/inline_button'

class Bot
  def initialize
    tg_token = Token.new
    token = tg_token.token

    Telegram::Bot::Client.run(token) do |bot|
      bot.listen do |message|
        case message.text
        when '/start'
          bot.api.send_message(chat_id: message.chat.id, text: "Здравствуй, #{message.from.first_name}. Под этим солнцем и небом я тепло приветствую тебя. ")

        when '/stop'
          bot.api.send_message(chat_id: message.chat.id, text: "Пусть ветер дует тебе в спину, #{message.from.first_name}", date: message.date)

        when '/story'
          values = Story.new
          value = values.select_random
          bot.api.send_message(chat_id: message.chat.id, text: "#{value['text']}", date: message.date)

        else
          bot.api.send_message(chat_id: message.chat.id, text: "Я не понимаю тебя, #{message.from.first_name}, попробуй выражаться более ясно.")
        end
      end
    end
  end
end