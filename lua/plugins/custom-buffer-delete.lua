local actions = {}
actions.this = function() end
actions.other = function() end
actions.all = function() end

local sources = {
  [actions] = true,
}

local function second_option(arglead)
  local matches = {}
  if vim.startswith("force", arglead) then
    table.insert(matches, "force")
  end
  return matches
end

local CP = {}
CP.this = second_option
CP.other = second_option
CP.all = second_option

local get_cmp_func = function(name)
  return CP[name]
end

vim.api.nvim_create_user_command("Bd", function(params)
  local args = params.args

  if args == "this" then
    vim.api.nvim_command("silent! bd")
  elseif args == "this force" then
    vim.api.nvim_command("silent! bd!")
  elseif args == "other" then
    vim.api.nvim_command("silent! %bd | e#")
  elseif args == "other force" then
    vim.api.nvim_command("silent! %bd! | e#")
  elseif args == "all" then
    vim.api.nvim_command("silent! %bd")
  elseif args == "all force" then
    vim.api.nvim_command("%bd!")
  end
end, {
  force = true,
  nargs = "*",
  range = true,
  complete = function(arglead, line)
    local words = vim.split(line, "%s+")
    local n = #words

    local matches = {}

    if n == 2 then
      for m, _ in pairs(sources) do
        for func, _ in pairs(m) do
          if not func:match("^[a-z]") then
          --exclude
          elseif vim.startswith(func, arglead) then
            table.insert(matches, func)
          end
        end
      end
    elseif n > 2 then
      local cmp_func = get_cmp_func(words[2])
      if cmp_func then
        return cmp_func(arglead)
      end
    end
    return matches
  end,
})

return {}
