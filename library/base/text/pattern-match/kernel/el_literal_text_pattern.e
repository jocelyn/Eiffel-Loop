note
	description: "Summary description for {EL_LITERAL_TEXT_PATTERN}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2016 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2015-12-20 14:27:26 GMT (Sunday 20th December 2015)"
	revision: "1"

class
	EL_LITERAL_TEXT_PATTERN

inherit
	EL_TEXT_PATTERN
		redefine
			make_default, match_count
		end

	EL_STRING_CONSTANTS

create
	make_from_string
	-- make_from_string_with_agent

feature {NONE} -- Initialization

	make_default
			--
		do
			Precursor
			text := Empty_string_8
		end

	make_from_string (a_text: like text)
			--
		do
			make_default
			text := a_text
		end

--	make_from_string_with_agent (a_text: like text; a_action: like actions.item)
--			--
--		do
--			make_from_string (a_text)
--			set_action (a_action)
--		end

feature {NONE} -- Implementation

	match_count (a_text: EL_STRING_VIEW): INTEGER
			--
		do
			if a_text.starts_with (text) then
				Result := text.count
			else
				Result := Match_fail
			end
		end

feature -- Element change

	set_text (a_text: like text)
			--
		do
			text := a_text
		end

feature -- Access

	name: STRING
		do
			Result := "''"
			Result.insert_string (text.to_string_8, 2)
		end

	text: READABLE_STRING_GENERAL

end