note
	description: "Web connection"

	notes: "[
		Using a shared web connection did not work well when tested, but maybe this
		problem will have been resolved with the changes of Sep 2016 to fix the underlying C API.
	]"

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2016 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"

	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2016-09-28 8:10:00 GMT (Wednesday 28th September 2016)"
	revision: "3"

class
	EL_MODULE_WEB

feature -- Access

	Web: EL_HTTP_CONNECTION
		once
			create Result.make
		end

end
