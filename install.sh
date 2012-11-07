#-- Install RVM and Get Ruby Setup --#
#clear
#echo Locating Stable RVM
#\curl -L https://get.rvm.io | bash -s stable --ruby

#-- Install Homebrew --#
#ruby -e "$(curl -fsSkL raw.github.com/mxcl/homebrew/go)"

#-- Install useful developer tools used from Homebrew --#
#brew install {git, pbcopy}

#-- Set up Github Auth for HTTP --#
clear
echo "Git and Github setup..."

# Get credentials and set them to the global git config
echo "Please enter your Name (First, and Last)" && read full_name
git config --global user.name "$full_name"

echo "Please enter your Github username: " && read username
git config --global github.user "$username"

echo "Please enter your email from your Github account" && read email
git config --global user.email "$email"

# Set aliases from Git Emmersion
git config --global alias.co "checkout"
git config --global alias.ci "commit"
git config --global alias.st "status"
git config --global alias.br "branch"
git config --global alias.hist "log --pretty=format:\"%h %ad | %s%d [%an]\" --graph --date=short --color"
git config --global alias.type "cat-file -t"
git config --global alias.dump "cat-file -p"
