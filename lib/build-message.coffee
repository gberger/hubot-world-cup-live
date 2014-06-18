module.exports = (body) ->
	buildScore = (match) ->
		"[#{match.home_team.code} #{match.home_team.goals} x #{match.away_team.goals} #{match.away_team.code}]"

	if !body
		""
	else
		body.map(buildScore).join(', ')
