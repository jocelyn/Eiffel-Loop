﻿note
	description: "Summary description for {EL_COPY_FILE_IMPL}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2015-09-16 10:02:26 GMT (Wednesday 16th September 2015)"
	revision: "4"

class
	EL_COPY_FILE_IMPL

inherit
	EL_COMMAND_IMPL

create
	make

feature -- Access

	template: STRING =
		--
	"[
		#if $is_recursive then
			xcopy /I /E /Y $source_path $xcopy_destination_path
		#else
			copy $source_path $destination_path
		#end
	]"

end
