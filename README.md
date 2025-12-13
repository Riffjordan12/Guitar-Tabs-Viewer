<div align="center">
<img width="1200" height="475" alt="GHBanner" src="https://github.com/user-attachments/assets/0aa67016-6eaf-458a-adb2-6e31a0763ed6" />
</div>

# Guitar Tabs Viewer

A web application to view and browse guitar tabs from a GitHub repository.

View your app in AI Studio: https://ai.studio/apps/drive/13Hi13Ogrg3aqDZHVKVLGqbXPBn0eMZIL

## Features

- Browse guitar tabs stored in a GitHub repository
- View tab contents in a clean, readable interface
- Navigate through directories to organize tabs by artist or song
- Responsive design with dark theme optimized for readability

## Run Locally

**Prerequisites:**  Node.js

1. Install dependencies:
   ```bash
   npm install
   ```
2. Set the `GEMINI_API_KEY` in [.env.local](.env.local) to your Gemini API key
3. Run the app:
   ```bash
   npm run dev
   ```

## Using TabGrab to Scrape Guitar Tabs

This viewer works great with tabs scraped using the [tabgrab](https://github.com/talsafran/tabgrab.git) tool. TabGrab is a Ruby gem that scrapes guitar tabs from UltimateGuitar.com.

**See the complete guide:** [USING_TABGRAB.md](./USING_TABGRAB.md)

Quick overview:
1. Clone and set up TabGrab
2. Scrape guitar tabs from UltimateGuitar
3. Organize tabs in a GitHub repository
4. Configure this viewer to point to your tabs repository

## Configuration

To use your own guitar tabs repository, edit the `index.html` file and update these variables:

```javascript
const owner = 'YourUsername';  // Your GitHub username
const repo = 'guitar-tabs';     // Your tabs repository name
```

## How It Works

The viewer uses the GitHub API to:
1. Fetch the contents of your guitar tabs repository
2. Display files and folders in an organized list
3. Show tab content when you click on a file
4. Navigate through subdirectories for organization
