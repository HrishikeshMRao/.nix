{
  self, ...
}:
{
  programs.nixvim.plugins.telescope = {
	enable = true;
	extensions = {
		ui-select.enable = true;
	};
  };
}
