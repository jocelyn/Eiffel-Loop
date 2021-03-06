note
	description: "Summary description for {EL_EIFFEL_LINE_STATE_MACHINE_TEXT_FILE_EDITOR}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2016 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"

	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2016-08-06 15:08:32 GMT (Saturday 6th August 2016)"
	revision: "1"

deferred class
	EL_EIFFEL_LINE_STATE_MACHINE_TEXT_FILE_EDITOR

inherit
	EL_LINE_STATE_MACHINE_TEXT_FILE_EDITOR
		undefine
			is_bom_enabled
		redefine
			new_input_lines
		end

	EL_EIFFEL_SOURCE_EDITOR
		undefine
			make_default, edit
		end

feature {NONE} -- Implementation

	new_input_lines (a_file_path: like file_path): EL_FILE_LINE_SOURCE
		do
			create Result.make_latin (1, a_file_path)
		end

end
