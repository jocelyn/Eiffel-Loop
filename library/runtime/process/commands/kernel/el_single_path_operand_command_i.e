note
	description: "Summary description for {EL_SINGLE_OPERAND_FILE_SYSTEM_COMMAND_I}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2016 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"

	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2016-10-03 9:21:21 GMT (Monday 3rd October 2016)"
	revision: "2"

deferred class
	EL_SINGLE_PATH_OPERAND_COMMAND_I

inherit
	EL_OS_COMMAND_I
		redefine
			make_default
		end

feature {NONE} -- Initialization

	make_default
		do
			create {EL_DIR_PATH} path
			Precursor
		end

	make (a_path: like path)
			--
		do
			make_default
			path := a_path
		end

feature -- Access

	path: EL_PATH

feature -- Element change

	set_path (a_path: like path)
			--
		do
			path := a_path
		end

feature {NONE} -- Evolicity reflection

	getter_function_table: like getter_functions
			--
		do
			create Result.make (<<
				[var_name_path, agent: ZSTRING do Result := path.escaped end]
			>>)
		end

	var_name_path: ZSTRING
		do
			Result := "path"
		end

end
