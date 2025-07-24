local args = {}
args.registered = {}

function args.register(names, handler)
    assert(type(names) == "table", "Argument <names>: Must be a table.")
    assert(type(handler) == "function", "Argument <handler>: Must be a function.")

    for key, name in ipairs(names) do
        assert(type(name) == "string", "Element at " .. key .. " in argument <names>: Must be a string.")
    end

    table.insert(args.registered, {names = names, handler = handler})
end

function args.parse(list)
    local undefined = {}

    for _, arg in ipairs(list) do
        local found = false

        for _, value in ipairs(args.registered) do
            for _, name in ipairs(value.names) do
                if name == arg then
                    value.handler()
                    found = true
                    break -- sort de la boucle sur les noms
                end
            end
            if found then break end -- sort de la boucle sur registered
        end

        if not found then
            table.insert(undefined, arg)
        end
    end

    return undefined
end


return args
