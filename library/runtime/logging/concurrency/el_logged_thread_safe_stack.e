note
	description: "Summary description for {EL_LOGGED_THREAD_SAFE_STACK}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2016 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2016-07-02 10:20:26 GMT (Saturday 2nd July 2016)"
	revision: "1"

class
	EL_LOGGED_THREAD_SAFE_STACK [G]

inherit
	EL_THREAD_SAFE_STACK [G]
		undefine
			restrict_access
		redefine
			removed_item, put
		end

	EL_LOGGED_SINGLE_THREAD_ACCESS
		undefine
			is_equal, copy
		end

create
	make

feature -- Removal

	removed_item: G
			-- Same as 'removed_item' but logged
		do
			log.enter ("removed_item")
			restrict_access
				Result := stack_item
				stack_remove
				log.put_line (Result.out)
			end_restriction
			log.exit
		end

feature -- Element change

	put (v: G)
			-- Same as 'put' but logged
		do
			log.enter ("put")
			restrict_access
				log.put_line (v.out)
				stack_put (v)
			end_restriction
			log.exit
		end
end