note
	description: "Windows implementation of EL_VISION_2_GUI_ROUTINES_I interface"

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2016 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2016-06-24 8:50:34 GMT (Friday 24th June 2016)"
	revision: "1"

class
	EL_VISION_2_GUI_ROUTINES_IMP

inherit
	EL_VISION_2_GUI_ROUTINES_I

	EL_OS_IMPLEMENTATION

create
	make

feature -- Access

	Text_field_background_color: EV_COLOR
			--
		local
			system_colors: WEL_SYSTEM_COLORS
			color_window: WEL_COLOR_REF
		once
			create system_colors
			color_window := system_colors.system_color_window
			create Result.make_with_8_bit_rgb (color_window.red, color_window.green, color_window.blue)
		end
end