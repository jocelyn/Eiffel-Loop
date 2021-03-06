note
	description: "Summary description for {EL_LOGGED_CONSUMER_THREAD}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2016 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"

	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2016-08-27 9:49:05 GMT (Saturday 27th August 2016)"
	revision: "3"

deferred class
	EL_LOGGED_CONSUMER_THREAD [P]

inherit
	EL_CONSUMER_THREAD [P]
		undefine
			on_start
		redefine
			set_waiting, on_continue
		end

	EL_LOGGED_IDENTIFIED_THREAD
		undefine
			stop
		end

feature {NONE} -- Event handling

	on_continue
			-- Continue after waiting
		do
			log.put_line ("received " + ({P}).name + " object")
		end

	set_waiting
			-- Continuous loop to do action that waits to be prompted
		do
			log.put_line ("waiting")
			Precursor
		end

end
