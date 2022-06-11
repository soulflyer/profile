# https://apple.stackexchange.com/a/334635
# Variables    
app_name="";
app_path_and_name="";
path_to_lsregister="/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/";

# If run without arguments, issue a usage summary and exit
if [[ "$1" == "" ]]; then
    echo "$(basename $0): returns name of bundle applications’s executable file";
    echo "usage: $(basename $0) [application name]"; 
    exit 0;
fi;

# If argument doesn't end with '.app', append it
if [[ "$1" =~ \.app$ ]]; then
    app_name="$1"
else
    app_name="$1.app";
fi;

# Look for the path of the application bundle
# Search /Applicatinos first
app_path_and_name="$(find /Applications -type d -name "$app_name" -maxdepth 5 | grep -m 1 "$app_name")";
# If not found, search the the LaunchServices database (this is the time-consuming task)
test "$app_path_and_name" || app_path_and_name="$($path_to_lsregister/lsregister -dump | grep -v /Volumes | egrep --max-count 1 "/$app_name$" | sed 's:.* \(/.*\):\1:')"
# Check if Info.plist exists and is readable
if [[ -r "$app_path_and_name/Contents/Info.plist" ]]; then
    # Extract the CFBundleExecutable key that contains the name of the executable and print it to standard output
    echo "$app_path_and_name/Contents/MacOS/$(defaults read "$app_path_and_name/Contents/Info.plist" CFBundleExecutable)";
    exit 0;
else
    echo "Application '$1' not found";
    exit 1
fi
