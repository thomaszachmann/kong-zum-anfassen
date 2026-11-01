# setup/env.sh – zu Beginn jedes Trainingstags einlesen: source ~/kong-lab/setup/env.sh
export LAB="$HOME/kong-lab"
export ADMIN="http://localhost:8001"   # Admin API (nur lokal)
export PROXY="http://localhost:8000"   # Proxy HTTP
export PROXYS="https://localhost:8443" # Proxy HTTPS
export KONG_IMAGE="kong:3.9.4"
export KC="http://localhost:8180/realms/lab"   # Keycloak-Realm (ab Tag 6)
export DECK_ANALYTICS=off              # decK sendet sonst anonyme Nutzungsdaten

# kong.yaml neu laden und warten, bis die neuen Worker übernommen haben (ab Tag 2)
kreload() {
  docker compose -f "$LAB/kong/compose.yaml" exec kong kong reload && sleep 5
}

# kong.yaml mit decK einspielen und warten, bis Worker und Data Planes sie haben (ab Tag 8)
ksync() {
  deck gateway sync "$LAB/kong/kong.yaml" && sleep 10
}

# Access Token für den Client notes-cli holen (ab Tag 6)
token() {
  curl -s -d grant_type=client_credentials -d client_id=notes-cli \
    -d client_secret=lab-client-secret-123 "$KC/protocol/openid-connect/token" \
    | jq -r .access_token
}

[ -f "$LAB/setup/vms.env" ] && . "$LAB/setup/vms.env"
true
