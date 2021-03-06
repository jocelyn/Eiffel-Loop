note
	description: "Summary description for {EL_CREATEABLE_FROM_XPATH_NODE_CONTEXT}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2016 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"

	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2015-01-01 14:15:50 GMT (Thursday 1st January 2015)"
	revision: "1"

deferred class
	EL_CREATEABLE_FROM_XPATH_NODE_CONTEXT

inherit
	EVOLICITY_SERIALIZEABLE_AS_XML

feature -- Initialization

	make_from_xpath_context (root_context: EL_XPATH_ROOT_NODE_CONTEXT)
			--
		deferred
		end

	make
			--
		do
			make_default
		end
end
