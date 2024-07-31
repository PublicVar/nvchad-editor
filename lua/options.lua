require "nvchad.options"

-- add yours here!
local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
local g = vim.g
local api = vim.api
-- Don't wait end of the screen to scroll down/up
o.scrolloff = 10
g.lua_snippets_path = vim.fn.stdpath "config" .. "/lua/snippets"

-- vim.treesitter.language.register("html", { "html", "htmldjango" })

-- Generate UUID
vim.cmd [[
command! -nargs=0 GenerateUUID lua insertUUID()
]]

-- Définir la fonction insertUUID dans Lua
function insertUUID()
  -- Générer un UUID aléatoire
  local random_uuid = vim.fn.system "uuidgen"

  -- Supprimer les caractères de fin de ligne
  random_uuid = string.gsub(random_uuid, "\n", "")

  -- Insérer l'UUID à l'emplacement du curseur
  vim.api.nvim_put({ random_uuid }, "c", true, true)
end
