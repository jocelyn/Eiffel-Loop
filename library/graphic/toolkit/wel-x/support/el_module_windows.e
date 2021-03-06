note
	description: "Summary description for {EL_MODULE_WINDOWS}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2016 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"

	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2016-10-17 15:55:42 GMT (Monday 17th October 2016)"
	revision: "1"

class
	EL_MODULE_WINDOWS

feature {NONE} -- Constants

	Windows: EL_WEL_WINDOWS_VERSION
		once ("PROCESS")
			create Result
		end

end
