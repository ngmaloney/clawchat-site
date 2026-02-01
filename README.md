# ClawChat Website

Static website for ClawChat hosted at [clawchat.dev](https://clawchat.dev)

## About

ClawChat is a beautiful, native desktop chat client for OpenClaw. This repository contains the marketing/landing page.

## Tech Stack

- Static HTML/CSS/JS
- Hosted on Cloudflare Pages
- Custom domain: clawchat.dev

## Development

This is a static site. Simply open `public/index.html` in a browser to preview.

For local development with live reload:

```bash
npx serve public
```

## Deployment

Automatically deployed to Cloudflare Pages on push to `main` branch.

### Manual Setup

1. Connect repository to Cloudflare Pages
2. Build settings:
   - Build command: (leave empty)
   - Build output directory: `public`
3. Add custom domain: `clawchat.dev`

## Related Projects

- [ClawChat Desktop App](https://github.com/ngmaloney/clawchat) - The actual desktop client
- [ClawMail](https://clawmail.dev) - Email for AI agents
- [Pinchy](https://pinchy.me) - OpenClaw desktop companion

## License

MIT License - see LICENSE file for details
