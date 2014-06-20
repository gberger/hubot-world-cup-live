assert = require 'assert'
messageBuilder = require '../lib/build-message'

describe 'messageBuilder', ->
	it 'is empty when input is invalid', ->
		assert.equal('', messageBuilder())
		assert.equal('', messageBuilder(null))
		assert.equal('', messageBuilder([]))

	it "is the game's scoreboard when there is one game", ->
		body =
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
		assert.equal('[BRA 5 x 2 ARG]', messageBuilder(body))

	it "displays many games", ->
		body =
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
				},
				{
					home_team: {
						code: "USA",
						goals: 0
					},
					away_team: {
						code: "ITA",
						goals: 9
					}
				}
			]
		assert.equal('[BRA 5 x 2 ARG], [USA 0 x 9 ITA]', messageBuilder(body))
