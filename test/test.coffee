assert = require 'assert'
messageBuilder = require '../lib/build-message'

describe 'messageBuilder', ->
	it 'is empty when input is invalid', ->
		assert.equal('', messageBuilder())
		assert.equal('', messageBuilder(null))
		assert.equal('', messageBuilder([]))

	it "is the game's scoreboard", ->
		input =
			[
				{
					home_team: {
						code: "BRA",
						goals: 5
					},
					away_team: {
						code: "ARG",
						goals: 2
					}
				}
			]
		assert.equal('BRA 5 x 2 ARG', messageBuilder(input))
