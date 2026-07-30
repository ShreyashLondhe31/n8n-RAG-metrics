# n8n RAG Metrics

This project runs n8n with PostgreSQL and Qdrant for RAG-oriented metric workflows.

[![CI/CD](https://github.com/ShreyashLondhe31/n8n-RAG-metrics/actions/workflows/ci-cd.yml/badge.svg)](https://github.com/ShreyashLondhe31/n8n-RAG-metrics/actions)

## Security hardening

- Docker image runs as a non-root user.
- Containers drop Linux capabilities and use no-new-privileges.
- Sensitive values are loaded from a local .env file and excluded from Git.
- GitHub Actions performs a container build and Trivy vulnerability scan.

## Local development

1. Copy the sample environment file if needed.
2. Run:
   ```bash
   docker compose up --build
   ```

## CI/CD

The workflow in [.github/workflows/ci-cd.yml](.github/workflows/ci-cd.yml) builds the image, scans it with Trivy, and publishes it to GitHub Container Registry on pushes to the default branch.
