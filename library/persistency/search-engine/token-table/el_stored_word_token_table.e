note
	description: "Summary description for {WORD_TOKEN_TABLE}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2016 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"

	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2016-10-05 9:27:15 GMT (Wednesday 5th October 2016)"
	revision: "2"

class
	EL_STORED_WORD_TOKEN_TABLE

inherit
	EL_WORD_TOKEN_TABLE
		redefine
			put, flush
		end

	EL_MODULE_LIO
		undefine
			is_equal, copy
		end

create
	make_from_file, make_empty

feature {NONE} -- Initialization

	make_from_file (a_file_path: EL_FILE_PATH)
		do
			make_empty
			word_file := new_word_file (a_file_path)
		end

	make_empty
		do
			make (100)
			create word_file.make_closed
			create crc
		end

feature -- Element change

	append (a_words: ARRAYED_LIST [ZSTRING])
		do
			from a_words.start until a_words.after loop
				put (a_words.item)
				a_words.forth
			end
		end

	put (a_word: ZSTRING)
			--
		require else
			file_open: is_open
		do
			Precursor (a_word)
			if not found then
				crc.add_string (a_word)
				word_file.put_string (a_word.to_utf_8); word_file.put_new_line
				word_file.notify
			end
		end

	set_word_file_path (a_file_path: EL_FILE_PATH)
		do
			word_file.rename_file (a_file_path)
		end

feature -- Status setting

	open_write
		local
			line: ZSTRING; utf8_line: STRING
		do
			lio.enter ("open_write")
			if word_file.exists then
				crc.reset
				word_file.open_read
				make (word_file.count // 8)
				lio.put_line ("Reading data")
				from until word_file.after loop
					word_file.read_line
					word_file.notify
					utf8_line := word_file.last_string

					-- Look for checksum in format: [999]
					if not utf8_line.is_empty then
						if utf8_line.count > 2 and then utf8_line [1] = '[' and then utf8_line [utf8_line.count] = ']' then
							last_checksum := utf8_line.substring (2, utf8_line.count - 1).to_natural
						else
							create line.make_from_utf_8 (utf8_line)
							extend (count + 1, line)
							words.extend (line)
							crc.add_string (line)
						end
					end
				end
				word_file.close

				if last_checksum = crc.checksum then
					lio.put_line ("open_append")
					word_file.open_append
					is_restored := True
				else
					lio.put_line ("Checksum does not match")
					lio.put_line ("open_write")
					word_file.open_write
					crc.reset; wipe_out; words.wipe_out
				end
				last_code := count
			else
				word_file.open_write
			end
			lio.exit
		end

	close
		do
			if last_checksum /= crc.checksum then
				word_file.put_string ("[" + crc.checksum.out + "]")
				word_file.put_new_line
			end
			word_file.close
		end

	close_and_delete
		do
			close
			word_file.delete
		end

	reopen
		do
			word_file.open_append
		end

feature -- Status query

	is_open: BOOLEAN
		do
			Result := not word_file.is_closed
		end

feature -- Basic operations

	flush
		do
			word_file.flush
		end

feature {NONE} -- Implementation

	new_word_file (a_file_path: EL_FILE_PATH): EL_NOTIFYING_PLAIN_TEXT_FILE
		do
			create Result.make_with_name (a_file_path)
		end

	word_file: like new_word_file

	crc: EL_CYCLIC_REDUNDANCY_CHECK_32

	last_checksum: NATURAL

	data_block_byte_count: INTEGER
		-- bytes read in current data block

end
