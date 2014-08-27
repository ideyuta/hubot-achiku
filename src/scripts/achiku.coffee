# Description:
#   From Texas!
#
# Configuration:
#   HUBOT_ACHIKU_BOMB_LIMIT - achiku bombの最大数
#   HUBOT_ACHIKU_P - achiku画像返す確率を指定
#
# Commands:
#   hubot achiku - 知久翼画像をランダムに返す
#   hubot achiku bomb N - 知久翼画像をランダムにN個返す
#
# Author:
#   ideyuta

images = require '../data/images.json'

module.exports = (robot) ->

  robot.hear /[^a]chiku|知久|翼|ちく|あきら|チク|アキラ|texas/i, (msg) ->
    p = parseFloat(process.env.HUBOT_ACHIKU_P ? '0.1')
    if Math.random() <= p
      msg.send "@achiku #{msg.random images}"

  robot.respond /achiku$/i, (msg) ->
    msg.send "@achiku #{msg.random images}"

  robot.respond /achiku bomb( (\d+))?/i, (msg) ->
    max = parseInt(process.env.HUBOT_ACHIKU_BOMB_LIMIT ? '10')
    count = msg.match[2] || 3
    if count > max
      msg.reply "achiku bombは#{max}までやで"
    else
      for [1..count]
        msg.send "@achiku #{msg.random images}"
