-- handler.lua – Namen aus einem geprüften JWT als Header ans Backend (Tag 11)
local jwt_parser = require "kong.plugins.jwt.jwt_parser"

local JwtIdentity = {
  PRIORITY = 1400,   -- nach jwt (1450), vor acl (950)
  VERSION = "0.1.0",
}

function JwtIdentity:access(conf)
  -- Ein vom Client mitgeschickter Header wird immer entfernt.
  kong.service.request.clear_header(conf.header)

  -- Nur wenn die Anmeldung über ein JWT lief, ist das Token geprüft.
  local credential = kong.client.get_credential()
  if not credential or not credential.algorithm then
    return
  end

  local auth = kong.request.get_header("authorization") or ""
  local token = auth:match("^[Bb]earer%s+(.+)$")
  if not token then
    return
  end

  local jwt, err = jwt_parser:new(token)
  if not jwt then
    kong.log.warn("Token nicht lesbar: ", err)
    return
  end

  local value = jwt.claims[conf.claim]
  if type(value) == "string" then
    kong.service.request.set_header(conf.header, value)
    kong.log.info(conf.header, ": ", value)
  end
end

return JwtIdentity
