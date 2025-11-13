---@meta _
purpIe_RerollSave = purpIe_RerollSave or {}

---@diagnostic disable-next-line: undefined-global
local mods = rom.mods

---@diagnostic disable: lowercase-global
---@module 'SGG_Modding-ENVY-auto'
mods['SGG_Modding-ENVY'].auto()

---@diagnostic disable-next-line: undefined-global
rom = rom
---@diagnostic disable-next-line: undefined-global
_PLUGIN = PLUGIN

---@module 'SGG_Modding-Hades2GameDef-Globals'
game = rom.game

---@module 'SGG_Modding-ModUtil'
modutil = mods['SGG_Modding-ModUtil']

---@module 'SGG_Modding-Chalk'
chalk = mods["SGG_Modding-Chalk"]

---@module 'SGG_Modding-ReLoad'
reload = mods['SGG_Modding-ReLoad']

---@module 'purpIe-config-RerollSave'
config = chalk.auto('config.lua')
public.config = config

---@module 'game.import'
import_as_fallback(rom.game)

local function on_ready()
    if config.Enabled == false then
        return
    end

    import("reroll_save.lua")

end

local function on_reload()
    if config.Enabled == false then
        return
    end
end

local loader = reload.auto_single()

modutil.once_loaded.game(function()
    loader.load(on_ready, on_reload)
end)
