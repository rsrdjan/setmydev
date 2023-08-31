#|/bin/ksh

OK="\033[32m[+] \033[0m"
WR="\033[31m[!] \033[0m"

VIMBIN="/usr/local/bin/vim"
GITBIN="/usr/local/bin/git"
LIBCLANG="/usr/local/lib/libclang.so.8.2"

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
echo "Done. Enjoy."

