echo "install tmux ..."
brew install tmux

echo "install tmux config ..."
cp -r ./.tmux.conf ~/

echo "install tmux plugin ..."
mkdir -p ~/.tmux
tar -zxvf ./plugins.tar.gz -C ~/.tmux/
