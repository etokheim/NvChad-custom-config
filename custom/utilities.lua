local M = {}

function M.get_keyboard_layout()

  local env_keyboard_layout = os.getenv("KEYBOARD_LAYOUT")

  if env_keyboard_layout == nil then
    -- TODO: Can't find a way to either
    -- 1. set env variables into vscode's execution environment (doesn't read .bashrc)
    -- 2. to add an env variable (or other setting) in vscode which we can read.
    env_keyboard_layout = "colemak-qi"
    -- env_keyboard_layout = "qwerty"
  end

  local keyboard_layout = {}
  if env_keyboard_layout == "qwerty" then
    keyboard_layout = {

      left = {
        lower = "h",
        upper = "H"
      },

      down = {
        lower = "j",
        upper = "J"
      },

      up = {
        lower = "k",
        upper = "K"
      },

      right = {
        lower = "l",
        upper = "L"
      },

      paste = {
        lower = "p",
        upper = "P"
      }

    }

  elseif env_keyboard_layout == "colemak-qi" then
    keyboard_layout = {

      left = {
        lower = "p",
        upper = "P"
      },

      down = {
        lower = "n",
        upper = "N"
      },

      up = {
        lower = "e",
        upper = "E"
      },

      right = {
        lower = "i",
        upper = "I"
      },

      paste = {
        lower = "h",
        upper = "H"
      }

    }

  end

  return keyboard_layout
end

function M.deepMergeTables(table1, table2)
    local mergedTable = {}

    for key, value in pairs(table1) do
        if type(value) == "table" and table2[key] and type(table2[key]) == "table" then
            -- If both values are tables, recursively deep merge them
            mergedTable[key] = M.deepMergeTables(value, table2[key])
        else
            -- Otherwise, simply copy the value
            mergedTable[key] = value
        end
    end

    for key, value in pairs(table2) do
        if type(value) == "table" and not table1[key] then
            -- If the key is present only in table2, copy it to the merged table
            mergedTable[key] = value
        elseif type(value) ~= "table" then
            -- If the value is not a table, overwrite existing values
            mergedTable[key] = value
        end
    end

    return mergedTable
end

return M
