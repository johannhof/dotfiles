function fish_greeting
  if command -v fortune > /dev/null
    fortune
  end
end