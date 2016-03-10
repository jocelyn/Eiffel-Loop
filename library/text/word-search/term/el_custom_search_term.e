note
	description: "Summary description for {EL_CUSTOM_SEARCH_TERM}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2012 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2012-12-16 11:34:32 GMT (Sunday 16th December 2012)"
	revision: "1"

deferred class
	EL_CUSTOM_SEARCH_TERM  [G -> EL_WORD_SEARCHABLE]

inherit
	EL_SEARCH_TERM
		redefine
			Type_target
		end

feature {NONE} -- Implementation

	Type_target: G
			--
		do
		end

end