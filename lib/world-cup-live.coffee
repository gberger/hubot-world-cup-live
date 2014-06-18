# Description:
#   Pushes World Cup goals to a chat room.
#   There are no commands -- it acts on its own.
#
# Dependencies:
#   underscore
#
# Configuration:
#   HUBOT_WORLD_CUP_DEFAULT_ROOM
#
# Author:
#   Guilherme Berger

_ = require 'underscore'
r = require 'request'

buildMessage = require './build-message'

FEED_URL = 'http://worldcup.sfg.io/matches/current'
INTERVAL = 30*1000

module.exports = (robot) ->
	cache = ''

	setInterval ->
		r {url: FEED_URL, json: true}, (error, response, body) ->
			if body
				message = buildMessage(body)
				if message != cache
					cache = message
					if message != ''
						robot.messageRoom (process.env.HUBOT_WORLD_CUP_DEFAULT_ROOM || 'FIFA World Cup 2014'), message
	, INTERVAL
