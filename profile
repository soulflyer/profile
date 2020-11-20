echo "hello from .profile"
#echo $PATH
hostspecific=.`hostname | tr '[:upper:]' '[:lower:]' | sed s/\.local// | sed s/\.site//`_profile
if [ -f ~/"$hostspecific" ]
then
    . ~/"$hostspecific"
fi

export PATH=~/bin:/usr/local/bin:$PATH:/usr/bin:/bin:/usr/sbin:/sbin
export EMAIL="iain@soulflyer.co.uk"
