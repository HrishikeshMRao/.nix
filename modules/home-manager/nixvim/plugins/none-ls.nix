{
programs.nixvim.plugins.none-ls = {
	enable = true;
	settings = {
		debug = true;		
	};
	sources = {
		diagnostics = {
			pylint.enable = true;
			statix.enable = true;
			cppcheck.enable = true;
		};
		formatting = {
			stylua.enable = true;
			clang_format.enable = true;
			black.enable = true;
			isort.enable = true;
			nixfmt.enable = true;
		};
		code_actions = {
			statix.enable = true;
		};
		hover = {
			dictionary.enable = true;
			printenv.enable = true;
		};
		completion = {
			luasnip.enable = true;
			nvim_snippets.enable = true;
		};
	};

};
}
