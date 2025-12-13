# Using TabGrab with Guitar Tabs Viewer

This guide explains how to use the [tabgrab](https://github.com/talsafran/tabgrab.git) repository to scrape guitar tabs from UltimateGuitar and use them with this Guitar Tabs Viewer.

## What is TabGrab?

TabGrab is a Ruby gem that scrapes guitar tabs from UltimateGuitar.com. It provides a programmatic way to download and organize guitar tabs for various artists.

## Prerequisites

- Ruby (version 2.0 or higher recommended)
- Bundler gem (`gem install bundler`)
- Git

## Step 1: Clone and Set Up TabGrab

First, clone the tabgrab repository:

```bash
git clone https://github.com/talsafran/tabgrab.git
cd tabgrab
```

Install the required dependencies:

```bash
bundle install
```

If you don't have bundler installed, install it first:

```bash
gem install bundler
bundle install
```

## Step 2: Using TabGrab to Scrape Tabs

TabGrab provides several ways to scrape guitar tabs:

### Interactive Ruby Console

You can use the interactive console to explore the API:

```bash
ruby tools/console.rb
```

This opens an IRB session with the UltimateGuitar module loaded. Try these commands:

```ruby
# Search for an artist (replace with actual UltimateGuitar URL)
artist = UltimateGuitar::Artist.new("http://www.ultimate-guitar.com/tabs/bob_dylan_tabs.htm")

# Get all tabs for that artist
tabs = artist.tabs

# Get the text content of the first tab
tabs.first.text

# Get the URL of the first tab
tabs.first.url
```

### Batch Scraping by Letter

Use the provided tool to scrape all artists starting with a specific letter:

```bash
ruby tools/dump_letter.rb a
```

This will:
1. Find all artists starting with the letter 'a'
2. Scrape all their tabs
3. Save the data to `log/dumps/a.yml`

## Step 3: Organizing Scraped Tabs

Create a directory structure to store your scraped tabs:

```bash
mkdir -p guitar-tabs
cd guitar-tabs
```

### Example: Scraping Specific Artists

Create a Ruby script to scrape specific artists and save their tabs:

```ruby
#!/usr/bin/env ruby
require './lib/ultimate_guitar'

# Initialize artist
artist = UltimateGuitar::Artist.new("http://www.ultimate-guitar.com/tabs/your_artist_tabs.htm")

# Get all tabs
tabs = artist.tabs

# Save each tab to a file
tabs.each_with_index do |tab, index|
  filename = "tab_#{index + 1}.txt"
  File.write(filename, tab.text)
  puts "Saved: #{filename}"
end
```

## Step 4: Using Scraped Tabs with Guitar Tabs Viewer

Once you've scraped tabs using TabGrab, you can use them with this Guitar Tabs Viewer:

### Option 1: Create a GitHub Repository

1. Create a new GitHub repository (e.g., `guitar-tabs`)
2. Organize your scraped tabs in folders by artist or song
3. Commit and push the tabs to your repository
4. Update the `index.html` file in this viewer to point to your repository:

```javascript
const owner = 'YourUsername';  // Change this
const repo = 'guitar-tabs';     // Change this
```

### Option 2: Local File System

Alternatively, modify the Guitar Tabs Viewer to read from a local directory instead of GitHub:

1. Place your scraped tabs in a local directory
2. Modify the viewer to use the File System API or a local server

## Example Workflow

Here's a complete example workflow:

```bash
# 1. Clone tabgrab
git clone https://github.com/talsafran/tabgrab.git
cd tabgrab

# 2. Install dependencies
bundle install

# 3. Create output directory
mkdir -p output/tabs

# 4. Create a scraper script
cat > scrape_tabs.rb << 'EOF'
#!/usr/bin/env ruby
require './lib/ultimate_guitar'

# Example: Scrape tabs for multiple artists
artists = [
  "http://www.ultimate-guitar.com/tabs/metallica_tabs.htm",
  "http://www.ultimate-guitar.com/tabs/led_zeppelin_tabs.htm"
]

artists.each do |artist_url|
  artist = UltimateGuitar::Artist.new(artist_url)
  artist_name = artist_url.split('/').last.gsub('_tabs.htm', '')
  
  Dir.mkdir("output/tabs/#{artist_name}") unless Dir.exist?("output/tabs/#{artist_name}")
  
  artist.tabs.each_with_index do |tab, index|
    filename = "output/tabs/#{artist_name}/tab_#{index + 1}.txt"
    File.write(filename, tab.text)
    puts "Saved: #{filename}"
  end
end
EOF

# 5. Run the scraper
ruby scrape_tabs.rb

# 6. Initialize a git repository in the output directory
cd output
git init
git add tabs/
git commit -m "Add scraped guitar tabs"

# 7. Create a GitHub repository and push
# (Follow GitHub's instructions to create a new repo)
git remote add origin https://github.com/YourUsername/guitar-tabs.git
git push -u origin main
```

## Important Notes

- **Rate Limiting**: Be respectful when scraping. Add delays between requests to avoid overwhelming UltimateGuitar's servers.
- **Terms of Service**: Make sure you comply with UltimateGuitar's terms of service when scraping.
- **Personal Use**: Use scraped content for personal use only unless you have permission.
- **Updates**: The tabgrab library was last updated in 2012. The UltimateGuitar website may have changed, so the scraper might need updates.

## Troubleshooting

### Nokogiri Installation Issues

If you encounter issues installing Nokogiri (a dependency):

```bash
# On Ubuntu/Debian
sudo apt-get install build-essential patch ruby-dev zlib1g-dev liblzma-dev

# On macOS
xcode-select --install
```

### Network/SSL Issues

If you encounter SSL certificate errors:

```ruby
# Add this at the top of your script
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
```

### Empty or Missing Tabs

If tabs come back empty, the website structure may have changed. You may need to update the CSS selectors in `lib/ultimate_guitar/tab.rb`.

## Alternative Approach: Manual Tab Files

If TabGrab doesn't work due to website changes, you can manually:

1. Copy guitar tabs from UltimateGuitar
2. Save them as `.txt` files in your repository
3. Organize them by artist/song
4. Use the Guitar Tabs Viewer to browse them

## Additional Resources

- [TabGrab GitHub Repository](https://github.com/talsafran/tabgrab)
- [UltimateGuitar Website](https://www.ultimate-guitar.com)
- [Nokogiri Documentation](https://nokogiri.org/)
- [Ruby Documentation](https://www.ruby-lang.org/en/documentation/)
