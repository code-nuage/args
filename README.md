# `args`

A simple arguments engine written in Lua

## Usage
### Installation
Download library from Luarocks
```sh
luarocks install args
```
Require it in your project
```lua
local args = require("args")
```

### `args.register(names, handler)`
You can register a handler with `register` function.

It takes a table of strings and a anonymous function in input and register it.

### ```args.parse(list)```
You can parse and execute registered handlers with `parse` function.

It takes a table of strings in input and execute the matching handler.
It give a table of undefined arguments in output.

You can give it the table of arguments in Lua with `arg` table.

## Exemple
```lua
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
```
