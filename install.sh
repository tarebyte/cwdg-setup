########################
#-- Install Homebrew --#
########################

clear
echo Retrieving HomeBrew...
ruby -e "$(curl -fsSkL raw.github.com/mxcl/homebrew/go)"

#-- Set up Homebrew and install useful formulas --#
echo Calling the Doctor...
brew doctor

# Meet RVM requirements for OSX 
brew update
brew tap homebrew/dupes
brew install autoconf automake apple-gcc42

# Requirement for ruby 1.9.3
brew install libksba

# Install some useful formulas
# Note that ruby-build needs rbenv to run
brew install git rbenv ruby-build

###############################################
#-- Set up Git, Github Auth and Git Aliases --#
###############################################

clear
echo "Git and Github setup..."

# Get credentials and set them to the global git config
echo "Please enter your Name (First, and Last)" && read full_name
git config --global user.name "$full_name"

echo "Please enter your Github username: " && read username
git config --global github.user "$username"

echo "Please enter your email from your Github account" && read email
git config --global user.email "$email"

# Set aliases from Git Emmersion http://gitimmersion.com/
git config --global alias.co "checkout"
git config --global alias.ci "commit"
git config --global alias.st "status"
git config --global alias.br "branch"
git config --global alias.hist "log --pretty=format:\"%h %ad | %s%d [%an]\" --graph --date=short --color"
git config --global alias.type "cat-file -t"
git config --global alias.dump "cat-file -p"

# Download the the OSX Keychain 
curl -s -O http://github-media-downloads.s3.amazonaws.com/osx/git-credential-osxkeychain

# Fix the permissions on the file so it can be run
chmod u+x git-credential-osxkeychain

# Parse the path of git so that you put it in the correct folder
which_git=$(which git) # Get the full git path
which_git_path_length=$(expr ${#which_git} - 4) # Remove the /git
git_path=${which_git:0:which_git_path_length} # Create new path from substing

# move the git-credential-osxkeychain to the correct path
sudo mv git-credential-osxkeychain $(git_path)

# Add the credential to the gitconfig 
git config --global credential.helper osxkeychain
