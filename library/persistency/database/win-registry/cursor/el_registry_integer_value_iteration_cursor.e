note
	description: "Summary description for {EL_REGISTRY_INTEGER_VALUE_ITERATION_CURSOR}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2014-09-02 10:55:12 GMT (Tuesday 2nd September 2014)"
	revision: "2"

class
	EL_REGISTRY_INTEGER_VALUE_ITERATION_CURSOR

inherit
	EL_REGISTRY_VALUE_ITERATION_CURSOR [TUPLE [name: EL_ASTRING; value: INTEGER]]

create
	make

feature -- Access

	item: TUPLE [name: EL_ASTRING; value: INTEGER]
			-- Item at current cursor position.
		do
			create Result
			Result.name := item_name
			Result.value := key_value (Result.name).dword_value
		end
end