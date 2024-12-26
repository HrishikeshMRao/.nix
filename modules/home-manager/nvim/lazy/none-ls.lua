      local null_ls = require("null-ls")

      null_ls.setup({
        debug = true,
        sources = {
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.diagnostics.pylint,
          null_ls.builtins.formatting.clang_format,
	  --require("none-ls.diagnostics.cpplint"),
          null_ls.builtins.formatting.black,
          null_ls.builtins.formatting.isort,
          null_ls.builtins.formatting.nixfmt,
          null_ls.builtins.diagnostics.statix,
        },
      })

      vim.diagnostic.config({
        -- update_in_insert = true,
        float = {
          focusable = false,
          style = "minimal",
          border = "rounded",
          source = "always",
          header = "",
          prefix = "",
        },
      })
