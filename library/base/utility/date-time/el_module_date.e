﻿note
	description: "Summary description for {EL_MODULE_DATE}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2014-12-11 14:33:27 GMT (Thursday 11th December 2014)"
	revision: "3"

class
	EL_MODULE_DATE

inherit
	EL_MODULE

feature -- Access

	Date: EL_ENGLISH_DATE_TEXT
			--
		once
			create Result
		end

end