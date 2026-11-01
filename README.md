# Kong zum Anfassen – Begleitcode

Begleitcode zum Buch **Kong zum Anfassen** – API-Gateway vom ersten Service bis Kubernetes. Teil der Reihe IT-Trainingslager von Thomas Zachmann.

Buchseite: https://it-trainingslager.de/buecher/kong

Der Code begleitet das Buch; Erklärungen und Übungen stehen im Buch.

## Inhalt

- `setup/` – `env.sh` mit `kreload`, `ksync` und `token` für jeden Trainingstag
- `backend/` – notes-api, Postgres und Echo-Dienst als Compose-Projekt
- `kong/` – Kong ohne Datenbank (Start in Tag 1)
- `keycloak/` – Keycloak mit dem Realm `lab` (Tag 6)
- `observability/` – Prometheus, Grafana und Jaeger (Tag 12)
- `plugins/` – das eigene Lua-Plugin `jwt-identity` (Tag 11)
- `notes/` – Quellcode von notes-api
- `tag01/` – Dateien zu Tag 1
- `tag02/` – Dateien zu Tag 2
- `tag03/` – Dateien zu Tag 3
- `tag04/` – Dateien zu Tag 4
- `tag05/` – Dateien zu Tag 5
- `tag06/` – Dateien zu Tag 6
- `tag07/` – Dateien zu Tag 7
- `tag08/` – Dateien zu Tag 8
- `tag09/` – Dateien zu Tag 9
- `tag11/` – Dateien zu Tag 11
- `tag12/` – Dateien zu Tag 12
- `tag13/` – Dateien zu Tag 13
- `tag14/` – Dateien zu Tag 14

## Schnellstart

```bash
git clone https://github.com/thomaszachmann/kong-zum-anfassen.git ~/kong-lab/code
```

Details stehen im Kapitel „Tag 0“ des Buchs.

## Lizenz

Code: MIT (siehe LICENSE). Buchtexte, Abbildungen und Cover sind nicht Teil dieses Repos und nicht lizenziert.
