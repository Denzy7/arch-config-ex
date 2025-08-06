if status is-interactive
    # Commands to run in interactive sessions can go here
end
#shitty transparency
#[ -n 3 ] && sleep .1 && transset-df -a >/dev/null

# Created by `pipx` on 2021-12-13 20:55:31
set PATH $PATH /home/denzy/.local/bin
set -x MANPAGER "nvim +Man!"

alias sshtrmx 'ssh u0_a147@192.168.43.1 -p 8022 -i $HOME/pk-droid'
alias netusage 'vnstati -ru -L -h -o - | feh -'

set TMX_HOME /data/data/com.termux/files/home

set SD /storage/0000-0000
set ANDROID_SDK ~/Android/Sdk
set ANDROID_HOME $ANDROID_SDK
set ANDROID_NDK $ANDROID_SDK/ndk/23.1.7779620

# fish flatpak fix
set -l xdg_data_home $XDG_DATA_HOME ~/.local/share
set -gx --path XDG_DATA_DIRS $xdg_data_home[1]/flatpak/exports/share:/var/lib/flatpak/exports/share:/usr/local/share:/usr/share

for flatpakdir in ~/.local/share/flatpak/exports/bin /var/lib/flatpak/exports/bin
    if test -d $flatpakdir
        contains $flatpakdir $PATH; or set -a PATH $flatpakdir
    end
end

# thefuck --alias | source
