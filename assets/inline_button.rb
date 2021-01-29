class Bot
  module Inline_Button
    START = Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Приветствие', callback_data: 'start')
    STORY = Telegram::Bot::Types::InlineKeyboardButton.new(text: 'История', callback_data: 'story')
    STOP = Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Прощание', callback_data: 'stop')
  end
end