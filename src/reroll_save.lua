---@meta _
---@diagnostic disable: lowercase-global


print("purpIe-RerollSave: pre-run hook installed")
modutil.mod.Path.Wrap("SpecialInteractChangeNextRunRNG", function(base, usee, args)
    base(usee, args)
    if config ~= nil and config.Enabled == true then
        RequestPreRunLoadoutChangeSave()
    end
end)
