note
	description: "Summary description for {EL_SCREEN}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2016 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"

	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2016-10-08 16:21:15 GMT (Saturday 8th October 2016)"
	revision: "2"

class
	EL_SCREEN

inherit
	EV_SCREEN
		export
			{NONE} pixel_color_relative_to -- Doesn't work on Windows
		redefine
			implementation, create_implementation
		end

create
	default_create

feature -- Access

	widget_pixel_color (a_widget: EV_WIDGET; a_x, a_y: INTEGER): EV_COLOR
		do
			if attached {EV_WIDGET_IMP} a_widget.implementation as widget_impl then
				Result := implementation.widget_pixel_color (widget_impl, a_x, a_y)
			else
				create Result
			end
--		ensure
--			same_color: pixel_color_relative_to (a_widget, a_x, a_y) ~ Result
			-- (May 2013) Ok on Linux Mint, failed on Windows 7
		end

feature {EV_ANY, EV_ANY_I} -- Implementation

	implementation: EL_SCREEN_I
			-- Responsible for interaction with native graphics toolkit.

feature {NONE} -- Implementation

	create_implementation
			-- See `{EV_ANY}.create_implementation'.
		do
			create {EL_SCREEN_IMP} implementation.make
		end

end
