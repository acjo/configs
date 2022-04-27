Emacs Instructions for macOS 
brew tap d12frosted/emacs-plus
brew install emacs-plus
brew linkapps emacs-plus

#execute all these commands from the HOME directory.
mv ~/.emacs.d ~/.emacs.d_OLD_SOMETHNG
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
cd ~/.emacs.d
git checkout develop
ln -sf ~/configs/.spacemacs ~/.spacemacs 

START EMACS


Notes for javascript tools
#npm install -g tern
#npm install -g js-beautify
#npm install -g jshint

