# Defined in /var/folders/2w/4n6yywsd1px9fll2dfsvrn5w0000gn/T//fish.SeI6ll/fish_title.fish @ line 1
function fish_title
	if [ (status current-command) = 'fish' ]
        echo (prompt_pwd)
    else
        echo (status current-command)
    end
end
