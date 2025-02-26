--Open up the status window via :Git
--Move between files via <c-n>/<c-p>
--Stage/unstage files via -
--Start committing via cc whilst in the status window
--Create commit message and save and close window. (I prefer :x)
--You can also use zj and zk to move between sections
--Using - on a section will stage/unstage all the files in that section
--For more help with :Git see :h :Git or :G when in the :Git buffer.

vim.keymap.set("n", "<leader>gs", vim.cmd.Git);
vim.keymap.set("n", "<leader>ga", ":Git add .");
vim.keymap.set("n", "<leader>gc", ":Git commit -m ");

