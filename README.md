\# My Platform — Cloud-Native Laravel



> PFE · Architecture Cloud-Native · Laravel 12 · Docker · k3s



\## Stack

\- \*\*Backend\*\* : Laravel 12 · PHP 8.3

\- \*\*Frontend\*\* : Blade · Alpine.js

\- \*\*Base de données\*\* : MySQL 8

\- \*\*Cache / Queues\*\* : Redis 7

\- \*\*Reverse proxy\*\* : NGINX → Traefik (prod)

\- \*\*Orchestration\*\* : Docker Compose → k3s

\- \*\*CI/CD\*\* : GitHub Actions

\- \*\*Monitoring\*\* : Prometheus · Grafana · Loki



\## Démarrage rapide



```bash

git clone <repo-url> \&\& cd my-platform

cp app/.env.example app/.env

make build

make up

make migrate

```



Accès : http://localhost:8080



\## Commandes utiles

| Commande | Action |

|---|---|

| `make up` | Démarrer |

| `make down` | Arrêter |

| `make logs` | Voir les logs |

| `make shell` | Shell PHP |

| `make migrate` | Migrations |

| `make test` | Tests |

