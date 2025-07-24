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
    for _, arg in ipairs(list) do
        for _, value in ipairs(args.registered) do
            for _, name in ipairs(value["names"]) do
                if name == arg then
                    value["handler"]()
                end
            end
        end
    end
end

return args