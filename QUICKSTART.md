# 🚀 ClawChat Site - Quick Start

Your ClawChat landing page is ready! Here's what to do next:

## 1️⃣ Create GitHub Repository (2 minutes)

Visit: **https://github.com/new**

```
Repository name:  clawchat-site
Description:      Landing page for ClawChat desktop chat client
Visibility:       Public ✓
Initialize:       DO NOT check any boxes
```

Click **"Create repository"**

## 2️⃣ Push Your Code (30 seconds)

```bash
cd ~/openclaw/workspace/clawchat-site
git push -u origin main
```

## 3️⃣ Deploy to Cloudflare Pages (3 minutes)

1. Go to https://dash.cloudflare.com/
2. Click **"Pages"** → **"Create a project"** → **"Connect to Git"**
3. Select **ngmaloney/clawchat-site**
4. Configure:
   - Build command: (leave empty)
   - Build output directory: `public`
5. Click **"Save and Deploy"**

## 4️⃣ Add Custom Domain (2 minutes)

1. In your Pages project → **"Custom domains"**
2. Click **"Set up a custom domain"**
3. Enter: `clawchat.dev`
4. Cloudflare will auto-configure DNS

## ✅ Done!

Your site will be live at **https://clawchat.dev** in about 5 minutes total.

---

**Preview locally:**
```bash
cd ~/openclaw/workspace/clawchat-site
npx serve public
# or just open public/index.html in a browser
```

**Need help?** See DEPLOYMENT.md for detailed instructions.
