note
	description: "Windows implementation of `EL_OPERATING_ENVIRONMENT_I' interface"

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2016 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2016-07-07 15:27:10 GMT (Thursday 7th July 2016)"
	revision: "1"

class
	EL_OPERATING_ENVIRONMENT_IMP

inherit
	EL_OPERATING_ENVIRONMENT_I

	EL_OS_IMPLEMENTATION

feature -- Constants

	Clear_screen_command: STRING = "cls"

	Command_option_prefix: CHARACTER = '/'
		-- Character used to prefix option in command line

	Search_path_separator: CHARACTER = ';'
		-- Character used to separate paths in a directorysearch path on this platform.

	Temp_directory_name: ZSTRING
			--
		local
			environment: EXECUTION_ENVIRONMENT
		once
			create environment
			Result := environment.get ("TEMP")
		end

	Dynamic_module_extension: STRING = "dll"

	C_library_prefix: STRING = ""

feature -- Measurement

	is_root_path (path: STRING): BOOLEAN
			--
		do
			Result := (path @ 1).is_alpha and path @ 2 = ':'
		end

end