# ClawChat Site Deployment Guide

## Current Status

✅ Local repository initialized  
✅ Files committed to `main` branch  
✅ Git remote configured: `github-clawchat:ngmaloney/clawchat-site.git`  
⏳ GitHub repository needs to be created  
⏳ Cloudflare Pages needs to be configured  

---

## Step 1: Create GitHub Repository

Since the `gh` CLI is not available, create the repository manually:

### Option A: Via GitHub Web UI

1. Go to https://github.com/new
2. Repository name: `clawchat-site`
3. Description: `Landing page for ClawChat desktop chat client`
4. Visibility: **Public**
5. **Do NOT** initialize with README, .gitignore, or license (we already have these)
6. Click "Create repository"

### Option B: Via API (if you have a GitHub token)

```bash
curl -X POST https://api.github.com/user/repos \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: token YOUR_GITHUB_TOKEN" \
  -d '{
    "name": "clawchat-site",
    "description": "Landing page for ClawChat desktop chat client",
    "private": false
  }'
```

---

## Step 2: Push to GitHub

Once the repository is created on GitHub, push your local commits:

```bash
cd ~/openclaw/workspace/clawchat-site
git push -u origin main
```

This should work automatically using the SSH key configured at `~/.ssh/id_pinchy_desktop` via the `github-clawchat` host alias.

---

## Step 3: Set Up Cloudflare Pages

### 3.1 Connect Repository

1. Log in to [Cloudflare Dashboard](https://dash.cloudflare.com/)
2. Go to **Pages** in the left sidebar
3. Click **Create a project**
4. Click **Connect to Git**
5. Authorize Cloudflare to access your GitHub account (if not already done)
6. Select the `ngmaloney/clawchat-site` repository
7. Click **Begin setup**

### 3.2 Configure Build Settings

- **Project name**: `clawchat-site` (or your preferred name)
- **Production branch**: `main`
- **Build command**: (leave empty - it's a static site)
- **Build output directory**: `public`
- **Root directory**: `/`

Click **Save and Deploy**

### 3.3 Wait for Deployment

Cloudflare will deploy your site. You'll get a URL like:
`https://clawchat-site.pages.dev`

---

## Step 4: Configure Custom Domain (clawchat.dev)

### 4.1 Add Custom Domain

1. In your Cloudflare Pages project, go to **Custom domains**
2. Click **Set up a custom domain**
3. Enter: `clawchat.dev`
4. Click **Continue**

### 4.2 DNS Configuration

If `clawchat.dev` is already in your Cloudflare account:

- Cloudflare will automatically create a CNAME record pointing to your Pages deployment
- DNS propagation should be instant

If `clawchat.dev` is NOT in Cloudflare:

1. Go to your domain registrar
2. Update nameservers to Cloudflare's (you'll get these from Cloudflare)
3. Or manually create a CNAME record:
   - **Name**: `@` (or leave blank)
   - **Value**: `clawchat-site.pages.dev` (your actual Pages URL)

### 4.3 Add www Subdomain (Optional)

Repeat the custom domain setup for `www.clawchat.dev` if desired.

---

## Step 5: Verify Deployment

Once DNS propagates (usually instant with Cloudflare):

1. Visit https://clawchat.dev
2. Verify the site loads correctly
3. Check that all images load (screenshot.png, clawchat-icon.png)
4. Test mobile responsiveness
5. Verify all download links point to GitHub releases

---

## Quick Reference

### Repository Structure

```
clawchat-site/
├── public/
│   ├── index.html
│   ├── clawchat-icon.png
│   └── screenshot.png
├── .gitignore
├── LICENSE
├── README.md
├── package.json
└── DEPLOYMENT.md (this file)
```

### Git Remote

```bash
git remote -v
# origin  github-clawchat:ngmaloney/clawchat-site.git (fetch)
# origin  github-clawchat:ngmaloney/clawchat-site.git (push)
```

### SSH Config (already set up)

From `~/.ssh/config`:
```
Host github-clawchat
  HostName github.com
  User git
  IdentityFile ~/.ssh/id_pinchy_desktop
```

---

## Future Updates

To update the site:

```bash
cd ~/openclaw/workspace/clawchat-site
# Make changes to public/index.html or other files
git add .
git commit -m "Update: describe your changes"
git push origin main
```

Cloudflare Pages will automatically rebuild and deploy on push to `main`.

---

## Troubleshooting

### Push fails with "Repository not found"

The GitHub repository hasn't been created yet. Complete Step 1 first.

### Images not loading

Check that screenshot.png and clawchat-icon.png exist in `public/` directory:

```bash
ls -lh public/*.png
```

### Custom domain not working

- Verify DNS records in Cloudflare DNS dashboard
- Check SSL/TLS mode is set to "Full" or "Full (strict)"
- Wait up to 24 hours for DNS propagation (usually much faster)

---

## Design Attribution

This site's design is adapted from [ClawMail](https://clawmail.dev) with the same color scheme, layout, and aesthetic to maintain consistency across the OpenClaw ecosystem.
