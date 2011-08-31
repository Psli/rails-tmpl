# remove files
run "rm README"
run "rm public/index.html"
run "rm app/assets/images/rails.png"
run "cp config/database.yml config/database.yml.example"

# install gems
run "rm Gemfile"
run "curl -L https://github.com/Psli/rails-tmpl/raw/master/Gemfile31 > Gemfile"

# bundle install
run "bundle install"

# generate rspec
generate "rspec:install"

# add time format
# environment 'Time::DATE_FORMATS.merge!(:default => "%Y-%m-%d %I:%M %p", :ymd => "%Y-%m-%d")'

# .gitignore
append_file '.gitignore', <<-CODE
config/database.yml
coverage/*
*.tmproj
cmd.txt
Thumbs.db
.DS_Store
CODE

# keep tmp and log
# run "touch tmp/.gitkeep"
# run "touch log/.gitkeep"

# git commit
git :init
git :add => '.'
git :commit => "-a -m 'init commit'"