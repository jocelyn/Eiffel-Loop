note
	description: "Summary description for {EVOLICITY_SERIALIZEABLE_TEXT_VALUE}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2016 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2016-07-05 5:56:53 GMT (Tuesday 5th July 2016)"
	revision: "1"

class
	EVOLICITY_SERIALIZEABLE_TEXT_VALUE

inherit
	EVOLICITY_SERIALIZEABLE_AS_XML
		redefine
			make_default
		end

	EL_STRING_CONSTANTS

create
	make

feature {NONE} -- Initialization

	make (a_text: ZSTRING)
			--
		do
			make_default
			text := a_text
		end

	make_default
		do
			text := Empty_string
			Precursor
		end

feature -- Access

	text: ZSTRING

feature -- Element change

	set_text (a_text: like text)
		do
			text := a_text
		end

feature {NONE} -- Evolicity reflection

	getter_function_table: like getter_functions
			--
		do
			create Result.make (<<
				["text", agent: ZSTRING do Result := text end]
			>>)
		end

feature {NONE} -- Constants

	Template: READABLE_STRING_GENERAL
		once
			Result := "$text"
		end

end