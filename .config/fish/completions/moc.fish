set mozconfig_files (ls ~/mozconfigs | string split " " | string replace -ra "^mozconfig_" "")

complete -fc moc -a "$mozconfig_files"
