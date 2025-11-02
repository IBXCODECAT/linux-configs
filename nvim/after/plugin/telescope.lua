local builtin = require('telescope.builtin')

-- mapped to "pf" for "Project Find"
vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = 'Find Project Files' })

-- mapped to "ps" for "Project String"
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = 'Find git Files' })
