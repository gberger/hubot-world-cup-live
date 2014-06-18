module.exports = (body) ->
	if body and body[0]
		"#{body[0].home_team.code} #{body[0].home_team.goals} x #{body[0].away_team.goals} #{body[0].away_team.code}"
	else
		""
