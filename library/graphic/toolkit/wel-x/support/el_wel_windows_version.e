note
	description: "Summary description for {EL_WEL_WINDOWS_VERSION}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2016 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"

	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2016-10-20 12:27:17 GMT (Thursday 20th October 2016)"
	revision: "1"

class
	EL_WEL_WINDOWS_VERSION

inherit
	WEL_WINDOWS_VERSION
		redefine
			internal_version
		end

	EL_MODULE_REG_KEY

	EL_MODULE_WIN_REGISTRY

feature {NONE} -- Implementation

	Internal_version: INTEGER
			-- Internal version as returned by Windows.
		local
			major, minor: INTEGER; build_str: STRING_32
		once
			major := Win_registry.integer (Reg_key.Windows_nt.current_version_path, "CurrentMajorVersionNumber")
			if major > 0 then
				-- must be Windows 10 or greater
				minor := Win_registry.integer (Reg_key.Windows_nt.current_version_path, "CurrentMinorVersionNumber")
				build_str := Win_registry.string_32 (Reg_key.Windows_nt.current_version_path, "CurrentBuildNumber")
				Result := (build_str.to_integer |<< 16) | (minor |<< 8) | major
			else
				Result := cwin_get_version
			end
		end

end
