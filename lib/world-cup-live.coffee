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

	unless process.env.HUBOT_WORLD_CUP_DEFAULT_ROOM
		robot.logger.warning 'The HUBOT_WORLD_CUP_DEFAULT_ROOM environment variable is not set!'

	doIt = ->
		r {url: FEED_URL, json: true}, (error, response, body) ->
			if error
				console.log error
			if body
				message = buildMessage(body)
				if message != cache
					cache = message
					if message != ''
						robot.messageRoom process.env.HUBOT_WORLD_CUP_DEFAULT_ROOM, message

	setInterval doIt, INTERVAL
