cmd_/root/ko/modules.order := {   echo /root/ko/hello.ko; :; } | awk '!x[$$0]++' - > /root/ko/modules.order
