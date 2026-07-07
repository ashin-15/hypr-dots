-- Look and feel configuration

hl.config({
	general = {
		gaps_in = 3,
		gaps_out = 8,
		border_size = 2,
		extend_border_grab_area = 10,
		resize_on_border = true,
		col = {
			active_border = {
				colors = { "rgba(bb9af7ff)", "rgba(b4f9f8ff)" },
				angle = 45,
			},
			inactive_border = {
				colors = { "rgba(565f89cc)", "rgba(9aa5cecc)" },
				angle = 45,
			},
		},
	},
	group = {
		col = {
			border_active = {
				colors = { "rgba(bb9af7ff)", "rgba(b4f9f8ff)" },
				angle = 45,
			},
			border_inactive = {
				colors = { "rgba(565f89cc)", "rgba(9aa5cecc)" },
				angle = 45,
			},
			border_locked_active = {
				colors = { "rgba(bb9af7ff)", "rgba(b4f9f8ff)" },
				angle = 45,
			},
			border_locked_inactive = {
				colors = { "rgba(565f89cc)", "rgba(9aa5cecc)" },
				angle = 45,
			},
		},
	},
	decoration = {
		dim_special = 0.3,
		rounding = 10,
		active_opacity = 0.95,
		inactive_opacity = 0.85,
		fullscreen_opacity = 1,
		blur = {
			size = 5,
			passes = 4,
			special = true,
		},
	},
})
