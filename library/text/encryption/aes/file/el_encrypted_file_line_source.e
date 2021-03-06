note
	description: "Reads file lines encrypted using AES cipher blocks chains"

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2016 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2016-07-25 14:56:59 GMT (Monday 25th July 2016)"
	revision: "1"

class
	EL_ENCRYPTED_FILE_LINE_SOURCE

inherit
	EL_FILE_LINE_SOURCE
		rename
			make as make_line_source,
			text_file as encrypted_text_file
		redefine
			encrypted_text_file
		end

create
	make

feature {NONE} -- Initialization

	make (a_file_path: EL_FILE_PATH; a_encrypter: EL_AES_ENCRYPTER)
		do
			make_latin (1, a_file_path)
			encrypted_text_file.set_encrypter (a_encrypter)
		end

feature {EL_LINE_SOURCE_ITERATION_CURSOR} -- Implementation

	encrypted_text_file: EL_ENCRYPTABLE_NOTIFYING_PLAIN_TEXT_FILE

end
