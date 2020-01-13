# TODO:
# - List existing mozconfigs with comment
# - fuzzy match mozconfig

function moc -a selected -d "mozconfig configuration"
  set_color green
  if not count $argv > /dev/null
    echo Currently using:
    command cat ./mozconfig
    return 0
  end

  if not test -f ~/mozconfigs/mozconfig_$selected
    set_color red
    echo Could not find ~/mozconfigs/mozconfig_$selected
    set_color normal
    return 1
  end

  command ln -sf ~/mozconfigs/mozconfig_$selected mozconfig
  echo Now using ~/mozconfigs/mozconfig_$selected
  set_color normal
  cat ~/mozconfigs/mozconfig_$selected
end
