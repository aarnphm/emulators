-- I grabbed this from somewhere, credits to them
local tables = {} -- my "table" stdlib

--- Merge all the given tables into a single one and return it.
tables.merge_all = function(...)
	local ret = {}
	for _, tbl in ipairs { ... } do
		for k, v in pairs(tbl) do
			ret[k] = v
		end
	end
	return ret
end

--- Deep clone the given table.
tables.deepclone = function(original)
	local clone = {}
	for k, v in pairs(original) do
		if type(v) == "table" then
			clone[k] = tables.deepclone(v)
		else
			clone[k] = v
		end
	end
	return clone
end

local is_list = function(t)
	if type(t) ~= "table" then
		return false
	end
	-- a list has list indices, an object does not
	return ipairs(t)(t, 0) and true or false
end

--- Flatten the given list of (item or (list of (item or ...)) to a list of item.
--- (nested lists are supported)
tables.flatten_list = function(list)
	local flattened_list = {}
	for _, item in ipairs(list) do
		if is_list(item) then
			for _, sub_item in ipairs(tables.flatten_list(item)) do
				table.insert(flattened_list, sub_item)
			end
		else
			table.insert(flattened_list, item)
		end
	end
	return flattened_list
end

return tables
