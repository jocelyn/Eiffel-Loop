note
	description: "Summary description for {EL_GENERAL_COMMAND_IMPL}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2013 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2013-06-18 8:35:00 GMT (Tuesday 18th June 2013)"
	revision: "2"

class
	EL_GENERAL_COMMAND_IMPL

inherit
	EL_COMMAND_IMPL

feature -- Access

	program_path: EL_FILE_PATH
		once
		end

feature -- Basic operations

	set_arguments (command: EL_OS_COMMAND [like Current]; arguments: EL_COMMAND_ARGUMENT_LIST)
			-- call back arguments
		do
		end

end