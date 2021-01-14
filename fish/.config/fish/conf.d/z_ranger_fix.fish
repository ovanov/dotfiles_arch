#---------RANGER Fix-------
function ranger

	if [ -z "$RANGER_LEVEL" ]
		/usr/bin/ranger $argv
	else
		exit
	end
end
