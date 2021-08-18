#!/usr/bin/env fish
fc-cache -v

if count $argv
    firefox $argv
else
    firefox myiplocation.org
end
