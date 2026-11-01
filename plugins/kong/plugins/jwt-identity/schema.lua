-- schema.lua – Konfiguration des Plugins jwt-identity (Tag 11)
local typedefs = require "kong.db.schema.typedefs"

return {
  name = "jwt-identity",
  fields = {
    { consumer = typedefs.no_consumer },
    { protocols = typedefs.protocols_http },
    { config = {
        type = "record",
        fields = {
          { claim = { type = "string", required = true,
                      default = "preferred_username" } },
          { header = { type = "string", required = true, default = "X-User",
                       match = "^X%-[%w%-]+$" } },
        },
    } },
  },
}
