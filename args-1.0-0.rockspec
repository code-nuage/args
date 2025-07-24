package = "args"
version = "1.0-0"
source = {
    url = "git+https://github.com/code-nuage/args.git"
}
description = {
    summary = "A simple arguments engine",
    homepage = "https://github.com/code-nuage/args",
    license = "MIT"
}
dependencies = {
    "lua >= 5.1"
}
build = {
    type = "builtin",
    modules = {
        args = "src/main.lua"
    }
}
