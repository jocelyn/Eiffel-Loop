note
	description: "Summary description for {EL_WHITE_SPACE_Z_CHAR_TP}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2016 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2015-12-26 18:41:23 GMT (Saturday 26th December 2015)"
	revision: "1"

class
	EL_WHITE_SPACE_Z_CHAR_TP

inherit
	EL_WHITE_SPACE_CHAR_TP
		redefine
			code_matches
		end

	EL_SHARED_ZCODEC
	
create
	make

feature {NONE} -- Implementation

	code_matches (z_code: NATURAL): BOOLEAN
		do
			if z_code <= 0xFF then
				Result := z_code.to_character_8.is_space
			else
				Result := Precursor (z_code_to_unicode (z_code))
			end
		end
end