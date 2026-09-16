-- Encrypt/decrypt Ansible Vault files and inline `!vault` YAML values.
-- No setup() call: credentials come from the ansible.cfg found next to the file
-- (which points at the `.vault-pass` executable), falling back to a prompt.
-- Requires `ansible-vault` on PATH. https://github.com/eyebrowkang/ansible-vault.nvim
return {
  "eyebrowkang/ansible-vault.nvim",
  cmd = {
    "VaultCreate",
    "VaultEncrypt",
    "VaultDecrypt",
    "VaultView",
    "VaultEdit",
    "VaultRekey",
  },
  keys = {
    { "<leader>vv", "<cmd>VaultView<cr>",    desc = "Vault view" },
    { "<leader>ve", "<cmd>VaultEdit<cr>",    desc = "Vault edit" },
    { "<leader>vd", "<cmd>VaultDecrypt<cr>", desc = "Vault decrypt" },
    { "<leader>vE", "<cmd>VaultEncrypt<cr>", desc = "Vault encrypt" },
    -- `:` in visual mode passes the selection along as a range, which the
    -- inline-value variants of these commands need.
    { "<leader>vv", ":VaultView<cr>",        desc = "Vault view value",    mode = "x", silent = true },
    { "<leader>ve", ":VaultEdit<cr>",        desc = "Vault edit value",    mode = "x", silent = true },
    { "<leader>vd", ":VaultDecrypt<cr>",     desc = "Vault decrypt value", mode = "x", silent = true },
    { "<leader>vE", ":VaultEncrypt<cr>",     desc = "Vault encrypt value", mode = "x", silent = true },
  },
  -- `init` runs at startup even though the plugin itself stays lazy; the
  -- :VaultEdit below is what actually loads it.
  init = function()
    -- Offer to open the plaintext editing session when a whole-file vault is
    -- read. Set vim.g.ansible_vault_auto_edit = false to turn this off.
    vim.api.nvim_create_autocmd("BufReadPost", {
      group = vim.api.nvim_create_augroup("AnsibleVaultAutoEdit", { clear = true }),
      callback = function(ev)
        if vim.g.ansible_vault_auto_edit == false then
          return
        end

        -- The plaintext buffer :VaultEdit opens is named `ansible-vault://…`,
        -- and the `edit!` the plugin runs after a successful save re-fires this
        -- event on the original file. A buffer-local flag survives that reload,
        -- so each buffer is only ever asked once.
        if vim.b[ev.buf].ansible_vault_asked or vim.bo[ev.buf].buftype ~= "" then
          return
        end

        local first = vim.api.nvim_buf_get_lines(ev.buf, 0, 1, false)[1]
        if not first or not first:match("^%$ANSIBLE_VAULT") then
          return
        end
        vim.b[ev.buf].ansible_vault_asked = true

        -- Deferred: prompting inside the autocmd would block the read.
        vim.schedule(function()
          if not vim.api.nvim_buf_is_valid(ev.buf) or vim.api.nvim_get_current_buf() ~= ev.buf then
            return
          end
          local name = vim.fn.fnamemodify(ev.file, ":t")
          if vim.fn.confirm("Decrypt " .. name .. "?", "&Yes\n&No", 2) == 1 then
            vim.cmd("VaultEdit")
          end
        end)
      end,
    })
  end,
}
