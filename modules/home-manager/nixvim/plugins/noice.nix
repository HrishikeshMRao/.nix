{
programs.nixvim.plugins.noice = {
	enable = true;
	settings = {
		messages.enable = false;
		popupmenu.enable = false;
		notify.enable = false;
		cmdline.enable = true;
		lsp = {
			progress.enabled = false;
			override = {
			  "cmp.entry.get_documentation" = true;
			  "vim.lsp.util.convert_input_to_markdown_lines" = true;
			  "vim.lsp.util.stylize_markdown" = true;
			};
			hover = {
				enabled = true;

			};

		};
		markdown = {
			highlights = {
			  "@%S+" = "@parameter";
			  "^%s*(Parameters:)" = "@text.title";
			  "^%s*(Return:)" = "@text.title";
			  "^%s*(See also:)" = "@text.title";
			  "{%S-}" = "@parameter";
			  "|%S-|" = "@text.reference";
			};
			hover = {
			  "%[.-%]%((%S-)%)" = {
			    __raw = "require('noice.util').open";
			  };
			  "|(%S-)|" = {
			    __raw = "vim.cmd.help";
			  };
			};
		};
	};
};
}
