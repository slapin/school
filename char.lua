function npc(name, data)
	local cp = charstats[name]
	local r = obj {
		nam = cp.name,
		_data = cp,
		_dlg = cp.dlg,
		dsc = function(s)
			local kdsc
			local ukdsc

			if s._data.knowndsc then
				kdsc = s._data.knowndsc
			else
				kdsc = "Я вижу {"..s.nam.."}"
			end
			if s._data.unknowndsc then
				ukdsc = s._data.unknowndsc
			else
				if s._data.class == "female" then
					ukdsc = "Я вижу незнакомую {девушку}."
				elseif  s._data.class == "male" then
					ukdsc = "Я вижу {незнакомца}."
				end
			end


			if s._data.known then
				ldsc = kdsc
			else
				ldsc = ukdsc
			end
			p(ldsc)
			if s._data.firsttime then
				p(s._data.firsttext)
				s._data.firsttime = false
			end
		end,
		act = function(s)
			if s._data.acttext then
				p(s._data.acttext)
			end
			walkin(s._dlg)
		end,
		life = function(s)
			if player_moved() and where(s) ~= s._data.where then
				move(s, s._data.where, where(s))
			end
		end,
	}
	local k, v
	for k, v in pairs(data) do
		r[k] = v
	end
	return r
end
