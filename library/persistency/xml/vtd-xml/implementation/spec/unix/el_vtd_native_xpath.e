note
	description: "Summary description for {EL_VTD_NATIVE_XPATH}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2014-09-02 10:55:12 GMT (Tuesday 2nd September 2014)"
	revision: "5"

class
	EL_VTD_NATIVE_XPATH

inherit
	TO_SPECIAL [CHARACTER_32]
		export
			{NONE} area
		end

create
	make

feature {NONE} -- Initialization

	make
		do
			share_area ("")
		end

feature -- Element change

	share_area (a_xpath: STRING_32)
		do
			area := a_xpath.area
			area.put ('%U', a_xpath.count)
		end

feature -- Access

	base_address: POINTER
		do
			Result := area.base_address
		end

end
