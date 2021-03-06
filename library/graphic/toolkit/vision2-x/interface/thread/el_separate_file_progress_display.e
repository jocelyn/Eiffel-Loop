note
	description: "[
		File progress display that forwards calls from a monitored thread separate to main GUI thead
	]"

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2016 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"

	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2016-10-13 11:43:49 GMT (Thursday 13th October 2016)"
	revision: "1"

class
	EL_SEPARATE_FILE_PROGRESS_DISPLAY

inherit
	EL_FILE_PROGRESS_DISPLAY

	EL_MODULE_GUI

create
	make

feature {NONE} -- Initialization

	make (a_display: like display)
		do
			display := a_display
		end

feature {EL_NOTIFYING_FILE, EL_SHARED_FILE_PROGRESS_LISTENER} -- Event handling

	on_finish
		do
			call (agent display.on_finish)
		end

	on_start (bytes_per_tick: INTEGER)
		do
			call (agent display.on_start (bytes_per_tick))
		end

feature -- Basic operations

	set_identified_text (id: INTEGER; a_text: ZSTRING)
		do
			call (agent display.set_identified_text (id, a_text))
		end

	set_progress (proportion: DOUBLE)
		do
			call (agent display.set_progress (proportion))
		end

feature {NONE} -- Implementation

	call (an_action: PROCEDURE [ANY, TUPLE])
		do
			GUI.do_once_on_idle (an_action)
		end

	display: EL_FILE_PROGRESS_DISPLAY
		-- GUI display display
end
