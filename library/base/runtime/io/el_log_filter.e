note
	description: "Summary description for {EL_LOG_FILTER}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2016 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2016-07-08 17:51:34 GMT (Friday 8th July 2016)"
	revision: "1"

class
	EL_LOG_FILTER

create
	make

feature {NONE} -- Initialization

	make (a_class_type: like class_type; a_routines: STRING)
		local
			routine_list: LIST [STRING]
		do
			class_type := a_class_type
			routine_list := a_routines.split (',')
			create routines.make (1, routine_list.count)
			across routine_list as name loop
				name.item.left_adjust
				routines [name.cursor_index] := name.item
			end
		end

feature -- Access

	class_type: TYPE [EL_MODULE_LIO]

	routines: ARRAY [STRING]

end