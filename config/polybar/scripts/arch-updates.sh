 #!/bin/#!/bin/sh

arch=$(checkupdates 2> /dev/null | wc -l);
echo "ARCH: ${arch}"
