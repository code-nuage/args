local args = require("args")

args.register({"--help", "-h"}, function()
    print("Help of args' testing\n--help, -h: Show help page\n--verbose, -v: Show verbose")
end)

args.register({"--verbose", "-v"}, function()
    print("Verbose argument")
end)

local undefined = args.parse(arg)

if #undefined > 0 then
    print("Argument(s) " .. table.concat(undefined, ", ") .. " are not defined.")
end