﻿note
	description: "Summary description for {M3U_PLAYLIST}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2015-12-16 9:34:22 GMT (Wednesday 16th December 2015)"
	revision: "5"

class
	M3U_PLAYLIST_READER

inherit
	LINKED_LIST [EL_PATH_STEPS]
		rename
			make as make_list,
			item as path_steps
		end

	EL_PLAIN_TEXT_LINE_STATE_MACHINE
		rename
			make as make_machine
		undefine
			is_equal, copy
		end

	EL_MODULE_UTF
		undefine
			is_equal, copy
		end

create
	make

feature {NONE} -- Initialization

	make (a_file_path: EL_FILE_PATH)
			-- Build object from xml file
		local
			lines: EL_FILE_LINE_SOURCE
		do
			make_list; make_machine

			if a_file_path.exists then
				if a_file_path.extension ~ "m3u8" then
					create {EL_UTF_8_FILE_LINES} lines.make (a_file_path)
				else
					create lines.make (a_file_path)
				end
				do_once_with_file_lines (agent find_extinf, lines)
			end
			name := a_file_path.without_extension.base
		end

feature -- Access

	name: ZSTRING

feature {NONE} -- State line procedures

	find_extinf (line: ZSTRING)
			--
		do
			if line.starts_with_general ("#EXTINF") then
				state := agent find_path_entry
			end
		end

	find_path_entry (line: ZSTRING)
			--
		local
			l_path: EL_FILE_PATH
		do
			if not line.is_empty then
				l_path := line
				extend (l_path.steps)
				state := agent find_extinf
			end
		end

end
