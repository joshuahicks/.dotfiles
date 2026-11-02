return {
    "numToStr/Comment.nvim",
    config = function()
        require("Comment").setup({
            pre_hook = function(ctx)
                if vim.bo.filetype == "env"
                    and ctx.ctype == require("Comment.utils").ctype.linewise then
                    return "# %s"
                end
            end,
        })
    end
}
