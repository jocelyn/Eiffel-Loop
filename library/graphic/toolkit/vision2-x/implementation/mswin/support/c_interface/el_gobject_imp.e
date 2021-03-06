note
	description: "Summary description for {EL_GTK_API}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2016 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"

	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2016-10-03 17:02:18 GMT (Monday 3rd October 2016)"
	revision: "3"

class
	EL_GOBJECT_IMP

inherit
	EL_DYNAMIC_MODULE [EL_GOBJECT_API_POINTERS]

	EL_GOBJECT_C_API

	EL_GOBJECT_I

create
	make

feature -- Disposal

	object_unref (a_object: POINTER)
		do
			g_object_unref (api.object_unref, a_object)
		end

feature {NONE} -- Constants

	Module_name: STRING = "libgobject-2.0-0"

	Name_prefix: STRING = "g_"

end
