 #!/bin/#!/bin/sh

aur=$(pacaur -Qum 2> /dev/null | wc -l);
echo "AUR: ${aur}"
