note
	description: "Summary description for {EL_DIR_URI_PATH}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2016 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"

	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2016-08-06 8:20:48 GMT (Saturday 6th August 2016)"
	revision: "2"

class
	EL_DIR_URI_PATH

inherit
	EL_DIR_PATH
		undefine
			default_create, make_from_other, is_equal, is_less, make, is_uri, is_path_absolute,
			to_string, Type_parent, hash_code, Separator
		redefine
			Type_file_path
		end

	EL_URI_PATH
		undefine
			has_step
		end

create
	default_create, make, make_from_unicode, make_from_latin_1, make_from_path, make_from_dir_path

convert
	make ({ZSTRING}),
	make_from_latin_1 ({STRING}),
	make_from_unicode ({STRING_32}),
	make_from_path ({PATH}),
	make_from_dir_path ({EL_DIR_PATH}),

 	to_string: {ZSTRING}, unicode: {READABLE_STRING_GENERAL}, steps: {EL_PATH_STEPS}, to_path: {PATH}

feature {NONE} -- Initialization

	make_from_dir_path (a_path: EL_DIR_PATH)
		require
			absolute: a_path.is_absolute
		do
			if {PLATFORM}.is_windows then
				make (Forward_slash + a_path.as_unix.to_string)
			else
				make (a_path.to_string)
			end
		end

feature {NONE} -- Type definitions

	Type_file_path: EL_FILE_URI_PATH
		once
		end

end
