# generate vmlinux header
vmlinux.h:
	bpftool btf dump file /sys/kernel/btf/vmlinux format c > vmlinux.h

# build bpf kernel object file
bootstrap.bpf.o: bootstrap.bpf.c vmlinux.h bootstrap.h
	clang -g -O2 -target bpf -c $< -o $@

# generate skeleton
bootstrap.skel.h: bootstrap.bpf.o
	bpftool gen skeleton $< > $@

# build app
bootstrap: bootstrap.c bootstrap.skel.h bootstrap.h
	clang -g $< -lbpf -lelf -lz -o $@
