note
	description: "Summary description for {EL_PANGO_CAIRO_API}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2016 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"

	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2016-10-03 16:20:28 GMT (Monday 3rd October 2016)"
	revision: "3"

class
	EL_PANGO_CAIRO_API

inherit
	EL_DYNAMIC_MODULE [EL_PANGO_CAIRO_API_POINTERS]

	EL_PANGO_CAIRO_I

	EL_PANGO_CAIRO_C_API

create
	make

feature -- Factory

	create_layout (context_ptr: POINTER): POINTER
		do
			Result := pango_cairo_create_layout (api.create_layout, context_ptr)
		end

feature -- Basic operations

	show_layout (context_ptr, layout: POINTER)
		do
			pango_cairo_show_layout (api.show_layout, context_ptr, layout)
		end

	update_layout (context_ptr, layout: POINTER)
		do
			pango_cairo_update_layout (api.update_layout, context_ptr, layout)
		end

feature {NONE} -- Constants

	Module_name: STRING = "libpangocairo-1.0-0"

	Name_prefix: STRING = "pango_cairo_"

end
