{
self,...
}:
{
	programs.nixvim = {
		globals = {
			mapleader = " ";
			maplocalleader = " ";
		};
		keymaps = {
			[
	  			{
					action = ":Telescope find_files<CR>";
					key = "<leader>sf";
					options = {
					  silent = true;
					  noremap = true;
					  desc = "Search files";
					};
				}
			]

		};
	};
	}
