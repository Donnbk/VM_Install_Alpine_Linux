#!/bin/sh

echo -e "#!/bin/sh \n
#/media/cdrom/apks \n
http://mirror.xtom.com.hk/alpine/v3.22/main \n
http://mirror.xtom.com.hk/alpine/v3.22/community \n
http://mirror.xtom.com.hk/alpine/edge/main \n
http://mirror.xtom.com.hk/alpine/edge/community \n
" >/etc/apk/repositories