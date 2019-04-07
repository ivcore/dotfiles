# Fish shell version of http://nparikh.org/notes/zshrc.txt
function extract --description "Extracts compressed files"
    switch "$argv[1]"
    case "*.bz2"
	bunzip2 $argv[1]
    case "*.gz"
	gunzip $argv[1]
    case "*.tar"
	tar -xvf $argv[1]
    case "*.tar.bz2"
	tar -jxvf $argv[1]
    case "*.tar.gz"
	tar -zxvf $argv[1]
    case "*.tbz2"
	tar -jxvf $argv[1]
    case "*.tgz"
	tar -zxvf $argv[1]
    case "*.pax"
	cat $argv[1] | pax -r
    case "*.pax.Z"
	uncompress $argv[1] --stdout | pax -r
    case "*.xz"
	xz --keep -d $argv[1]
    case "*.zip"
	unzip $argv[1]
    case "*.Z"
	uncompress $argv[1]
    case "*.ZIP"
	unzip $argv[1]
    case "*"
	echo "'$argv[1]' cannot be extracted via extract()"
    end
end
