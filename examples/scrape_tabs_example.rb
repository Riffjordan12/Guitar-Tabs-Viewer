#!/usr/bin/env ruby
# Example script to scrape guitar tabs using TabGrab
# This script should be run from the tabgrab repository root directory
#
# Usage:
#   1. Clone tabgrab: git clone https://github.com/talsafran/tabgrab.git
#   2. cd tabgrab
#   3. bundle install
#   4. Copy this script to the tabgrab directory
#   5. Run: ruby scrape_tabs_example.rb

require './lib/ultimate_guitar'

# Create output directory for tabs
output_dir = 'output/guitar-tabs'
Dir.mkdir('output') unless Dir.exist?('output')
Dir.mkdir(output_dir) unless Dir.exist?(output_dir)

# Example artist URLs from UltimateGuitar
# IMPORTANT: These URLs may be outdated. Visit ultimate-guitar.com to get current URLs
example_artists = {
  'metallica' => 'http://www.ultimate-guitar.com/tabs/metallica_tabs.htm',
  'nirvana' => 'http://www.ultimate-guitar.com/tabs/nirvana_tabs.htm'
}

puts "TabGrab Example Scraper"
puts "=" * 50
puts ""
puts "This script will scrape guitar tabs for the following artists:"
example_artists.keys.each { |artist| puts "  - #{artist}" }
puts ""
puts "NOTE: This may take a while depending on the number of tabs."
puts "      Please be patient and respectful of UltimateGuitar's servers."
puts ""

# Process each artist
example_artists.each do |artist_name, artist_url|
  puts "\n--- Processing: #{artist_name} ---"
  
  begin
    # Initialize the artist
    artist = UltimateGuitar::Artist.new(artist_url)
    
    # Create artist directory
    artist_dir = File.join(output_dir, artist_name)
    Dir.mkdir(artist_dir) unless Dir.exist?(artist_dir)
    
    # Get all tabs
    tabs = artist.tabs
    puts "Found #{tabs.length} tabs for #{artist_name}"
    
    # Save each tab
    tabs.each_with_index do |tab, index|
      begin
        # Get the tab content
        content = tab.text
        
        if content && !content.empty?
          # Create filename from URL or use index
          tab_filename = "tab_#{index + 1}.txt"
          filepath = File.join(artist_dir, tab_filename)
          
          # Write the tab to file
          File.write(filepath, content)
          puts "  Saved: #{tab_filename}"
          
          # Be respectful - add a small delay between requests
          sleep(1)
        else
          puts "  Skipped: tab #{index + 1} (empty content)"
        end
      rescue => e
        puts "  Error processing tab #{index + 1}: #{e.message}"
      end
    end
    
    puts "Completed #{artist_name}: #{tabs.length} tabs processed"
    
  rescue => e
    puts "Error processing artist #{artist_name}: #{e.message}"
  end
  
  # Longer delay between artists
  sleep(2)
end

puts "\n" + "=" * 50
puts "Scraping complete!"
puts "Tabs saved to: #{output_dir}"
puts ""
puts "Next steps:"
puts "1. Create a GitHub repository for your tabs"
puts "2. Copy the contents of '#{output_dir}' to your repository"
puts "3. Push to GitHub"
puts "4. Update the Guitar Tabs Viewer to point to your repository"
puts ""
puts "See USING_TABGRAB.md for detailed instructions."
