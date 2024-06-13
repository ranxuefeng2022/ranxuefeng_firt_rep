cmd_/root/ko/hello.ko := ld -r  -m elf_x86_64 -z noexecstack   --build-id=sha1  -T scripts/module.lds -o /root/ko/hello.ko /root/ko/hello.o /root/ko/hello.mod.o;  true
