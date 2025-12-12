<div align="center">
<img width="1200" height="475" alt="GHBanner" src="https://github.com/user-attachments/assets/0aa67016-6eaf-458a-adb2-6e31a0763ed6" />
</div>

# Guitar Tabs Viewer

A simple web application for browsing and viewing guitar tab files from GitHub repositories. This viewer fetches guitar tabs directly from the `Riffjordan12/guitar-tabs` repository and displays them in a clean, user-friendly interface.

View your app in AI Studio: https://ai.studio/apps/drive/13Hi13Ogrg3aqDZHVKVLGqbXPBn0eMZIL

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

## Alternative: Using the Guitar Notes Legacy Project

For a more feature-rich guitar notes management system, you can use the [guitar-notes--legacy-project](https://github.com/tkozuch/guitar-notes--legacy-project) repository. This is a full-stack application that allows you to create, edit, and manage your own guitar notes and tabs.

### Features of Guitar Notes Legacy Project

- **Full-Stack Application**: React frontend with Python FastAPI backend
- **Editable Notes**: Create and edit your own guitar notes with a WYSIWYG editor
- **Persistent Storage**: Save your notes in JSON format
- **Expandable/Collapsible**: Organize notes with expand/collapse functionality
- **Docker Support**: Easy deployment with Docker Compose

### Setting Up Guitar Notes Legacy Project

1. **Clone the repository**:
   ```bash
   git clone https://github.com/tkozuch/guitar-notes--legacy-project.git
   cd guitar-notes--legacy-project
   ```

2. **Using Docker Compose (Recommended)**:
   ```bash
   docker-compose up
   ```
   This will start both the frontend (on port 3000) and backend (on port 8000).

3. **Manual Setup**:

   **Backend Setup**:
   ```bash
   cd backend
   pip install -r requirements.txt
   uvicorn main:app --reload --port 8000
   ```

   **Frontend Setup** (in a separate terminal):
   ```bash
   cd frontend
   npm install
   npm start
   ```

4. **Access the Application**:
   - Frontend: http://localhost:3000
   - Backend API: http://localhost:8000

### Guitar Notes vs Guitar Tabs Viewer

| Feature | Guitar Tabs Viewer | Guitar Notes Legacy Project |
|---------|-------------------|----------------------------|
| Setup Complexity | Simple (Vite-based) | Moderate (full-stack) |
| Data Source | GitHub API (read-only) | Local JSON (editable) |
| Editing | No | Yes (WYSIWYG editor) |
| Storage | None (reads from GitHub) | Local file system |
| Dependencies | Node.js (for dev server) | Node.js + Python + Docker |
| Best For | Browsing existing tabs | Creating and managing your own notes |

### Integrating Both Projects

You can use both projects together:
1. Use **Guitar Tabs Viewer** to browse and discover guitar tabs from the community
2. Use **Guitar Notes Legacy Project** to maintain your personal collection of notes and tabs you've learned

## Project Structure

```
Guitar-Tabs-Viewer/
├── index.html          # Main HTML file with embedded JavaScript
├── index.tsx           # TypeScript entry point (currently empty)
├── index.css           # Additional styles (currently empty)
├── package.json        # Node.js dependencies
├── vite.config.ts      # Vite configuration
└── README.md           # This file
```

## Contributing

Feel free to open issues or submit pull requests to improve this project!

## License

See [LICENSE](LICENSE) for details.
