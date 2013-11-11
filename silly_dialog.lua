s = "Привет!||Здравствуй"
function build_phr(ss)
	local r, t
	r = {}
	if ss:sub(1, 1) == "*" then
		table.insert(r, false)
	end
	if ss:sub(2, 2) == "=" then
		r.always = true
	end
	for t in ss:gmatch("[^\|][^\|]") do
		table.insert(r, t)
	end
	return r
end

print(build_phr(s))

