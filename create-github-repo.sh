#!/bin/bash
# Helper script to create the GitHub repository
# Run this if you have a GitHub personal access token

set -e

REPO_NAME="clawchat-site"
REPO_DESC="Landing page for ClawChat desktop chat client"
GITHUB_USER="ngmaloney"

echo "Creating GitHub repository: $GITHUB_USER/$REPO_NAME"
echo ""

# Check if GitHub token is available
if [ -z "$GITHUB_TOKEN" ]; then
  echo "Error: GITHUB_TOKEN environment variable not set"
  echo ""
  echo "To use this script, create a GitHub personal access token with 'repo' scope:"
  echo "1. Go to https://github.com/settings/tokens"
  echo "2. Generate new token (classic)"
  echo "3. Select 'repo' scope"
  echo "4. Copy the token"
  echo ""
  echo "Then run:"
  echo "  export GITHUB_TOKEN='your_token_here'"
  echo "  bash create-github-repo.sh"
  echo ""
  echo "Or create the repository manually at:"
  echo "  https://github.com/new"
  exit 1
fi

# Create repository via GitHub API
response=$(curl -s -X POST https://api.github.com/user/repos \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: token $GITHUB_TOKEN" \
  -d "{
    \"name\": \"$REPO_NAME\",
    \"description\": \"$REPO_DESC\",
    \"private\": false,
    \"has_issues\": true,
    \"has_wiki\": false,
    \"has_projects\": false
  }")

# Check if successful
if echo "$response" | grep -q '"html_url"'; then
  repo_url=$(echo "$response" | grep -o '"html_url": *"[^"]*"' | sed 's/"html_url": *"\(.*\)"/\1/')
  echo "✅ Repository created successfully!"
  echo "   URL: $repo_url"
  echo ""
  echo "Now push your code:"
  echo "  git push -u origin main"
else
  echo "❌ Failed to create repository"
  echo ""
  echo "Response from GitHub:"
  echo "$response"
  echo ""
  
  # Check if repo already exists
  if echo "$response" | grep -q "name already exists"; then
    echo "The repository already exists. You can push directly:"
    echo "  git push -u origin main"
  fi
fi
