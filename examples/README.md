# Example TabGrab Integration Script

This directory contains example scripts showing how to use TabGrab with the Guitar Tabs Viewer.

## Files

- `scrape_tabs_example.rb` - Example Ruby script to scrape tabs using TabGrab
- `README.md` - This file

## Prerequisites

1. Clone the [tabgrab repository](https://github.com/talsafran/tabgrab.git)
2. Install Ruby and bundler
3. Install tabgrab dependencies: `bundle install`

## Usage

These scripts are meant to be run from within the tabgrab repository directory:

```bash
# Clone tabgrab
git clone https://github.com/talsafran/tabgrab.git
cd tabgrab

# Install dependencies
bundle install

# Copy the example script to the tabgrab directory
cp /path/to/this/scrape_tabs_example.rb .

# Run the script (modify artist URLs as needed)
ruby scrape_tabs_example.rb
```

## Important Notes

- The example scripts assume you're running them from the tabgrab repository root
- Make sure to respect UltimateGuitar's terms of service when scraping
- Add appropriate delays between requests to avoid rate limiting
- The tabgrab library may need updates if UltimateGuitar's website structure has changed
