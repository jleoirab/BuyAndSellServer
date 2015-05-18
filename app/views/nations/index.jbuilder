json.nations @nations do |nation|
	json.(nation, :id, :name)

	json.states nation.states do |state|
		json.(state, :id, :name)
	end
end