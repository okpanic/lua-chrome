rockspec_format = "1.0"
package = "lua-chrome"
    version = "1.0-1"

    source = {
    url = "https://github.com/okpanic/lua-chrome/raw/master/lua-chrome-1.0.tar.gz",
    tag = "1.0"
    }

    description = {
    summary = "wrapper for headless chrome-browser",
    detailed = "0",
    homepage = "https://github.com/okpanic",
    license = "GPLv3"
    }

    dependencies = {
    "lua ~> 5.1"
    }

  build = {
      type = "builtin",
      modules = {
          ["lua-chrome"] = "lua-chrome/init.lua"
        }
  }
