# Defined in - @ line 0
function gshow --description 'alias gshow=git difftool HEAD~1 HEAD'
	git difftool HEAD~1 HEAD $argv;
end
