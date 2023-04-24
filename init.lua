require("chiefgeek")


require('orgmode').setup_ts_grammar()

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
    parser_config.odin = {
        install_info = {
            url = "https://github.com/ap29600/tree-sitter-odin",
            branch = "main",
            files = {"src/parser.c"}
        },
        filetype = "odin",
    }
