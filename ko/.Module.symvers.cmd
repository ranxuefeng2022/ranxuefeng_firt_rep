cmd_/root/ko/Module.symvers := sed 's/\.ko$$/\.o/' /root/ko/modules.order | scripts/mod/modpost -m -a  -o /root/ko/Module.symvers -e -i Module.symvers   -T -
