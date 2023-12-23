---@diagnostic disable: lowercase-global
ignore = {
	"111", -- setting non-standard global variable
	"121", -- setting reqad-onlu global variable 'vim'
	"122", -- setings read-only field of global variable 'vim'
}

-- Global objects defined by C code
read_globals = {
	"vim",
}
