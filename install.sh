# Author Mark Tareshawty
# tarebyte@gmail.com
# @tarebyte

#-- Install RVM and Get Ruby Setup --#
clear
#echo Locating Stable RVM
#\curl -L https://get.rvm.io | bash -s stable --ruby

#-- Install Homebrew --#
ruby -e "$(curl -fsSkL raw.github.com/mxcl/homebrew/go)"

#-- Install useful developer tools used from Homebrew --#
brew install {git, pbcopy}

#-- Setup SSH Key --#

