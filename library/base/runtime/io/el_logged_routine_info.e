note
	description: "Summary description for {EL_LOGGED_ROUTINE_INFO}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2016 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2016-07-08 9:13:12 GMT (Friday 8th July 2016)"
	revision: "1"

class
	EL_LOGGED_ROUTINE_INFO

create
	make

feature {NONE} -- Initialization

	make (a_id, a_class_type_id: INTEGER; a_name, a_class_name: STRING)
		do
			id := a_id; class_type_id := a_class_type_id; name := a_name; class_name := a_class_name
		end

feature -- Access

	class_name: STRING

	class_type_id: INTEGER

	id: INTEGER

	name: STRING

end