note
	description: "Summary description for {GALAXY_TAB_DEVICE}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2016 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2015-10-04 14:00:10 GMT (Sunday 4th October 2015)"
	revision: "1"

class
	SAMSUNG_TABLET_DEVICE

inherit
	STORAGE_DEVICE
		redefine
			adjust_genre
		end

create
	make

feature {NONE} -- Implementation

	adjust_genre (id3_info: EL_ID3_INFO)
			-- Galaxy tab players treats the Tango genre in a weird way (don't remember exactly what, displays as Latin or something)
			-- so change to something else here
		do
			if id3_info.genre ~ Genre_tango then
				id3_info.set_genre ("Tango (Classical)")
			end
		end
end