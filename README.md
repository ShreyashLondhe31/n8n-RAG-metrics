# n8n RAG Metrics

This project runs n8n with PostgreSQL and Qdrant for RAG-oriented metric workflows.

[![CI/CD](https://github.com/ShreyashLondhe31/n8n-RAG-metrics/actions/workflows/ci-cd.yml/badge.svg)](https://github.com/ShreyashLondhe31/n8n-RAG-metrics/actions)

## Security hardening

- Docker image runs as a non-root user.
- Uses the smallest available official n8n base image compatible with the workflow.
- Containers drop Linux capabilities and use no-new-privileges.
- Sensitive values are loaded from a local .env file and excluded from Git.
- GitHub Actions performs a container build and Trivy vulnerability scan.

## Local development

1. Copy the sample environment file if needed.
2. Run:
   ```bash
   docker compose up --build
   ```

> Note: Docker Desktop and `docker images` show an image's virtual size, which includes shared base layers. The built n8n image payload is much smaller; use `docker image inspect local/n8n-rag-metrics:optimized --format '{{.Size}}'` to see the actual compressed size.

## CI/CD

The workflow in [.github/workflows/ci-cd.yml](.github/workflows/ci-cd.yml) builds the image, scans it with Trivy, and publishes it to GitHub Container Registry on pushes to the default branch.

If `DOCKERHUB_USERNAME` and `DOCKERHUB_TOKEN` are configured as repository secrets, the workflow will also push the image to Docker Hub as `docker.io/<username>/n8n-rag-metrics:optimized`.
