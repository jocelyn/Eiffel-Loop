note
	description: "Summary description for {EL_WORKER_THREAD}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2013 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"

	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2013-05-30 8:18:40 GMT (Thursday 30th May 2013)"
	revision: "2"

class
	EL_WORKER_THREAD

inherit
	EL_IDENTIFIED_THREAD
		redefine
			log_name
		end

create
	make

feature {NONE} -- Initialization

	make (a_work_action: like work_action)
		do
			make_default
			work_action := a_work_action
		end

feature -- Access

	log_name: STRING
			--
		do
			Result := work_action.target.generator.as_lower
		end

feature {NONE} -- Implementation

	work_action: PROCEDURE [ANY, TUPLE]

	execute
		do
			work_action.apply
		end

end
