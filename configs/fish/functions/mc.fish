# Defined in - @ line 0
function mc --description 'alias mc=sudo minicom -D /dev/ttyUSB0 -t screen-256color -c on'
	sudo minicom -D /dev/ttyUSB0 -t screen-256color -c on $argv;
end
