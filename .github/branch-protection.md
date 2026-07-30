Branch protection setup
=======================

This repository includes a small helper script to configure branch protection for `main`.

Important: running the script requires admin rights on the repository and a token with `repo` scope.

Example usage (locally):

```bash
# export a token with admin rights
export GITHUB_TOKEN="ghp_..."
./.github/scripts/setup-branch-protection.sh main
```

What the script does
- Enables required pull request reviews
- Requires at least 1 approving review
- Enables "Require code owner reviews" (honors `.github/CODEOWNERS`)
- Enforces the rules for admins

If you prefer using the GitHub UI, go to Settings → Branches → Add rule and enable the options above for `main`.
