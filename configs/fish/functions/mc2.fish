# Defined in - @ line 0
function mc2 --description 'alias mc2=sudo minicom -D /dev/ttyUSB1 -t screen-256color -c on'
	sudo minicom -D /dev/ttyUSB1 -t screen-256color -c on $argv;
end
