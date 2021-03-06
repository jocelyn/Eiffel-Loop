note
	description: "Summary description for {EL_MODULE_SVG_ROUTINES}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2016 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"

	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2016-10-03 15:54:05 GMT (Monday 3rd October 2016)"
	revision: "4"

class
	EL_IMAGE_UTILS_API

inherit
	EL_DYNAMIC_MODULE [EL_IMAGE_UTILS_API_POINTERS]
		redefine
			make, unload
		end

	EL_IMAGE_UTILS_C_API

create
	make

feature {NONE} -- Initialization

	make
		do
			Precursor
			if is_initialized then
				rsvg_initialize
			end
		end

feature -- Basic operations

	convert_svg_to_png (svg_in_path, png_out_path: POINTER; width, height, background_color: INTEGER): BOOLEAN
		do
			Result := el_image_convert_svg_to_png (api.convert_svg_to_png, svg_in_path, png_out_path, width, height, background_color)
		end

	format_argb_to_abgr (image_data: POINTER; size: INTEGER)
			-- Swap red and blue color channels
		do
			el_image_format_ARGB_to_ABGR (api.format_argb_to_abgr, image_data, size)
		end

	render_svg (svg_image, eiffel_write_procedure: POINTER; width, height, background_color: INTEGER): BOOLEAN
		do
			Result := el_image_render_svg (api.render_svg, svg_image, eiffel_write_procedure, width, height, background_color)
		end

feature -- Factory

	new_svg_image_data (svg_uri: EL_FILE_URI_PATH; svg_utf_8_xml: STRING): MANAGED_POINTER
		local
			encoded_uri: EL_URL_STRING
			base_uri, xml: POINTER
		do
			encoded_uri := svg_uri.to_encoded_utf_8
			base_uri := encoded_uri.area.base_address
			xml := svg_utf_8_xml.area.base_address
			create Result.make (c_sizeof_svg_image_t)
			c_set_svg_base_uri (Result.item, base_uri)
			c_set_svg_data (Result.item, xml)
			c_set_svg_data_count (Result.item, svg_utf_8_xml.count.to_natural_32)
		end

feature -- Cairo operations

	read_cairo_image (file_read_callback: POINTER): POINTER
		do
			Result := el_image_read_cairo_image (api.read_cairo_image, file_read_callback)
		end

	save_cairo_image (image, file_write_callback: POINTER)
		local
			call_status: INTEGER
		do
			call_status := el_image_save_cairo_image (api.save_cairo_image, image, file_write_callback)
		end

feature -- RSVG operations

	rsvg_new_image (svg_image: MANAGED_POINTER): POINTER
		do
			Result := c_rsvg_new_image (api.rsvg_new_image, svg_image.item)
		end

	rsvg_render_to_cairo (handle, cairo_ctx: POINTER): BOOLEAN
		do
			Result := c_rsvg_render_to_cairo (api.rsvg_render_to_cairo, handle, cairo_ctx)
		end

	rsvg_set_dimensions (handle, dimensions: POINTER; width, height: INTEGER)
		do
			c_rsvg_set_dimensions (api.rsvg_set_dimensions, handle, dimensions, width, height)
		end

feature {NONE} -- Implementation

	rsvg_initialize
		do
			c_rsvg_initialize (api.rsvg_initialize)
		end

	rsvg_terminate
		do
			c_rsvg_terminate (api.rsvg_terminate)
		end

	unload
		do
			if is_initialized then
				rsvg_terminate
			end
			Precursor
		end

feature -- Constants

	Module_name: STRING = "elimageutils"

	Name_prefix: STRING = "el_image_"

	Undefined_dimension: INTEGER = -1

end
