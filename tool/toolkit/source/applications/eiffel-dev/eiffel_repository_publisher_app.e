note
	description: "[
		**Eiffel-View**, an application for publishing an Eiffel repository to a website. See Eiffel Room articles:
		
		**Part I:** [https://room.eiffel.com/blog/finnianr/part_i_eiffelview_10_the_new_eiffel_repository_publishing_tool Eiffel-View 1.0,
		the new Eiffel repository publishing tool]
		
		**PART II:** [https://room.eiffel.com/blog/finnianr/part_ii_eiffelview_11_the_new_eiffel_repository_publishing_tool Eiffel-View 1.1,
		the new Eiffel repository publishing tool]
	]"

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2016 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2016-07-27 14:43:56 GMT (Wednesday 27th July 2016)"
	revision: "1"

class
	EIFFEL_REPOSITORY_PUBLISHER_APP

inherit
	EL_COMMAND_LINE_SUB_APPLICATION [EIFFEL_REPOSITORY_PUBLISHER]
		redefine
			Option_name
		end

feature {NONE} -- Implementation

	make_action: PROCEDURE [like command, like default_operands]
		do
			Result := agent command.make
		end

	default_operands: TUPLE [config_path: EL_FILE_PATH; version: STRING]
		do
			create Result
			Result.config_path := ""
			Result.version := ""
		end

	argument_specs: ARRAY [like Type_argument_specification]
		do
			Result := <<
				required_existing_path_argument ("config", "Path to publisher configuration file"),
				required_argument ("version", "Repository version number")
			>>
		end

feature {NONE} -- Constants

	Option_name: STRING = "publish_repository"

	Description: STRING = "Publishes an Eiffel repository to a website"

	Log_filter: ARRAY [like Type_logging_filter]
			--
		do
			Result := <<
				[{EIFFEL_REPOSITORY_PUBLISHER_APP}, All_routines],
				[{REPOSITORY_SOURCE_TREE}, All_routines],
				[{REPOSITORY_SOURCE_TREE_PAGE}, All_routines]
			>>
		end

end
