#|/bin/ksh

OK="\033[32m[+] \033[0m"
WR="\033[31m[!] \033[0m"

VIMBIN="/usr/local/bin/vim"
GITBIN="/usr/local/bin/git"
LIBCLANG="/usr/local/lib/libclang.so.8.2"
EGDB="/usr/local/bin/egdb"

clear
if [[ -e "$VIMBIN" ]]
then
	echo -n $OK
	echo "Vim found. Good."
else
	echo -n $WR
	echo "No vim installed. Installing vim..."
	doas pkg_add -U vim
fi
if [[ -e "$GITBIN" ]]
then
	echo -n $OK
	echo "Git found. Good."
else
	echo -n $WR
	echo "No git installed. Installing git..."
	doas pkg_add -U git
fi

if [[ -e "$LIBCLANG" ]]
then
	echo -n $OK
	echo "LLVM found. Good."
else
	echo -n $WR
	echo "No llvm installed. Installing llvm..."
	doas pkg_add -U llvm
fi

if [[ -e "$EGDB" ]]
then
	echo -n $OK
	echo "eGdb found. Good."
else
	echo -n $WR
	echo "No eGdb installed. Installing egdb..."
	doas pkg_add -U gdb
fi

echo -n $OK
echo "Getting Vundle..."
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
echo -n $OK
echo "Copying .vimrc..."
cp vimrc-template ~/.vimrc
echo -n $OK
echo "Installing plugins..."
vim +PluginInstall +qall
echo -n $OK
echo "Copying .profile..."
cp profile-template ~/.profile
echo "Done. Don't forget to logout for .profile to take effect."
