#!/bin/bash

print_help() {
    echo "Usage: slideshow.sh [-p PATH] [-i INTERVAL] [-h|--help]"
    echo
    echo "Options:"
    echo -e "  -i, --interval INTERVAL \t Time interval (in seconds) between wallpaper changes"
    echo -e "  -p, --path PATH\tpath to load wallpapers from. Default value is ~/Pictures/Wallpapers. Does not recursively load wallpapers"
    echo -e "  -m, --monitor MONITOR_NAME \t monitor for which the wallpapers must be applied. Use hyprctl monitors to see the list of monitors."
    echo "  -h, --help               Print this help message and exit"
}

preload_wallpapers() {
    wallpaper_dir=$1
    wallpapers=$(find "$wallpaper_dir" -type f)
    wallpapers_string=""
    OLDIFS=$IFS
    IFS=$'\n'
    for wallpaper in $wallpapers; do
        wallpapers_string+="preload = $wallpaper\n"
    done

    # Extract the last 4 lines before updating the configuration file
    tail_lines=$(tail -n 4 ~/.config/hypr/hyprpaper.conf)

    echo -en "$wallpapers_string" > ~/.config/hypr/hyprpaper.conf
    echo -en "$tail_lines" >> ~/.config/hypr/hyprpaper.conf
    IFS=$OLDIFS
}

# set the path to the wallpaper directory
wallpaper_dir="$HOME/Pictures/Wallpapers/"

# parse the command line arguments
interval=180
while getopts ":hi:p:m:-:" opt; do
    case $opt in
    -)
        case "${OPTARG}" in
        interval)
            interval=$OPTIND
            OPTIND=$((OPTIND + 1))
            ;;
        help)
            print_help
            exit 0
            ;;
        path)
            wallpaper_dir=$OPTIND
            OPTIND=$((OPTIND + 1))
            ;;
        esac
        ;;
    h)
        print_help
        exit 0
        ;;
    i)
        interval=$OPTARG
        ;;
    p)
        wallpaper_dir=$OPTARG
        ;;
    m)
        monitors=$OPTARG
        ;;

    \?)
        echo "Invalid option: -$OPTARG" >&2
        exit 1
        ;;
    :)
        echo "Option -$OPTARG requires an argument." >&2
        exit 1
        ;;
    esac
done
if [ -z "$monitors" ]; then
    echo "Error: -m/--monitors option is required" >&2
    exit 1
fi
preload_wallpapers "$wallpaper_dir"
# get a list of all the wallpapers in the wallpaper directory
readarray -d '' wallpapers < <(find "$wallpaper_dir" -type f -print0)
killall hyprpaper
hyprpaper >/dev/null 2>&1 &
disown

idx=0
n=${#wallpapers[@]}
while true; do
    # wait for the specified interval
    sleep "$interval"
    current_wallpaper=${wallpapers[$idx]}
    wallpaper_cmd="hyprctl hyprpaper wallpaper $monitors,\"$current_wallpaper\""
    eval "$wallpaper_cmd"
    idx=$(((idx + 1) % n))
done
