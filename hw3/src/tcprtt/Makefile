# generate vmlinux header
vmlinux.h:
	bpftool btf dump file /sys/kernel/btf/vmlinux format c > vmlinux.h

# build bpf kernel object file
tcprtt.bpf.o: tcprtt.bpf.c vmlinux.h
	clang -g -O2 -target bpf -c $< -o $@

tcprtt_tp.bpf.o: tcprtt_tp.bpf.c vmlinux.h
	clang -g -O2 -target bpf -c $< -o $@

# generate skeleton
tcprtt.skel.h: tcprtt.bpf.o
	bpftool gen skeleton $< > $@

tcprtt_tp.skel.h: tcprtt_tp.bpf.o
	bpftool gen skeleton $< > $@

# build app
tcprtt: tcprtt.c tcprtt.skel.h
	clang -g $< -lbpf -lelf -lz -o $@

tcprtt_tp: tcprtt_tp.c tcprtt_tp.skel.h
	clang -g $< -lbpf -lelf -lz -o $@
