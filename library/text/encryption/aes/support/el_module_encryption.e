note
	description: "Access to routines for AES encryption and creating SHA or MD5 digests"

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"

	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2014-12-11 14:34:35 GMT (Thursday 11th December 2014)"
	revision: "3"

class
	EL_MODULE_ENCRYPTION

inherit
	EL_MODULE

feature -- Access

	Encryption: EL_ENCRYPTION_ROUTINES
		once
			create Result
		end
end