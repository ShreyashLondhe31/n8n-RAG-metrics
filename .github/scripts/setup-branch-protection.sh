#!/usr/bin/env bash
set -euo pipefail

BRANCH=${1:-main}

if [ -z "${GITHUB_TOKEN:-}" ]; then
  echo "GITHUB_TOKEN must be set and have admin:repo scope"
  exit 1
fi

REPO="$GITHUB_REPOSITORY"

echo "Setting branch protection for $REPO branch $BRANCH"

curl -sS -X PUT \
  -H "Authorization: Bearer $GITHUB_TOKEN" \
  -H "Accept: application/vnd.github+json" \
  https://api.github.com/repos/${REPO}/branches/${BRANCH}/protection \
  -d '{
    "required_status_checks": null,
    "enforce_admins": true,
    "required_pull_request_reviews": {
      "dismiss_stale_reviews": true,
      "require_code_owner_reviews": true,
      "required_approving_review_count": 1
    },
    "restrictions": null
  }'

echo "Branch protection API request complete. Verify in repository Settings → Branches."
