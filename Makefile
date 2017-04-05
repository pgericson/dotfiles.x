
all: depends symlink_clean symlink bin_folder fonts update

update:
	xrdb -merge ~/.Xresources

symlink:
	ln -s `pwd`/i3status ~/.i3status.conf
	mkdir ~/.i3
	ln -s `pwd`/i3config ~/.i3/config
	mkdir ~/.config/dunst
	ln -s `pwd`/dunstrc ~/.config/dunst/dunstrc
	ln -s `pwd`/gtkrc-2.0 ~/.gtkrc-2.0
	ln -s `pwd`/Xresources ~/.Xresources
	mkdir ~/.atom
	ln -s `pwd`/atom-config.cson ~/.atom/config.cson
	ln -s `pwd`/atom-keymap.cson ~/.atom/keymap.cson

bin_folder:
	mkdir -p ~/bin
	# Don't overwrite anything
	for x in bin/*; do \
		if [ ! -f ~/$$x  ]; then\
		ln -s `pwd`/$$x ~/$$x;\
		fi; \
	done

symlink_clean:
	rm -rf ~/.i3status.conf ~/.i3  ~/.config/dunst ~/.gtkrc-2.0 ~/.Xresources

depends:
	# TODO add desktop dependencies
	sudo apt-get install rxvt-unicode-256color # nice temrinal
	sudo apt-get install xautolock # lock screen after X time
	
	# rxvt depends
	sudo apt-get install xclip # copy paste for terminal
	sudo cp rxvt/urxvtclip /usr/lib/urxvt/perl/clipboard
	
	# atom install
	sudo add-apt-repository ppa:webupd8team/atom
	sudo apt update; sudo apt install atom

dropbox:
	./setup_drobox.sh

fonts:
	mkdir ~/.fonts
	./setup_font_monaco.sh
	./setup_font_menlo.sh
	./setup_font_mononoki.sh
	./setup_font_fira_sans.sh
	fc-cache -vf ~/.fonts

