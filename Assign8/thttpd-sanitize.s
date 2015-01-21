	.file	"thttpd.c"
	.bss
	.align 32
	.type	argv0, @object
	.size	argv0, 4
argv0:
	.zero	64
	.align 32
	.type	debug, @object
	.size	debug, 4
debug:
	.zero	64
	.align 32
	.type	port, @object
	.size	port, 2
port:
	.zero	64
	.align 32
	.type	dir, @object
	.size	dir, 4
dir:
	.zero	64
	.align 32
	.type	data_dir, @object
	.size	data_dir, 4
data_dir:
	.zero	64
	.align 32
	.type	do_chroot, @object
	.size	do_chroot, 4
do_chroot:
	.zero	64
	.align 32
	.type	no_log, @object
	.size	no_log, 4
no_log:
	.zero	64
	.align 32
	.type	no_symlink_check, @object
	.size	no_symlink_check, 4
no_symlink_check:
	.zero	64
	.align 32
	.type	do_vhost, @object
	.size	do_vhost, 4
do_vhost:
	.zero	64
	.align 32
	.type	do_global_passwd, @object
	.size	do_global_passwd, 4
do_global_passwd:
	.zero	64
	.align 32
	.type	cgi_pattern, @object
	.size	cgi_pattern, 4
cgi_pattern:
	.zero	64
	.align 32
	.type	cgi_limit, @object
	.size	cgi_limit, 4
cgi_limit:
	.zero	64
	.align 32
	.type	url_pattern, @object
	.size	url_pattern, 4
url_pattern:
	.zero	64
	.align 32
	.type	no_empty_referers, @object
	.size	no_empty_referers, 4
no_empty_referers:
	.zero	64
	.align 32
	.type	local_pattern, @object
	.size	local_pattern, 4
local_pattern:
	.zero	64
	.align 32
	.type	logfile, @object
	.size	logfile, 4
logfile:
	.zero	64
	.align 32
	.type	throttlefile, @object
	.size	throttlefile, 4
throttlefile:
	.zero	64
	.align 32
	.type	hostname, @object
	.size	hostname, 4
hostname:
	.zero	64
	.align 32
	.type	pidfile, @object
	.size	pidfile, 4
pidfile:
	.zero	64
	.align 32
	.type	user, @object
	.size	user, 4
user:
	.zero	64
	.align 32
	.type	charset, @object
	.size	charset, 4
charset:
	.zero	64
	.align 32
	.type	p3p, @object
	.size	p3p, 4
p3p:
	.zero	64
	.align 32
	.type	max_age, @object
	.size	max_age, 4
max_age:
	.zero	64
	.align 32
	.type	throttles, @object
	.size	throttles, 4
throttles:
	.zero	64
	.align 32
	.type	numthrottles, @object
	.size	numthrottles, 4
numthrottles:
	.zero	64
	.align 32
	.type	maxthrottles, @object
	.size	maxthrottles, 4
maxthrottles:
	.zero	64
	.align 32
	.type	connects, @object
	.size	connects, 4
connects:
	.zero	64
	.align 32
	.type	num_connects, @object
	.size	num_connects, 4
num_connects:
	.zero	64
	.align 32
	.type	max_connects, @object
	.size	max_connects, 4
max_connects:
	.zero	64
	.align 32
	.type	first_free_connect, @object
	.size	first_free_connect, 4
first_free_connect:
	.zero	64
	.align 32
	.type	httpd_conn_count, @object
	.size	httpd_conn_count, 4
httpd_conn_count:
	.zero	64
	.align 32
	.type	hs, @object
	.size	hs, 4
hs:
	.zero	64
	.globl	terminate
	.align 32
	.type	terminate, @object
	.size	terminate, 4
terminate:
	.zero	64
	.comm	start_time,4,4
	.comm	stats_time,4,4
	.comm	stats_connections,4,4
	.comm	stats_bytes,4,4
	.comm	stats_simultaneous,4,4
	.align 32
	.type	got_hup, @object
	.size	got_hup, 4
got_hup:
	.zero	64
	.align 32
	.type	got_usr1, @object
	.size	got_usr1, 4
got_usr1:
	.zero	64
	.align 32
	.type	watchdog_flag, @object
	.size	watchdog_flag, 4
watchdog_flag:
	.zero	64
	.section	.rodata
	.align 32
.LC0:
	.string	"exiting due to signal %d"
	.zero	39
	.text
	.type	handle_term, @function
handle_term:
.LASANPC0:
.LFB0:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$8, %esp
	call	shut_down
	subl	$4, %esp
	pushl	8(%ebp)
	pushl	$.LC0
	pushl	$5
	call	syslog
	addl	$16, %esp
	call	closelog
	call	__asan_handle_no_return
	subl	$12, %esp
	pushl	$1
	call	exit
	.cfi_endproc
.LFE0:
	.size	handle_term, .-handle_term
	.globl	__asan_stack_malloc_1
	.section	.rodata
.LC1:
	.string	"1 32 4 6 status "
	.align 32
.LC2:
	.string	"child wait - %m"
	.zero	48
	.text
	.type	handle_chld, @function
handle_chld:
.LASANPC1:
.LFB1:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$140, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	leal	-120(%ebp), %edi
	movl	%edi, -148(%ebp)
	cmpl	$0, __asan_option_detect_stack_use_after_return
	je	.L2
	subl	$8, %esp
	pushl	%edi
	pushl	$96
	call	__asan_stack_malloc_1
	addl	$16, %esp
	movl	%eax, %edi
.L2:
	leal	96(%edi), %eax
	movl	%eax, -144(%ebp)
	movl	$1102416563, (%edi)
	movl	$.LC1, 4(%edi)
	movl	$.LASANPC1, 8(%edi)
	movl	%edi, %eax
	shrl	$3, %eax
	movl	%eax, -140(%ebp)
	movl	$-235802127, 536870912(%eax)
	movl	$-185273340, 536870916(%eax)
	movl	$-202116109, 536870920(%eax)
	call	__errno_location
	movl	%eax, %ebx
	movl	%ebx, %ecx
	movl	%ecx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %edx
	testb	%dl, %dl
	setne	%al
	movl	%eax, %esi
	movl	%ecx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	setge	%al
	andl	%esi, %eax
	testb	%al, %al
	je	.L6
	subl	$12, %esp
	pushl	%ecx
	call	__asan_report_load4
.L6:
	movl	(%ebx), %eax
	movl	%eax, -128(%ebp)
.L20:
	subl	$4, %esp
	pushl	$1
	movl	-144(%ebp), %eax
	subl	$64, %eax
	pushl	%eax
	pushl	$-1
	call	waitpid
	addl	$16, %esp
	movl	%eax, -124(%ebp)
	cmpl	$0, -124(%ebp)
	jne	.L7
	jmp	.L8
.L7:
	cmpl	$0, -124(%ebp)
	jns	.L9
	call	__errno_location
	movl	%eax, %ebx
	movl	%ebx, %ecx
	movl	%ecx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %edx
	testb	%dl, %dl
	setne	%al
	movl	%eax, %esi
	movl	%ecx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	setge	%al
	andl	%esi, %eax
	testb	%al, %al
	je	.L10
	subl	$12, %esp
	pushl	%ecx
	call	__asan_report_load4
.L10:
	movl	(%ebx), %eax
	cmpl	$4, %eax
	je	.L11
	call	__errno_location
	movl	%eax, %ebx
	movl	%ebx, %ecx
	movl	%ecx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %edx
	testb	%dl, %dl
	setne	%al
	movl	%eax, %esi
	movl	%ecx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	setge	%al
	andl	%esi, %eax
	testb	%al, %al
	je	.L12
	subl	$12, %esp
	pushl	%ecx
	call	__asan_report_load4
.L12:
	movl	(%ebx), %eax
	cmpl	$11, %eax
	jne	.L13
.L11:
	jmp	.L14
.L13:
	call	__errno_location
	movl	%eax, %ebx
	movl	%ebx, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%al
	movl	%eax, %esi
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%esi, %eax
	testb	%al, %al
	je	.L15
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_load4
.L15:
	movl	(%ebx), %eax
	cmpl	$10, %eax
	je	.L16
	subl	$8, %esp
	pushl	$.LC2
	pushl	$3
	call	syslog
	addl	$16, %esp
	jmp	.L8
.L16:
	jmp	.L8
.L9:
	movl	hs, %eax
	testl	%eax, %eax
	je	.L14
	movl	hs, %edx
	leal	20(%edx), %eax
	movl	%eax, %ebx
	movl	%ebx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%al
	movl	%eax, %esi
	movl	%ebx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%esi, %eax
	testb	%al, %al
	je	.L17
	subl	$12, %esp
	pushl	%ebx
	call	__asan_report_load4
.L17:
	movl	20(%edx), %eax
	subl	$1, %eax
	movl	%eax, 20(%edx)
	movl	hs, %ebx
	leal	20(%ebx), %eax
	movl	%eax, %ecx
	movl	%ecx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %edx
	testb	%dl, %dl
	setne	%al
	movl	%eax, %esi
	movl	%ecx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	setge	%al
	andl	%esi, %eax
	testb	%al, %al
	je	.L18
	subl	$12, %esp
	pushl	%ecx
	call	__asan_report_load4
.L18:
	movl	20(%ebx), %eax
	testl	%eax, %eax
	jns	.L14
	movl	hs, %ebx
	leal	20(%ebx), %eax
	movl	%eax, %ecx
	movl	%ecx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %edx
	testb	%dl, %dl
	setne	%al
	movl	%eax, %esi
	movl	%ecx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	setge	%al
	andl	%esi, %eax
	testb	%al, %al
	je	.L19
	subl	$12, %esp
	pushl	%ecx
	call	__asan_report_store4
.L19:
	movl	$0, 20(%ebx)
.L14:
	jmp	.L20
.L8:
	call	__errno_location
	movl	%eax, %ebx
	movl	%ebx, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%al
	movl	%eax, %esi
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%esi, %eax
	testb	%al, %al
	je	.L21
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_store4
.L21:
	movl	-128(%ebp), %eax
	movl	%eax, (%ebx)
	cmpl	%edi, -148(%ebp)
	je	.L3
	movl	$1172321806, (%edi)
	movl	-140(%ebp), %eax
	movl	$-168430091, 536870912(%eax)
	movl	$-168430091, 536870916(%eax)
	movl	$-168430091, 536870920(%eax)
	jmp	.L4
.L3:
	movl	-140(%ebp), %eax
	movl	$0, 536870912(%eax)
	movl	$0, 536870916(%eax)
	movl	$0, 536870920(%eax)
.L4:
	leal	-12(%ebp), %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE1:
	.size	handle_chld, .-handle_chld
	.type	handle_hup, @function
handle_hup:
.LASANPC2:
.LFB2:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%esi
	pushl	%ebx
	subl	$16, %esp
	.cfi_offset 6, -12
	.cfi_offset 3, -16
	call	__errno_location
	movl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%esi, %ecx
	testb	%cl, %cl
	je	.L23
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L23:
	movl	(%edx), %eax
	movl	%eax, -12(%ebp)
	movl	$1, got_hup
	call	__errno_location
	movl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%esi, %ecx
	testb	%cl, %cl
	je	.L24
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_store4
.L24:
	movl	-12(%ebp), %eax
	movl	%eax, (%edx)
	leal	-8(%ebp), %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE2:
	.size	handle_hup, .-handle_hup
	.section	.rodata
	.align 32
.LC3:
	.string	"exiting"
	.zero	56
	.text
	.type	handle_usr1, @function
handle_usr1:
.LASANPC3:
.LFB3:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$8, %esp
	movl	num_connects, %eax
	testl	%eax, %eax
	jne	.L26
	call	shut_down
	subl	$8, %esp
	pushl	$.LC3
	pushl	$5
	call	syslog
	addl	$16, %esp
	call	closelog
	call	__asan_handle_no_return
	subl	$12, %esp
	pushl	$0
	call	exit
.L26:
	movl	$1, got_usr1
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE3:
	.size	handle_usr1, .-handle_usr1
	.type	handle_usr2, @function
handle_usr2:
.LASANPC4:
.LFB4:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%esi
	pushl	%ebx
	subl	$16, %esp
	.cfi_offset 6, -12
	.cfi_offset 3, -16
	call	__errno_location
	movl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%esi, %ecx
	testb	%cl, %cl
	je	.L28
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L28:
	movl	(%edx), %eax
	movl	%eax, -12(%ebp)
	subl	$12, %esp
	pushl	$0
	call	logstats
	addl	$16, %esp
	call	__errno_location
	movl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%esi, %ecx
	testb	%cl, %cl
	je	.L29
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_store4
.L29:
	movl	-12(%ebp), %eax
	movl	%eax, (%edx)
	leal	-8(%ebp), %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE4:
	.size	handle_usr2, .-handle_usr2
	.section	.rodata
	.align 32
.LC4:
	.string	"/tmp"
	.zero	59
	.text
	.type	handle_alrm, @function
handle_alrm:
.LASANPC5:
.LFB5:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%esi
	pushl	%ebx
	subl	$16, %esp
	.cfi_offset 6, -12
	.cfi_offset 3, -16
	call	__errno_location
	movl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%esi, %ecx
	testb	%cl, %cl
	je	.L31
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L31:
	movl	(%edx), %eax
	movl	%eax, -12(%ebp)
	movl	watchdog_flag, %eax
	testl	%eax, %eax
	jne	.L32
	subl	$12, %esp
	pushl	$.LC4
	call	chdir
	addl	$16, %esp
	call	__asan_handle_no_return
	call	abort
.L32:
	movl	$0, watchdog_flag
	subl	$12, %esp
	pushl	$360
	call	alarm
	addl	$16, %esp
	call	__errno_location
	movl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%esi, %ecx
	testb	%cl, %cl
	je	.L33
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_store4
.L33:
	movl	-12(%ebp), %eax
	movl	%eax, (%edx)
	leal	-8(%ebp), %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE5:
	.size	handle_alrm, .-handle_alrm
	.section	.rodata
	.align 32
.LC5:
	.string	"-"
	.zero	62
	.align 32
.LC6:
	.string	"re-opening logfile"
	.zero	45
	.align 32
.LC7:
	.string	"a"
	.zero	62
	.align 32
.LC8:
	.string	"re-opening %.80s - %m"
	.zero	42
	.text
	.type	re_open_logfile, @function
re_open_logfile:
.LASANPC6:
.LFB6:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	no_log, %eax
	testl	%eax, %eax
	jne	.L35
	movl	hs, %eax
	testl	%eax, %eax
	jne	.L36
.L35:
	jmp	.L34
.L36:
	movl	logfile, %eax
	testl	%eax, %eax
	je	.L34
	movl	logfile, %eax
	subl	$8, %esp
	pushl	$.LC5
	pushl	%eax
	call	strcmp
	addl	$16, %esp
	testl	%eax, %eax
	je	.L34
	subl	$8, %esp
	pushl	$.LC6
	pushl	$5
	call	syslog
	addl	$16, %esp
	movl	logfile, %eax
	subl	$8, %esp
	pushl	$.LC7
	pushl	%eax
	call	fopen
	addl	$16, %esp
	movl	%eax, -12(%ebp)
	cmpl	$0, -12(%ebp)
	jne	.L38
	movl	logfile, %eax
	subl	$4, %esp
	pushl	%eax
	pushl	$.LC8
	pushl	$2
	call	syslog
	addl	$16, %esp
	jmp	.L34
.L38:
	subl	$12, %esp
	pushl	-12(%ebp)
	call	fileno
	addl	$16, %esp
	subl	$4, %esp
	pushl	$1
	pushl	$2
	pushl	%eax
	call	fcntl
	addl	$16, %esp
	movl	hs, %eax
	subl	$8, %esp
	pushl	-12(%ebp)
	pushl	%eax
	call	httpd_set_logfp
	addl	$16, %esp
.L34:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE6:
	.size	re_open_logfile, .-re_open_logfile
	.globl	__asan_stack_malloc_7
	.section	.rodata
	.align 4
.LC9:
	.string	"6 32 4 5 gotv4 96 4 5 gotv6 160 8 2 tv 224 128 3 sa4 384 128 3 sa6 544 4097 3 cwd "
	.globl	__asan_stack_free_7
	.align 32
.LC10:
	.string	"can't find any valid address"
	.zero	35
	.align 32
.LC11:
	.string	"%s: can't find any valid address\n"
	.zero	62
	.align 32
.LC12:
	.string	"unknown user - '%.80s'"
	.zero	41
	.align 32
.LC13:
	.string	"%s: unknown user - '%s'\n"
	.zero	39
	.align 32
.LC14:
	.string	"/dev/null"
	.zero	54
	.align 32
.LC15:
	.string	"%.80s - %m"
	.zero	53
	.align 32
.LC16:
	.string	"logfile is not an absolute path, you may not be able to re-open it"
	.zero	61
	.align 32
.LC17:
	.string	"%s: logfile is not an absolute path, you may not be able to re-open it\n"
	.zero	56
	.align 32
.LC18:
	.string	"fchown logfile - %m"
	.zero	44
	.align 32
.LC19:
	.string	"fchown logfile"
	.zero	49
	.align 32
.LC20:
	.string	"chdir - %m"
	.zero	53
	.align 32
.LC21:
	.string	"chdir"
	.zero	58
	.align 32
.LC22:
	.string	"/"
	.zero	62
	.align 32
.LC23:
	.string	"daemon - %m"
	.zero	52
	.align 32
.LC24:
	.string	"w"
	.zero	62
	.align 32
.LC25:
	.string	"%d\n"
	.zero	60
	.align 32
.LC26:
	.string	"fdwatch initialization failure"
	.zero	33
	.align 32
.LC27:
	.string	"chroot - %m"
	.zero	52
	.align 32
.LC28:
	.string	"chroot"
	.zero	57
	.align 32
.LC29:
	.string	"logfile is not within the chroot tree, you will not be able to re-open it"
	.zero	54
	.align 32
.LC30:
	.string	"%s: logfile is not within the chroot tree, you will not be able to re-open it\n"
	.zero	49
	.align 32
.LC31:
	.string	"chroot chdir - %m"
	.zero	46
	.align 32
.LC32:
	.string	"chroot chdir"
	.zero	51
	.align 32
.LC33:
	.string	"data_dir chdir - %m"
	.zero	44
	.align 32
.LC34:
	.string	"data_dir chdir"
	.zero	49
	.align 32
.LC35:
	.string	"tmr_create(occasional) failed"
	.zero	34
	.align 32
.LC36:
	.string	"tmr_create(idle) failed"
	.zero	40
	.align 32
.LC37:
	.string	"tmr_create(update_throttles) failed"
	.zero	60
	.align 32
.LC38:
	.string	"tmr_create(show_stats) failed"
	.zero	34
	.align 32
.LC39:
	.string	"setgroups - %m"
	.zero	49
	.align 32
.LC40:
	.string	"setgid - %m"
	.zero	52
	.align 32
.LC41:
	.string	"initgroups - %m"
	.zero	48
	.align 32
.LC42:
	.string	"setuid - %m"
	.zero	52
	.align 32
.LC43:
	.string	"started as root without requesting chroot(), warning only"
	.zero	38
	.align 32
.LC44:
	.string	"out of memory allocating a connecttab"
	.zero	58
	.align 32
.LC45:
	.string	"fdwatch - %m"
	.zero	51
	.text
	.globl	main
	.type	main, @function
main:
.LASANPC7:
.LFB7:
	.cfi_startproc
	leal	4(%esp), %ecx
	.cfi_def_cfa 1, 0
	andl	$-16, %esp
	pushl	-4(%ecx)
	pushl	%ebp
	.cfi_escape 0x10,0x5,0x2,0x75,0
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	pushl	%ecx
	.cfi_escape 0xf,0x3,0x75,0x70,0x6
	.cfi_escape 0x10,0x7,0x2,0x75,0x7c
	.cfi_escape 0x10,0x6,0x2,0x75,0x78
	.cfi_escape 0x10,0x3,0x2,0x75,0x74
	subl	$4824, %esp
	movl	%ecx, %ebx
	movl	4(%ebx), %eax
	movl	%eax, -4780(%ebp)
	leal	-4728(%ebp), %eax
	cmpl	$0, __asan_option_detect_stack_use_after_return
	je	.L39
	subl	$8, %esp
	pushl	%eax
	pushl	$4700
	call	__asan_stack_malloc_7
	addl	$16, %esp
.L39:
	leal	4704(%eax), %edx
	movl	%edx, -4784(%ebp)
	movl	$1102416563, (%eax)
	movl	$.LC9, 4(%eax)
	movl	$.LASANPC7, 8(%eax)
	shrl	$3, %eax
	movl	$-235802127, 536870912(%eax)
	movl	$-185273340, 536870916(%eax)
	movl	$-218959118, 536870920(%eax)
	movl	$-185273340, 536870924(%eax)
	movl	$-218959118, 536870928(%eax)
	movl	$-185273344, 536870932(%eax)
	movl	$-218959118, 536870936(%eax)
	movl	$-218959118, 536870956(%eax)
	movl	$-218959118, 536870976(%eax)
	movl	$-185273343, 536871492(%eax)
	movl	%gs:20, %eax
	movl	%eax, -28(%ebp)
	xorl	%eax, %eax
	movl	$32767, -4764(%ebp)
	movl	$32767, -4760(%ebp)
	movl	-4780(%ebp), %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%cl
	movl	%ecx, %esi
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L45
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L45:
	movl	-4780(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, argv0
	movl	argv0, %eax
	subl	$8, %esp
	pushl	$47
	pushl	%eax
	call	strrchr
	addl	$16, %esp
	movl	%eax, -4768(%ebp)
	cmpl	$0, -4768(%ebp)
	je	.L46
	addl	$1, -4768(%ebp)
	jmp	.L47
.L46:
	movl	argv0, %eax
	movl	%eax, -4768(%ebp)
.L47:
	subl	$4, %esp
	pushl	$24
	pushl	$9
	pushl	-4768(%ebp)
	call	openlog
	addl	$16, %esp
	subl	$8, %esp
	pushl	-4780(%ebp)
	pushl	(%ebx)
	call	parse_args
	addl	$16, %esp
	call	tzset
	subl	$8, %esp
	movl	-4784(%ebp), %edi
	movl	%edi, %eax
	subl	$4608, %eax
	pushl	%eax
	pushl	$128
	movl	%edi, %eax
	subl	$4320, %eax
	pushl	%eax
	movl	%edi, %eax
	subl	$4672, %eax
	pushl	%eax
	pushl	$128
	movl	%edi, %eax
	subl	$4480, %eax
	pushl	%eax
	call	lookup_hostname
	addl	$32, %esp
	movl	%edi, %eax
	movl	-4672(%eax), %eax
	testl	%eax, %eax
	jne	.L48
	movl	-4784(%ebp), %eax
	movl	-4608(%eax), %eax
	testl	%eax, %eax
	jne	.L48
	subl	$8, %esp
	pushl	$.LC10
	pushl	$3
	call	syslog
	addl	$16, %esp
	movl	argv0, %ecx
	movl	$stderr, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L49
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L49:
	movl	stderr, %eax
	subl	$4, %esp
	pushl	%ecx
	pushl	$.LC11
	pushl	%eax
	call	fprintf
	addl	$16, %esp
	call	__asan_handle_no_return
	subl	$12, %esp
	pushl	$1
	call	exit
.L48:
	movl	$0, numthrottles
	movl	$0, maxthrottles
	movl	$0, throttles
	movl	throttlefile, %eax
	testl	%eax, %eax
	je	.L50
	movl	throttlefile, %eax
	subl	$12, %esp
	pushl	%eax
	call	read_throttlefile
	addl	$16, %esp
.L50:
	call	getuid
	testl	%eax, %eax
	jne	.L51
	movl	user, %eax
	subl	$12, %esp
	pushl	%eax
	call	getpwnam
	addl	$16, %esp
	movl	%eax, -4748(%ebp)
	cmpl	$0, -4748(%ebp)
	jne	.L52
	movl	user, %eax
	subl	$4, %esp
	pushl	%eax
	pushl	$.LC12
	pushl	$2
	call	syslog
	addl	$16, %esp
	movl	user, %ebx
	movl	argv0, %eax
	movl	%eax, -4784(%ebp)
	movl	$stderr, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%cl
	movl	%ecx, %edi
	movl	%eax, %esi
	andl	$7, %esi
	addl	$3, %esi
	movl	%esi, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%edi, %edx
	testb	%dl, %dl
	je	.L53
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L53:
	movl	stderr, %eax
	pushl	%ebx
	pushl	-4784(%ebp)
	pushl	$.LC13
	pushl	%eax
	call	fprintf
	addl	$16, %esp
	call	__asan_handle_no_return
	subl	$12, %esp
	pushl	$1
	call	exit
.L52:
	movl	-4748(%ebp), %eax
	addl	$8, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L54
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L54:
	movl	-4748(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, -4764(%ebp)
	movl	-4748(%ebp), %eax
	addl	$12, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L55
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L55:
	movl	-4748(%ebp), %eax
	movl	12(%eax), %eax
	movl	%eax, -4760(%ebp)
.L51:
	movl	logfile, %eax
	testl	%eax, %eax
	je	.L56
	movl	logfile, %eax
	subl	$8, %esp
	pushl	$.LC14
	pushl	%eax
	call	strcmp
	addl	$16, %esp
	testl	%eax, %eax
	jne	.L57
	movl	$1, no_log
	movl	$0, -4756(%ebp)
	jmp	.L65
.L57:
	movl	logfile, %eax
	subl	$8, %esp
	pushl	$.LC5
	pushl	%eax
	call	strcmp
	addl	$16, %esp
	testl	%eax, %eax
	jne	.L59
	movl	$stdout, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L60
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L60:
	movl	stdout, %eax
	movl	%eax, -4756(%ebp)
	jmp	.L65
.L59:
	movl	logfile, %eax
	subl	$8, %esp
	pushl	$.LC7
	pushl	%eax
	call	fopen
	addl	$16, %esp
	movl	%eax, -4756(%ebp)
	cmpl	$0, -4756(%ebp)
	jne	.L61
	movl	logfile, %eax
	subl	$4, %esp
	pushl	%eax
	pushl	$.LC15
	pushl	$2
	call	syslog
	addl	$16, %esp
	movl	logfile, %eax
	subl	$12, %esp
	pushl	%eax
	call	perror
	addl	$16, %esp
	call	__asan_handle_no_return
	subl	$12, %esp
	pushl	$1
	call	exit
.L61:
	movl	logfile, %edx
	movl	%edx, %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%esi, %ecx
	testb	%cl, %cl
	je	.L62
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load1
.L62:
	movzbl	(%edx), %eax
	cmpb	$47, %al
	je	.L63
	subl	$8, %esp
	pushl	$.LC16
	pushl	$4
	call	syslog
	addl	$16, %esp
	movl	argv0, %ecx
	movl	$stderr, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L64
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L64:
	movl	stderr, %eax
	subl	$4, %esp
	pushl	%ecx
	pushl	$.LC17
	pushl	%eax
	call	fprintf
	addl	$16, %esp
.L63:
	subl	$12, %esp
	pushl	-4756(%ebp)
	call	fileno
	addl	$16, %esp
	subl	$4, %esp
	pushl	$1
	pushl	$2
	pushl	%eax
	call	fcntl
	addl	$16, %esp
	call	getuid
	testl	%eax, %eax
	jne	.L65
	subl	$12, %esp
	pushl	-4756(%ebp)
	call	fileno
	addl	$16, %esp
	subl	$4, %esp
	pushl	-4760(%ebp)
	pushl	-4764(%ebp)
	pushl	%eax
	call	fchown
	addl	$16, %esp
	testl	%eax, %eax
	jns	.L65
	subl	$8, %esp
	pushl	$.LC18
	pushl	$4
	call	syslog
	addl	$16, %esp
	subl	$12, %esp
	pushl	$.LC19
	call	perror
	addl	$16, %esp
	jmp	.L65
.L56:
	movl	$0, -4756(%ebp)
.L65:
	movl	dir, %eax
	testl	%eax, %eax
	je	.L66
	movl	dir, %eax
	subl	$12, %esp
	pushl	%eax
	call	chdir
	addl	$16, %esp
	testl	%eax, %eax
	jns	.L66
	subl	$8, %esp
	pushl	$.LC20
	pushl	$2
	call	syslog
	addl	$16, %esp
	subl	$12, %esp
	pushl	$.LC21
	call	perror
	addl	$16, %esp
	call	__asan_handle_no_return
	subl	$12, %esp
	pushl	$1
	call	exit
.L66:
	subl	$8, %esp
	pushl	$4096
	movl	-4784(%ebp), %edi
	movl	%edi, %eax
	subl	$4160, %eax
	pushl	%eax
	call	getcwd
	addl	$16, %esp
	movl	%edi, %eax
	leal	-4160(%eax), %ebx
	movl	%ebx, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%cl
	movl	%ecx, %esi
	movl	%eax, %ecx
	andl	$7, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L67
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load1
.L67:
	subl	$12, %esp
	movl	-4784(%ebp), %eax
	subl	$4160, %eax
	pushl	%eax
	call	strlen
	addl	$16, %esp
	movl	%eax, %edx
	leal	(%ebx,%edx), %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%esi, %ecx
	testb	%cl, %cl
	je	.L68
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load1
.L68:
	leal	-1(%edx), %ecx
	movl	-4784(%ebp), %eax
	subl	$4160, %eax
	addl	%ecx, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L69
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load1
.L69:
	movl	-4784(%ebp), %eax
	movzbl	-4160(%ecx,%eax), %eax
	cmpb	$47, %al
	je	.L70
	movl	-4784(%ebp), %eax
	leal	-4160(%eax), %ebx
	movl	%ebx, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%cl
	movl	%ecx, %esi
	movl	%eax, %ecx
	andl	$7, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L71
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load1
.L71:
	movl	-4784(%ebp), %eax
	subl	$4160, %eax
	movl	$-1, %ecx
	movl	%eax, %edx
	movl	$0, %eax
	movl	%edx, %edi
	repnz; scasb
	movl	%ecx, %eax
	notl	%eax
	leal	-1(%eax), %ecx
	leal	(%ebx,%ecx), %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L72
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load1
.L72:
	movl	-4784(%ebp), %eax
	subl	$4160, %eax
	addl	%ecx, %eax
	movl	$.LC22, %edx
	movl	%edx, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %esi
	movl	%edx, %ebx
	andl	$7, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%esi, %ecx
	testb	%cl, %cl
	je	.L73
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_load1
.L73:
	movl	$.LC22, %edx
	addl	$1, %edx
	movl	%edx, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %esi
	movl	%edx, %ebx
	andl	$7, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%esi, %ecx
	testb	%cl, %cl
	je	.L74
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_load1
.L74:
	movl	%eax, %edx
	movl	%edx, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %esi
	movl	%edx, %ebx
	andl	$7, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%esi, %ecx
	testb	%cl, %cl
	je	.L75
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_store1
.L75:
	leal	1(%eax), %edx
	movl	%edx, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %esi
	movl	%edx, %ebx
	andl	$7, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%esi, %ecx
	testb	%cl, %cl
	je	.L76
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_store1
.L76:
	movw	$47, (%eax)
.L70:
	movl	debug, %eax
	testl	%eax, %eax
	jne	.L77
	movl	$stdin, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L78
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L78:
	movl	stdin, %eax
	subl	$12, %esp
	pushl	%eax
	call	fclose
	addl	$16, %esp
	movl	$stdout, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L79
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L79:
	movl	stdout, %eax
	cmpl	%eax, -4756(%ebp)
	je	.L80
	movl	stdout, %eax
	subl	$12, %esp
	pushl	%eax
	call	fclose
	addl	$16, %esp
.L80:
	movl	$stderr, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L81
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L81:
	movl	stderr, %eax
	subl	$12, %esp
	pushl	%eax
	call	fclose
	addl	$16, %esp
	subl	$8, %esp
	pushl	$1
	pushl	$1
	call	daemon
	addl	$16, %esp
	testl	%eax, %eax
	jns	.L82
	subl	$8, %esp
	pushl	$.LC23
	pushl	$2
	call	syslog
	addl	$16, %esp
	call	__asan_handle_no_return
	subl	$12, %esp
	pushl	$1
	call	exit
.L77:
	call	setsid
.L82:
	movl	pidfile, %eax
	testl	%eax, %eax
	je	.L83
	movl	pidfile, %eax
	subl	$8, %esp
	pushl	$.LC24
	pushl	%eax
	call	fopen
	addl	$16, %esp
	movl	%eax, -4744(%ebp)
	cmpl	$0, -4744(%ebp)
	jne	.L84
	movl	pidfile, %eax
	subl	$4, %esp
	pushl	%eax
	pushl	$.LC15
	pushl	$2
	call	syslog
	addl	$16, %esp
	call	__asan_handle_no_return
	subl	$12, %esp
	pushl	$1
	call	exit
.L84:
	call	getpid
	subl	$4, %esp
	pushl	%eax
	pushl	$.LC25
	pushl	-4744(%ebp)
	call	fprintf
	addl	$16, %esp
	subl	$12, %esp
	pushl	-4744(%ebp)
	call	fclose
	addl	$16, %esp
.L83:
	call	fdwatch_get_nfiles
	movl	%eax, max_connects
	movl	max_connects, %eax
	testl	%eax, %eax
	jns	.L85
	subl	$8, %esp
	pushl	$.LC26
	pushl	$2
	call	syslog
	addl	$16, %esp
	call	__asan_handle_no_return
	subl	$12, %esp
	pushl	$1
	call	exit
.L85:
	movl	max_connects, %eax
	subl	$10, %eax
	movl	%eax, max_connects
	movl	do_chroot, %eax
	testl	%eax, %eax
	je	.L86
	subl	$12, %esp
	movl	-4784(%ebp), %eax
	subl	$4160, %eax
	pushl	%eax
	call	chroot
	addl	$16, %esp
	testl	%eax, %eax
	jns	.L87
	subl	$8, %esp
	pushl	$.LC27
	pushl	$2
	call	syslog
	addl	$16, %esp
	subl	$12, %esp
	pushl	$.LC28
	call	perror
	addl	$16, %esp
	call	__asan_handle_no_return
	subl	$12, %esp
	pushl	$1
	call	exit
.L87:
	movl	logfile, %eax
	testl	%eax, %eax
	je	.L88
	movl	logfile, %eax
	subl	$8, %esp
	pushl	$.LC5
	pushl	%eax
	call	strcmp
	addl	$16, %esp
	testl	%eax, %eax
	je	.L88
	movl	-4784(%ebp), %eax
	leal	-4160(%eax), %ebx
	movl	%ebx, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%cl
	movl	%ecx, %esi
	movl	%eax, %ecx
	andl	$7, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L89
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load1
.L89:
	subl	$12, %esp
	movl	-4784(%ebp), %eax
	subl	$4160, %eax
	pushl	%eax
	call	strlen
	addl	$16, %esp
	movl	%eax, %edx
	leal	(%ebx,%edx), %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%esi, %ecx
	testb	%cl, %cl
	je	.L90
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load1
.L90:
	movl	logfile, %eax
	subl	$4, %esp
	pushl	%edx
	movl	-4784(%ebp), %edi
	leal	-4160(%edi), %edx
	pushl	%edx
	pushl	%eax
	call	strncmp
	addl	$16, %esp
	testl	%eax, %eax
	jne	.L91
	movl	logfile, %edi
	movl	-4784(%ebp), %eax
	leal	-4160(%eax), %ebx
	movl	%ebx, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%al
	movl	%eax, %esi
	movl	%edx, %eax
	andl	$7, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%esi, %eax
	testb	%al, %al
	je	.L92
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_load1
.L92:
	subl	$12, %esp
	movl	-4784(%ebp), %eax
	subl	$4160, %eax
	pushl	%eax
	call	strlen
	addl	$16, %esp
	movl	%eax, %ecx
	leal	(%ebx,%ecx), %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ebx
	testb	%bl, %bl
	setne	%al
	movl	%eax, %esi
	movl	%edx, %eax
	andl	$7, %eax
	cmpb	%bl, %al
	setge	%al
	andl	%esi, %eax
	testb	%al, %al
	je	.L93
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_load1
.L93:
	leal	-1(%ecx), %eax
	leal	(%edi,%eax), %edx
	movl	logfile, %eax
	subl	$8, %esp
	pushl	%edx
	pushl	%eax
	call	strcpy
	addl	$16, %esp
	jmp	.L88
.L91:
	subl	$8, %esp
	pushl	$.LC29
	pushl	$4
	call	syslog
	addl	$16, %esp
	movl	argv0, %ecx
	movl	$stderr, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L94
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L94:
	movl	stderr, %eax
	subl	$4, %esp
	pushl	%ecx
	pushl	$.LC30
	pushl	%eax
	call	fprintf
	addl	$16, %esp
.L88:
	movl	$.LC22, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L95
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load1
.L95:
	movl	$.LC22, %eax
	addl	$1, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L96
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load1
.L96:
	movl	-4784(%ebp), %eax
	subl	$4160, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L97
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_store1
.L97:
	movl	-4784(%ebp), %eax
	subl	$4160, %eax
	addl	$1, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L98
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_store1
.L98:
	movl	-4784(%ebp), %edi
	movl	%edi, %eax
	subl	$4160, %eax
	movw	$47, (%eax)
	subl	$12, %esp
	movl	%edi, %eax
	subl	$4160, %eax
	pushl	%eax
	call	chdir
	addl	$16, %esp
	testl	%eax, %eax
	jns	.L86
	subl	$8, %esp
	pushl	$.LC31
	pushl	$2
	call	syslog
	addl	$16, %esp
	subl	$12, %esp
	pushl	$.LC32
	call	perror
	addl	$16, %esp
	call	__asan_handle_no_return
	subl	$12, %esp
	pushl	$1
	call	exit
.L86:
	movl	data_dir, %eax
	testl	%eax, %eax
	je	.L99
	movl	data_dir, %eax
	subl	$12, %esp
	pushl	%eax
	call	chdir
	addl	$16, %esp
	testl	%eax, %eax
	jns	.L99
	subl	$8, %esp
	pushl	$.LC33
	pushl	$2
	call	syslog
	addl	$16, %esp
	subl	$12, %esp
	pushl	$.LC34
	call	perror
	addl	$16, %esp
	call	__asan_handle_no_return
	subl	$12, %esp
	pushl	$1
	call	exit
.L99:
	subl	$8, %esp
	pushl	$handle_term
	pushl	$15
	call	sigset
	addl	$16, %esp
	subl	$8, %esp
	pushl	$handle_term
	pushl	$2
	call	sigset
	addl	$16, %esp
	subl	$8, %esp
	pushl	$handle_chld
	pushl	$17
	call	sigset
	addl	$16, %esp
	subl	$8, %esp
	pushl	$1
	pushl	$13
	call	sigset
	addl	$16, %esp
	subl	$8, %esp
	pushl	$handle_hup
	pushl	$1
	call	sigset
	addl	$16, %esp
	subl	$8, %esp
	pushl	$handle_usr1
	pushl	$10
	call	sigset
	addl	$16, %esp
	subl	$8, %esp
	pushl	$handle_usr2
	pushl	$12
	call	sigset
	addl	$16, %esp
	subl	$8, %esp
	pushl	$handle_alrm
	pushl	$14
	call	sigset
	addl	$16, %esp
	movl	$0, got_hup
	movl	$0, got_usr1
	movl	$0, watchdog_flag
	subl	$12, %esp
	pushl	$360
	call	alarm
	addl	$16, %esp
	call	tmr_init
	movl	no_empty_referers, %esi
	movl	local_pattern, %edi
	movl	url_pattern, %eax
	movl	%eax, -4788(%ebp)
	movl	do_global_passwd, %eax
	movl	%eax, -4792(%ebp)
	movl	do_vhost, %eax
	movl	%eax, -4796(%ebp)
	movl	no_symlink_check, %eax
	movl	%eax, -4800(%ebp)
	movl	no_log, %eax
	movl	%eax, -4804(%ebp)
	movl	max_age, %eax
	movl	%eax, -4808(%ebp)
	movl	p3p, %eax
	movl	%eax, -4812(%ebp)
	movl	charset, %eax
	movl	%eax, -4816(%ebp)
	movl	cgi_limit, %eax
	movl	%eax, -4820(%ebp)
	movl	cgi_pattern, %eax
	movl	%eax, -4824(%ebp)
	movzwl	port, %eax
	movzwl	%ax, %eax
	movl	%eax, -4828(%ebp)
	movl	-4784(%ebp), %eax
	movl	-4608(%eax), %eax
	testl	%eax, %eax
	je	.L100
	movl	-4784(%ebp), %eax
	leal	-4320(%eax), %ebx
	jmp	.L101
.L100:
	movl	$0, %ebx
.L101:
	movl	-4784(%ebp), %eax
	movl	-4672(%eax), %eax
	testl	%eax, %eax
	je	.L102
	movl	-4784(%ebp), %eax
	leal	-4480(%eax), %edx
	jmp	.L103
.L102:
	movl	$0, %edx
.L103:
	movl	hostname, %ecx
	subl	$8, %esp
	pushl	%esi
	pushl	%edi
	pushl	-4788(%ebp)
	pushl	-4792(%ebp)
	pushl	-4796(%ebp)
	pushl	-4800(%ebp)
	pushl	-4756(%ebp)
	pushl	-4804(%ebp)
	movl	-4784(%ebp), %eax
	subl	$4160, %eax
	pushl	%eax
	pushl	-4808(%ebp)
	pushl	-4812(%ebp)
	pushl	-4816(%ebp)
	pushl	-4820(%ebp)
	pushl	-4824(%ebp)
	pushl	-4828(%ebp)
	pushl	%ebx
	pushl	%edx
	pushl	%ecx
	call	httpd_initialize
	addl	$80, %esp
	movl	%eax, hs
	movl	hs, %eax
	testl	%eax, %eax
	jne	.L104
	call	__asan_handle_no_return
	subl	$12, %esp
	pushl	$1
	call	exit
.L104:
	subl	$12, %esp
	pushl	$1
	pushl	$120000
	pushl	JunkClientData
	pushl	$occasional
	pushl	$0
	call	tmr_create
	addl	$32, %esp
	testl	%eax, %eax
	jne	.L105
	subl	$8, %esp
	pushl	$.LC35
	pushl	$2
	call	syslog
	addl	$16, %esp
	call	__asan_handle_no_return
	subl	$12, %esp
	pushl	$1
	call	exit
.L105:
	subl	$12, %esp
	pushl	$1
	pushl	$5000
	pushl	JunkClientData
	pushl	$idle
	pushl	$0
	call	tmr_create
	addl	$32, %esp
	testl	%eax, %eax
	jne	.L106
	subl	$8, %esp
	pushl	$.LC36
	pushl	$2
	call	syslog
	addl	$16, %esp
	call	__asan_handle_no_return
	subl	$12, %esp
	pushl	$1
	call	exit
.L106:
	movl	numthrottles, %eax
	testl	%eax, %eax
	jle	.L107
	subl	$12, %esp
	pushl	$1
	pushl	$2000
	pushl	JunkClientData
	pushl	$update_throttles
	pushl	$0
	call	tmr_create
	addl	$32, %esp
	testl	%eax, %eax
	jne	.L107
	subl	$8, %esp
	pushl	$.LC37
	pushl	$2
	call	syslog
	addl	$16, %esp
	call	__asan_handle_no_return
	subl	$12, %esp
	pushl	$1
	call	exit
.L107:
	subl	$12, %esp
	pushl	$1
	pushl	$3600000
	pushl	JunkClientData
	pushl	$show_stats
	pushl	$0
	call	tmr_create
	addl	$32, %esp
	testl	%eax, %eax
	jne	.L108
	subl	$8, %esp
	pushl	$.LC38
	pushl	$2
	call	syslog
	addl	$16, %esp
	call	__asan_handle_no_return
	subl	$12, %esp
	pushl	$1
	call	exit
.L108:
	subl	$12, %esp
	pushl	$0
	call	time
	addl	$16, %esp
	movl	%eax, stats_time
	movl	stats_time, %eax
	movl	%eax, start_time
	movl	$0, stats_connections
	movl	$0, stats_bytes
	movl	$0, stats_simultaneous
	call	getuid
	testl	%eax, %eax
	jne	.L109
	subl	$8, %esp
	pushl	$0
	pushl	$0
	call	setgroups
	addl	$16, %esp
	testl	%eax, %eax
	jns	.L110
	subl	$8, %esp
	pushl	$.LC39
	pushl	$2
	call	syslog
	addl	$16, %esp
	call	__asan_handle_no_return
	subl	$12, %esp
	pushl	$1
	call	exit
.L110:
	subl	$12, %esp
	pushl	-4760(%ebp)
	call	setgid
	addl	$16, %esp
	testl	%eax, %eax
	jns	.L111
	subl	$8, %esp
	pushl	$.LC40
	pushl	$2
	call	syslog
	addl	$16, %esp
	call	__asan_handle_no_return
	subl	$12, %esp
	pushl	$1
	call	exit
.L111:
	movl	user, %eax
	subl	$8, %esp
	pushl	-4760(%ebp)
	pushl	%eax
	call	initgroups
	addl	$16, %esp
	testl	%eax, %eax
	jns	.L112
	subl	$8, %esp
	pushl	$.LC41
	pushl	$4
	call	syslog
	addl	$16, %esp
.L112:
	subl	$12, %esp
	pushl	-4764(%ebp)
	call	setuid
	addl	$16, %esp
	testl	%eax, %eax
	jns	.L113
	subl	$8, %esp
	pushl	$.LC42
	pushl	$2
	call	syslog
	addl	$16, %esp
	call	__asan_handle_no_return
	subl	$12, %esp
	pushl	$1
	call	exit
.L113:
	movl	do_chroot, %eax
	testl	%eax, %eax
	jne	.L109
	subl	$8, %esp
	pushl	$.LC43
	pushl	$4
	call	syslog
	addl	$16, %esp
.L109:
	movl	max_connects, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$5, %eax
	subl	$12, %esp
	pushl	%eax
	call	malloc
	addl	$16, %esp
	movl	%eax, connects
	movl	connects, %eax
	testl	%eax, %eax
	jne	.L114
	subl	$8, %esp
	pushl	$.LC44
	pushl	$2
	call	syslog
	addl	$16, %esp
	call	__asan_handle_no_return
	subl	$12, %esp
	pushl	$1
	call	exit
.L114:
	movl	$0, -4752(%ebp)
	jmp	.L115
.L119:
	movl	connects, %ecx
	movl	-4752(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$5, %eax
	addl	%eax, %ecx
	movl	%ecx, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L116
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_store4
.L116:
	movl	$0, (%ecx)
	movl	connects, %ecx
	movl	-4752(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$5, %eax
	addl	%eax, %ecx
	movl	-4752(%ebp), %eax
	leal	1(%eax), %esi
	leal	4(%ecx), %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ebx
	testb	%bl, %bl
	setne	%al
	movl	%eax, %edi
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%bl, %al
	setge	%al
	andl	%edi, %eax
	testb	%al, %al
	je	.L117
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_store4
.L117:
	movl	%esi, 4(%ecx)
	movl	connects, %ecx
	movl	-4752(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$5, %eax
	leal	(%ecx,%eax), %edx
	leal	8(%edx), %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%esi, %ecx
	testb	%cl, %cl
	je	.L118
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_store4
.L118:
	movl	$0, 8(%edx)
	addl	$1, -4752(%ebp)
.L115:
	movl	max_connects, %eax
	cmpl	%eax, -4752(%ebp)
	jl	.L119
	movl	connects, %ecx
	movl	max_connects, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$5, %eax
	subl	$96, %eax
	leal	(%ecx,%eax), %edx
	leal	4(%edx), %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%esi, %ecx
	testb	%cl, %cl
	je	.L120
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_store4
.L120:
	movl	$-1, 4(%edx)
	movl	$0, first_free_connect
	movl	$0, num_connects
	movl	$0, httpd_conn_count
	movl	hs, %eax
	testl	%eax, %eax
	je	.L121
	movl	hs, %edx
	leal	40(%edx), %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%esi, %ecx
	testb	%cl, %cl
	je	.L122
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L122:
	movl	40(%edx), %eax
	cmpl	$-1, %eax
	je	.L123
	movl	hs, %edx
	leal	40(%edx), %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%esi, %ecx
	testb	%cl, %cl
	je	.L124
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L124:
	movl	40(%edx), %eax
	subl	$4, %esp
	pushl	$0
	pushl	$0
	pushl	%eax
	call	fdwatch_add_fd
	addl	$16, %esp
.L123:
	movl	hs, %edx
	leal	44(%edx), %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%esi, %ecx
	testb	%cl, %cl
	je	.L125
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L125:
	movl	44(%edx), %eax
	cmpl	$-1, %eax
	je	.L121
	movl	hs, %edx
	leal	44(%edx), %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%esi, %ecx
	testb	%cl, %cl
	je	.L126
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L126:
	movl	44(%edx), %eax
	subl	$4, %esp
	pushl	$0
	pushl	$0
	pushl	%eax
	call	fdwatch_add_fd
	addl	$16, %esp
.L121:
	subl	$12, %esp
	movl	-4784(%ebp), %eax
	subl	$4544, %eax
	pushl	%eax
	call	tmr_prepare_timeval
	addl	$16, %esp
	jmp	.L127
.L159:
	movl	got_hup, %eax
	testl	%eax, %eax
	je	.L128
	call	re_open_logfile
	movl	$0, got_hup
.L128:
	subl	$12, %esp
	movl	-4784(%ebp), %eax
	subl	$4544, %eax
	pushl	%eax
	call	tmr_mstimeout
	addl	$16, %esp
	subl	$12, %esp
	pushl	%eax
	call	fdwatch
	addl	$16, %esp
	movl	%eax, -4740(%ebp)
	cmpl	$0, -4740(%ebp)
	jns	.L129
	call	__errno_location
	movl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%esi, %ecx
	testb	%cl, %cl
	je	.L130
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L130:
	movl	(%edx), %eax
	cmpl	$4, %eax
	je	.L131
	call	__errno_location
	movl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%esi, %ecx
	testb	%cl, %cl
	je	.L132
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L132:
	movl	(%edx), %eax
	cmpl	$11, %eax
	jne	.L133
.L131:
	jmp	.L127
.L133:
	subl	$8, %esp
	pushl	$.LC45
	pushl	$3
	call	syslog
	addl	$16, %esp
	call	__asan_handle_no_return
	subl	$12, %esp
	pushl	$1
	call	exit
.L129:
	subl	$12, %esp
	movl	-4784(%ebp), %eax
	subl	$4544, %eax
	pushl	%eax
	call	tmr_prepare_timeval
	addl	$16, %esp
	cmpl	$0, -4740(%ebp)
	jne	.L134
	subl	$12, %esp
	movl	-4784(%ebp), %eax
	subl	$4544, %eax
	pushl	%eax
	call	tmr_run
	addl	$16, %esp
	jmp	.L127
.L134:
	movl	hs, %eax
	testl	%eax, %eax
	je	.L135
	movl	hs, %edx
	leal	44(%edx), %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%esi, %ecx
	testb	%cl, %cl
	je	.L136
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L136:
	movl	44(%edx), %eax
	cmpl	$-1, %eax
	je	.L135
	movl	hs, %edx
	leal	44(%edx), %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%esi, %ecx
	testb	%cl, %cl
	je	.L137
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L137:
	movl	44(%edx), %eax
	subl	$12, %esp
	pushl	%eax
	call	fdwatch_check_fd
	addl	$16, %esp
	testl	%eax, %eax
	je	.L135
	movl	hs, %edx
	leal	44(%edx), %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%esi, %ecx
	testb	%cl, %cl
	je	.L138
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L138:
	movl	44(%edx), %eax
	subl	$8, %esp
	pushl	%eax
	movl	-4784(%ebp), %eax
	subl	$4544, %eax
	pushl	%eax
	call	handle_newconnect
	addl	$16, %esp
	testl	%eax, %eax
	je	.L135
	jmp	.L127
.L135:
	movl	hs, %eax
	testl	%eax, %eax
	je	.L139
	movl	hs, %edx
	leal	40(%edx), %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%esi, %ecx
	testb	%cl, %cl
	je	.L140
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L140:
	movl	40(%edx), %eax
	cmpl	$-1, %eax
	je	.L139
	movl	hs, %edx
	leal	40(%edx), %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%esi, %ecx
	testb	%cl, %cl
	je	.L141
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L141:
	movl	40(%edx), %eax
	subl	$12, %esp
	pushl	%eax
	call	fdwatch_check_fd
	addl	$16, %esp
	testl	%eax, %eax
	je	.L139
	movl	hs, %edx
	leal	40(%edx), %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%esi, %ecx
	testb	%cl, %cl
	je	.L142
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L142:
	movl	40(%edx), %eax
	subl	$8, %esp
	pushl	%eax
	movl	-4784(%ebp), %eax
	subl	$4544, %eax
	pushl	%eax
	call	handle_newconnect
	addl	$16, %esp
	testl	%eax, %eax
	je	.L139
	jmp	.L127
.L139:
	jmp	.L143
.L152:
	cmpl	$0, -4736(%ebp)
	jne	.L144
	jmp	.L143
.L144:
	movl	-4736(%ebp), %eax
	addl	$8, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L145
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L145:
	movl	-4736(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, -4732(%ebp)
	movl	-4732(%ebp), %eax
	addl	$448, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L146
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L146:
	movl	-4732(%ebp), %eax
	movl	448(%eax), %eax
	subl	$12, %esp
	pushl	%eax
	call	fdwatch_check_fd
	addl	$16, %esp
	testl	%eax, %eax
	jne	.L147
	subl	$8, %esp
	movl	-4784(%ebp), %eax
	subl	$4544, %eax
	pushl	%eax
	pushl	-4736(%ebp)
	call	clear_connection
	addl	$16, %esp
	jmp	.L143
.L147:
	movl	-4736(%ebp), %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L148
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L148:
	movl	-4736(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$2, %eax
	je	.L149
	cmpl	$4, %eax
	je	.L150
	cmpl	$1, %eax
	je	.L151
	jmp	.L143
.L151:
	subl	$8, %esp
	movl	-4784(%ebp), %eax
	subl	$4544, %eax
	pushl	%eax
	pushl	-4736(%ebp)
	call	handle_read
	addl	$16, %esp
	jmp	.L143
.L149:
	subl	$8, %esp
	movl	-4784(%ebp), %eax
	subl	$4544, %eax
	pushl	%eax
	pushl	-4736(%ebp)
	call	handle_send
	addl	$16, %esp
	jmp	.L143
.L150:
	subl	$8, %esp
	movl	-4784(%ebp), %eax
	subl	$4544, %eax
	pushl	%eax
	pushl	-4736(%ebp)
	call	handle_linger
	addl	$16, %esp
	nop
.L143:
	call	fdwatch_get_next_client_data
	movl	%eax, -4736(%ebp)
	cmpl	$-1, -4736(%ebp)
	jne	.L152
	subl	$12, %esp
	movl	-4784(%ebp), %eax
	subl	$4544, %eax
	pushl	%eax
	call	tmr_run
	addl	$16, %esp
	movl	got_usr1, %eax
	testl	%eax, %eax
	je	.L127
	movl	terminate, %eax
	testl	%eax, %eax
	jne	.L127
	movl	$1, terminate
	movl	hs, %eax
	testl	%eax, %eax
	je	.L127
	movl	hs, %edx
	leal	40(%edx), %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%esi, %ecx
	testb	%cl, %cl
	je	.L153
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L153:
	movl	40(%edx), %eax
	cmpl	$-1, %eax
	je	.L154
	movl	hs, %edx
	leal	40(%edx), %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%esi, %ecx
	testb	%cl, %cl
	je	.L155
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L155:
	movl	40(%edx), %eax
	subl	$12, %esp
	pushl	%eax
	call	fdwatch_del_fd
	addl	$16, %esp
.L154:
	movl	hs, %edx
	leal	44(%edx), %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%esi, %ecx
	testb	%cl, %cl
	je	.L156
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L156:
	movl	44(%edx), %eax
	cmpl	$-1, %eax
	je	.L157
	movl	hs, %edx
	leal	44(%edx), %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%esi, %ecx
	testb	%cl, %cl
	je	.L158
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L158:
	movl	44(%edx), %eax
	subl	$12, %esp
	pushl	%eax
	call	fdwatch_del_fd
	addl	$16, %esp
.L157:
	movl	hs, %eax
	subl	$12, %esp
	pushl	%eax
	call	httpd_unlisten
	addl	$16, %esp
.L127:
	movl	terminate, %eax
	testl	%eax, %eax
	je	.L159
	movl	num_connects, %eax
	testl	%eax, %eax
	jg	.L159
	call	shut_down
	subl	$8, %esp
	pushl	$.LC3
	pushl	$5
	call	syslog
	addl	$16, %esp
	call	closelog
	call	__asan_handle_no_return
	subl	$12, %esp
	pushl	$0
	call	exit
	.cfi_endproc
.LFE7:
	.size	main, .-main
	.section	.rodata
	.align 32
.LC46:
	.string	"nobody"
	.zero	57
	.align 32
.LC47:
	.string	"iso-8859-1"
	.zero	53
	.align 32
.LC48:
	.string	""
	.zero	63
	.align 32
.LC49:
	.string	"-V"
	.zero	61
	.align 32
.LC50:
	.string	"thttpd/2.26.2 April 4, 2012"
	.zero	36
	.align 32
.LC51:
	.string	"-C"
	.zero	61
	.align 32
.LC52:
	.string	"-p"
	.zero	61
	.align 32
.LC53:
	.string	"-d"
	.zero	61
	.align 32
.LC54:
	.string	"-r"
	.zero	61
	.align 32
.LC55:
	.string	"-nor"
	.zero	59
	.align 32
.LC56:
	.string	"-dd"
	.zero	60
	.align 32
.LC57:
	.string	"-s"
	.zero	61
	.align 32
.LC58:
	.string	"-nos"
	.zero	59
	.align 32
.LC59:
	.string	"-u"
	.zero	61
	.align 32
.LC60:
	.string	"-c"
	.zero	61
	.align 32
.LC61:
	.string	"-t"
	.zero	61
	.align 32
.LC62:
	.string	"-h"
	.zero	61
	.align 32
.LC63:
	.string	"-l"
	.zero	61
	.align 32
.LC64:
	.string	"-v"
	.zero	61
	.align 32
.LC65:
	.string	"-nov"
	.zero	59
	.align 32
.LC66:
	.string	"-g"
	.zero	61
	.align 32
.LC67:
	.string	"-nog"
	.zero	59
	.align 32
.LC68:
	.string	"-i"
	.zero	61
	.align 32
.LC69:
	.string	"-T"
	.zero	61
	.align 32
.LC70:
	.string	"-P"
	.zero	61
	.align 32
.LC71:
	.string	"-M"
	.zero	61
	.align 32
.LC72:
	.string	"-D"
	.zero	61
	.text
	.type	parse_args, @function
parse_args:
.LASANPC8:
.LFB8:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%esi
	pushl	%ebx
	subl	$16, %esp
	.cfi_offset 6, -12
	.cfi_offset 3, -16
	movl	$0, debug
	movw	$80, port
	movl	$0, dir
	movl	$0, data_dir
	movl	$0, do_chroot
	movl	$0, no_log
	movl	do_chroot, %eax
	movl	%eax, no_symlink_check
	movl	$0, do_vhost
	movl	$0, do_global_passwd
	movl	$0, cgi_pattern
	movl	$0, cgi_limit
	movl	$0, url_pattern
	movl	$0, no_empty_referers
	movl	$0, local_pattern
	movl	$0, throttlefile
	movl	$0, hostname
	movl	$0, logfile
	movl	$0, pidfile
	movl	$.LC46, user
	movl	$.LC47, charset
	movl	$.LC48, p3p
	movl	$-1, max_age
	movl	$1, -12(%ebp)
	jmp	.L162
.L226:
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	leal	(%edx,%eax), %ecx
	movl	%ecx, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L163
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L163:
	movl	(%ecx), %eax
	subl	$8, %esp
	pushl	$.LC49
	pushl	%eax
	call	strcmp
	addl	$16, %esp
	testl	%eax, %eax
	jne	.L164
	subl	$12, %esp
	pushl	$.LC50
	call	puts
	addl	$16, %esp
	call	__asan_handle_no_return
	subl	$12, %esp
	pushl	$0
	call	exit
.L164:
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	leal	(%edx,%eax), %ecx
	movl	%ecx, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L165
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L165:
	movl	(%ecx), %eax
	subl	$8, %esp
	pushl	$.LC51
	pushl	%eax
	call	strcmp
	addl	$16, %esp
	testl	%eax, %eax
	jne	.L166
	movl	-12(%ebp), %eax
	addl	$1, %eax
	cmpl	8(%ebp), %eax
	jge	.L166
	addl	$1, -12(%ebp)
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	leal	(%edx,%eax), %ecx
	movl	%ecx, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L167
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L167:
	movl	(%ecx), %eax
	subl	$12, %esp
	pushl	%eax
	call	read_config
	addl	$16, %esp
	jmp	.L168
.L166:
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	leal	(%edx,%eax), %ecx
	movl	%ecx, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L169
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L169:
	movl	(%ecx), %eax
	subl	$8, %esp
	pushl	$.LC52
	pushl	%eax
	call	strcmp
	addl	$16, %esp
	testl	%eax, %eax
	jne	.L170
	movl	-12(%ebp), %eax
	addl	$1, %eax
	cmpl	8(%ebp), %eax
	jge	.L170
	addl	$1, -12(%ebp)
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	leal	(%edx,%eax), %ecx
	movl	%ecx, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L171
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L171:
	movl	(%ecx), %eax
	subl	$12, %esp
	pushl	%eax
	call	atoi
	addl	$16, %esp
	movw	%ax, port
	jmp	.L168
.L170:
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	leal	(%edx,%eax), %ecx
	movl	%ecx, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L172
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L172:
	movl	(%ecx), %eax
	subl	$8, %esp
	pushl	$.LC53
	pushl	%eax
	call	strcmp
	addl	$16, %esp
	testl	%eax, %eax
	jne	.L173
	movl	-12(%ebp), %eax
	addl	$1, %eax
	cmpl	8(%ebp), %eax
	jge	.L173
	addl	$1, -12(%ebp)
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	leal	(%edx,%eax), %ecx
	movl	%ecx, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L174
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L174:
	movl	(%ecx), %eax
	movl	%eax, dir
	jmp	.L168
.L173:
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	leal	(%edx,%eax), %ecx
	movl	%ecx, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L175
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L175:
	movl	(%ecx), %eax
	subl	$8, %esp
	pushl	$.LC54
	pushl	%eax
	call	strcmp
	addl	$16, %esp
	testl	%eax, %eax
	jne	.L176
	movl	$1, do_chroot
	movl	$1, no_symlink_check
	jmp	.L168
.L176:
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	leal	(%edx,%eax), %ecx
	movl	%ecx, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L177
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L177:
	movl	(%ecx), %eax
	subl	$8, %esp
	pushl	$.LC55
	pushl	%eax
	call	strcmp
	addl	$16, %esp
	testl	%eax, %eax
	jne	.L178
	movl	$0, do_chroot
	movl	$0, no_symlink_check
	jmp	.L168
.L178:
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	leal	(%edx,%eax), %ecx
	movl	%ecx, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L179
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L179:
	movl	(%ecx), %eax
	subl	$8, %esp
	pushl	$.LC56
	pushl	%eax
	call	strcmp
	addl	$16, %esp
	testl	%eax, %eax
	jne	.L180
	movl	-12(%ebp), %eax
	addl	$1, %eax
	cmpl	8(%ebp), %eax
	jge	.L180
	addl	$1, -12(%ebp)
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	leal	(%edx,%eax), %ecx
	movl	%ecx, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L181
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L181:
	movl	(%ecx), %eax
	movl	%eax, data_dir
	jmp	.L168
.L180:
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	leal	(%edx,%eax), %ecx
	movl	%ecx, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L182
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L182:
	movl	(%ecx), %eax
	subl	$8, %esp
	pushl	$.LC57
	pushl	%eax
	call	strcmp
	addl	$16, %esp
	testl	%eax, %eax
	jne	.L183
	movl	$0, no_symlink_check
	jmp	.L168
.L183:
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	leal	(%edx,%eax), %ecx
	movl	%ecx, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L184
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L184:
	movl	(%ecx), %eax
	subl	$8, %esp
	pushl	$.LC58
	pushl	%eax
	call	strcmp
	addl	$16, %esp
	testl	%eax, %eax
	jne	.L185
	movl	$1, no_symlink_check
	jmp	.L168
.L185:
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	leal	(%edx,%eax), %ecx
	movl	%ecx, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L186
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L186:
	movl	(%ecx), %eax
	subl	$8, %esp
	pushl	$.LC59
	pushl	%eax
	call	strcmp
	addl	$16, %esp
	testl	%eax, %eax
	jne	.L187
	movl	-12(%ebp), %eax
	addl	$1, %eax
	cmpl	8(%ebp), %eax
	jge	.L187
	addl	$1, -12(%ebp)
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	leal	(%edx,%eax), %ecx
	movl	%ecx, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L188
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L188:
	movl	(%ecx), %eax
	movl	%eax, user
	jmp	.L168
.L187:
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	leal	(%edx,%eax), %ecx
	movl	%ecx, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L189
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L189:
	movl	(%ecx), %eax
	subl	$8, %esp
	pushl	$.LC60
	pushl	%eax
	call	strcmp
	addl	$16, %esp
	testl	%eax, %eax
	jne	.L190
	movl	-12(%ebp), %eax
	addl	$1, %eax
	cmpl	8(%ebp), %eax
	jge	.L190
	addl	$1, -12(%ebp)
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	leal	(%edx,%eax), %ecx
	movl	%ecx, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L191
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L191:
	movl	(%ecx), %eax
	movl	%eax, cgi_pattern
	jmp	.L168
.L190:
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	leal	(%edx,%eax), %ecx
	movl	%ecx, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L192
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L192:
	movl	(%ecx), %eax
	subl	$8, %esp
	pushl	$.LC61
	pushl	%eax
	call	strcmp
	addl	$16, %esp
	testl	%eax, %eax
	jne	.L193
	movl	-12(%ebp), %eax
	addl	$1, %eax
	cmpl	8(%ebp), %eax
	jge	.L193
	addl	$1, -12(%ebp)
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	leal	(%edx,%eax), %ecx
	movl	%ecx, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L194
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L194:
	movl	(%ecx), %eax
	movl	%eax, throttlefile
	jmp	.L168
.L193:
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	leal	(%edx,%eax), %ecx
	movl	%ecx, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L195
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L195:
	movl	(%ecx), %eax
	subl	$8, %esp
	pushl	$.LC62
	pushl	%eax
	call	strcmp
	addl	$16, %esp
	testl	%eax, %eax
	jne	.L196
	movl	-12(%ebp), %eax
	addl	$1, %eax
	cmpl	8(%ebp), %eax
	jge	.L196
	addl	$1, -12(%ebp)
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	leal	(%edx,%eax), %ecx
	movl	%ecx, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L197
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L197:
	movl	(%ecx), %eax
	movl	%eax, hostname
	jmp	.L168
.L196:
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	leal	(%edx,%eax), %ecx
	movl	%ecx, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L198
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L198:
	movl	(%ecx), %eax
	subl	$8, %esp
	pushl	$.LC63
	pushl	%eax
	call	strcmp
	addl	$16, %esp
	testl	%eax, %eax
	jne	.L199
	movl	-12(%ebp), %eax
	addl	$1, %eax
	cmpl	8(%ebp), %eax
	jge	.L199
	addl	$1, -12(%ebp)
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	leal	(%edx,%eax), %ecx
	movl	%ecx, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L200
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L200:
	movl	(%ecx), %eax
	movl	%eax, logfile
	jmp	.L168
.L199:
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	leal	(%edx,%eax), %ecx
	movl	%ecx, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L201
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L201:
	movl	(%ecx), %eax
	subl	$8, %esp
	pushl	$.LC64
	pushl	%eax
	call	strcmp
	addl	$16, %esp
	testl	%eax, %eax
	jne	.L202
	movl	$1, do_vhost
	jmp	.L168
.L202:
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	leal	(%edx,%eax), %ecx
	movl	%ecx, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L203
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L203:
	movl	(%ecx), %eax
	subl	$8, %esp
	pushl	$.LC65
	pushl	%eax
	call	strcmp
	addl	$16, %esp
	testl	%eax, %eax
	jne	.L204
	movl	$0, do_vhost
	jmp	.L168
.L204:
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	leal	(%edx,%eax), %ecx
	movl	%ecx, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L205
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L205:
	movl	(%ecx), %eax
	subl	$8, %esp
	pushl	$.LC66
	pushl	%eax
	call	strcmp
	addl	$16, %esp
	testl	%eax, %eax
	jne	.L206
	movl	$1, do_global_passwd
	jmp	.L168
.L206:
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	leal	(%edx,%eax), %ecx
	movl	%ecx, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L207
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L207:
	movl	(%ecx), %eax
	subl	$8, %esp
	pushl	$.LC67
	pushl	%eax
	call	strcmp
	addl	$16, %esp
	testl	%eax, %eax
	jne	.L208
	movl	$0, do_global_passwd
	jmp	.L168
.L208:
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	leal	(%edx,%eax), %ecx
	movl	%ecx, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L209
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L209:
	movl	(%ecx), %eax
	subl	$8, %esp
	pushl	$.LC68
	pushl	%eax
	call	strcmp
	addl	$16, %esp
	testl	%eax, %eax
	jne	.L210
	movl	-12(%ebp), %eax
	addl	$1, %eax
	cmpl	8(%ebp), %eax
	jge	.L210
	addl	$1, -12(%ebp)
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	leal	(%edx,%eax), %ecx
	movl	%ecx, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L211
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L211:
	movl	(%ecx), %eax
	movl	%eax, pidfile
	jmp	.L168
.L210:
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	leal	(%edx,%eax), %ecx
	movl	%ecx, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L212
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L212:
	movl	(%ecx), %eax
	subl	$8, %esp
	pushl	$.LC69
	pushl	%eax
	call	strcmp
	addl	$16, %esp
	testl	%eax, %eax
	jne	.L213
	movl	-12(%ebp), %eax
	addl	$1, %eax
	cmpl	8(%ebp), %eax
	jge	.L213
	addl	$1, -12(%ebp)
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	leal	(%edx,%eax), %ecx
	movl	%ecx, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L214
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L214:
	movl	(%ecx), %eax
	movl	%eax, charset
	jmp	.L168
.L213:
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	leal	(%edx,%eax), %ecx
	movl	%ecx, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L215
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L215:
	movl	(%ecx), %eax
	subl	$8, %esp
	pushl	$.LC70
	pushl	%eax
	call	strcmp
	addl	$16, %esp
	testl	%eax, %eax
	jne	.L216
	movl	-12(%ebp), %eax
	addl	$1, %eax
	cmpl	8(%ebp), %eax
	jge	.L216
	addl	$1, -12(%ebp)
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	leal	(%edx,%eax), %ecx
	movl	%ecx, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L217
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L217:
	movl	(%ecx), %eax
	movl	%eax, p3p
	jmp	.L168
.L216:
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	leal	(%edx,%eax), %ecx
	movl	%ecx, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L218
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L218:
	movl	(%ecx), %eax
	subl	$8, %esp
	pushl	$.LC71
	pushl	%eax
	call	strcmp
	addl	$16, %esp
	testl	%eax, %eax
	jne	.L219
	movl	-12(%ebp), %eax
	addl	$1, %eax
	cmpl	8(%ebp), %eax
	jge	.L219
	addl	$1, -12(%ebp)
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	leal	(%edx,%eax), %ecx
	movl	%ecx, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L220
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L220:
	movl	(%ecx), %eax
	subl	$12, %esp
	pushl	%eax
	call	atoi
	addl	$16, %esp
	movl	%eax, max_age
	jmp	.L168
.L219:
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	leal	(%edx,%eax), %ecx
	movl	%ecx, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L221
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L221:
	movl	(%ecx), %eax
	subl	$8, %esp
	pushl	$.LC72
	pushl	%eax
	call	strcmp
	addl	$16, %esp
	testl	%eax, %eax
	jne	.L222
	movl	$1, debug
	jmp	.L168
.L222:
	call	usage
.L168:
	addl	$1, -12(%ebp)
.L162:
	movl	-12(%ebp), %eax
	cmpl	8(%ebp), %eax
	jge	.L223
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	leal	(%edx,%eax), %ecx
	movl	%ecx, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L224
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L224:
	movl	(%ecx), %edx
	movl	%edx, %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%esi, %ecx
	testb	%cl, %cl
	je	.L225
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load1
.L225:
	movzbl	(%edx), %eax
	cmpb	$45, %al
	je	.L226
.L223:
	movl	-12(%ebp), %eax
	cmpl	8(%ebp), %eax
	je	.L161
	call	usage
.L161:
	leal	-8(%ebp), %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE8:
	.size	parse_args, .-parse_args
	.section	.rodata
	.align 32
.LC73:
	.string	"usage:  %s [-C configfile] [-p port] [-d dir] [-r|-nor] [-dd data_dir] [-s|-nos] [-v|-nov] [-g|-nog] [-u user] [-c cgipat] [-t throttles] [-h host] [-l logfile] [-i pidfile] [-T charset] [-P P3P] [-M maxage] [-V] [-D]\n"
	.zero	37
	.text
	.type	usage, @function
usage:
.LASANPC9:
.LFB9:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%esi
	pushl	%ebx
	.cfi_offset 6, -12
	.cfi_offset 3, -16
	movl	argv0, %ecx
	movl	$stderr, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L229
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L229:
	movl	stderr, %eax
	subl	$4, %esp
	pushl	%ecx
	pushl	$.LC73
	pushl	%eax
	call	fprintf
	addl	$16, %esp
	call	__asan_handle_no_return
	subl	$12, %esp
	pushl	$1
	call	exit
	.cfi_endproc
.LFE9:
	.size	usage, .-usage
	.globl	__asan_stack_malloc_8
	.section	.rodata
.LC74:
	.string	"1 32 10000 4 line "
	.globl	__asan_stack_free_8
	.align 32
.LC75:
	.string	"r"
	.zero	62
	.align 32
.LC76:
	.string	" \t\n\r"
	.zero	59
	.align 32
.LC77:
	.string	"debug"
	.zero	58
	.align 32
.LC78:
	.string	"port"
	.zero	59
	.align 32
.LC79:
	.string	"dir"
	.zero	60
	.align 32
.LC80:
	.string	"nochroot"
	.zero	55
	.align 32
.LC81:
	.string	"data_dir"
	.zero	55
	.align 32
.LC82:
	.string	"symlink"
	.zero	56
	.align 32
.LC83:
	.string	"nosymlink"
	.zero	54
	.align 32
.LC84:
	.string	"symlinks"
	.zero	55
	.align 32
.LC85:
	.string	"nosymlinks"
	.zero	53
	.align 32
.LC86:
	.string	"user"
	.zero	59
	.align 32
.LC87:
	.string	"cgipat"
	.zero	57
	.align 32
.LC88:
	.string	"cgilimit"
	.zero	55
	.align 32
.LC89:
	.string	"urlpat"
	.zero	57
	.align 32
.LC90:
	.string	"noemptyreferers"
	.zero	48
	.align 32
.LC91:
	.string	"localpat"
	.zero	55
	.align 32
.LC92:
	.string	"throttles"
	.zero	54
	.align 32
.LC93:
	.string	"host"
	.zero	59
	.align 32
.LC94:
	.string	"logfile"
	.zero	56
	.align 32
.LC95:
	.string	"vhost"
	.zero	58
	.align 32
.LC96:
	.string	"novhost"
	.zero	56
	.align 32
.LC97:
	.string	"globalpasswd"
	.zero	51
	.align 32
.LC98:
	.string	"noglobalpasswd"
	.zero	49
	.align 32
.LC99:
	.string	"pidfile"
	.zero	56
	.align 32
.LC100:
	.string	"charset"
	.zero	56
	.align 32
.LC101:
	.string	"p3p"
	.zero	60
	.align 32
.LC102:
	.string	"max_age"
	.zero	56
	.align 32
.LC103:
	.string	"%s: unknown config option '%s'\n"
	.zero	32
	.text
	.type	read_config, @function
read_config:
.LASANPC10:
.LFB10:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$10140, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	movl	8(%ebp), %eax
	movl	%eax, -10140(%ebp)
	leal	-10104(%ebp), %ebx
	movl	%ebx, -10148(%ebp)
	cmpl	$0, __asan_option_detect_stack_use_after_return
	je	.L230
	subl	$8, %esp
	pushl	%ebx
	pushl	$10076
	call	__asan_stack_malloc_8
	addl	$16, %esp
	movl	%eax, %ebx
.L230:
	leal	10080(%ebx), %eax
	movl	%eax, -10144(%ebp)
	movl	$1102416563, (%ebx)
	movl	$.LC74, 4(%ebx)
	movl	$.LASANPC10, 8(%ebx)
	movl	%ebx, %eax
	shrl	$3, %eax
	movl	%eax, -10152(%ebp)
	movl	$-235802127, 536870912(%eax)
	movl	$-185335808, 536872164(%eax)
	movl	%gs:20, %eax
	movl	%eax, -28(%ebp)
	xorl	%eax, %eax
	subl	$8, %esp
	pushl	$.LC75
	pushl	-10140(%ebp)
	call	fopen
	addl	$16, %esp
	movl	%eax, -10112(%ebp)
	cmpl	$0, -10112(%ebp)
	jne	.L234
	subl	$12, %esp
	pushl	-10140(%ebp)
	call	perror
	addl	$16, %esp
	call	__asan_handle_no_return
	subl	$12, %esp
	pushl	$1
	call	exit
.L234:
	jmp	.L235
.L276:
	subl	$8, %esp
	pushl	$35
	movl	-10144(%ebp), %eax
	subl	$10048, %eax
	pushl	%eax
	call	strchr
	addl	$16, %esp
	movl	%eax, -10124(%ebp)
	cmpl	$0, -10124(%ebp)
	je	.L236
	movl	-10124(%ebp), %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%al
	movl	%eax, %esi
	movl	%edx, %eax
	andl	$7, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%esi, %eax
	testb	%al, %al
	je	.L237
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_store1
.L237:
	movl	-10124(%ebp), %eax
	movb	$0, (%eax)
.L236:
	movl	-10144(%ebp), %eax
	subl	$10048, %eax
	movl	%eax, -10124(%ebp)
	subl	$8, %esp
	pushl	$.LC76
	pushl	-10124(%ebp)
	call	strspn
	addl	$16, %esp
	addl	%eax, -10124(%ebp)
	jmp	.L238
.L275:
	subl	$8, %esp
	pushl	$.LC76
	pushl	-10124(%ebp)
	call	strcspn
	addl	$16, %esp
	movl	-10124(%ebp), %edx
	addl	%edx, %eax
	movl	%eax, -10120(%ebp)
	jmp	.L239
.L242:
	movl	-10120(%ebp), %ecx
	leal	1(%ecx), %eax
	movl	%eax, -10120(%ebp)
	movl	%ecx, %esi
	movl	%esi, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %edx
	testb	%dl, %dl
	setne	%al
	movl	%eax, %edi
	movl	%esi, %eax
	andl	$7, %eax
	cmpb	%dl, %al
	setge	%al
	andl	%edi, %eax
	testb	%al, %al
	je	.L240
	subl	$12, %esp
	pushl	%esi
	call	__asan_report_store1
.L240:
	movb	$0, (%ecx)
.L239:
	movl	-10120(%ebp), %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%al
	movl	%eax, %esi
	movl	%edx, %eax
	andl	$7, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%esi, %eax
	testb	%al, %al
	je	.L241
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_load1
.L241:
	movl	-10120(%ebp), %eax
	movzbl	(%eax), %eax
	cmpb	$32, %al
	je	.L242
	movl	-10120(%ebp), %eax
	movzbl	(%eax), %eax
	cmpb	$9, %al
	je	.L242
	movl	-10120(%ebp), %eax
	movzbl	(%eax), %eax
	cmpb	$10, %al
	je	.L242
	movl	-10120(%ebp), %eax
	movzbl	(%eax), %eax
	cmpb	$13, %al
	je	.L242
	movl	-10124(%ebp), %eax
	movl	%eax, -10108(%ebp)
	subl	$8, %esp
	pushl	$61
	pushl	-10108(%ebp)
	call	strchr
	addl	$16, %esp
	movl	%eax, -10116(%ebp)
	cmpl	$0, -10116(%ebp)
	je	.L243
	movl	-10116(%ebp), %ecx
	leal	1(%ecx), %eax
	movl	%eax, -10116(%ebp)
	movl	%ecx, %esi
	movl	%esi, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %edx
	testb	%dl, %dl
	setne	%al
	movl	%eax, %edi
	movl	%esi, %eax
	andl	$7, %eax
	cmpb	%dl, %al
	setge	%al
	andl	%edi, %eax
	testb	%al, %al
	je	.L244
	subl	$12, %esp
	pushl	%esi
	call	__asan_report_store1
.L244:
	movb	$0, (%ecx)
.L243:
	subl	$8, %esp
	pushl	$.LC77
	pushl	-10108(%ebp)
	call	strcasecmp
	addl	$16, %esp
	testl	%eax, %eax
	jne	.L245
	subl	$8, %esp
	pushl	-10116(%ebp)
	pushl	-10108(%ebp)
	call	no_value_required
	addl	$16, %esp
	movl	$1, debug
	jmp	.L246
.L245:
	subl	$8, %esp
	pushl	$.LC78
	pushl	-10108(%ebp)
	call	strcasecmp
	addl	$16, %esp
	testl	%eax, %eax
	jne	.L247
	subl	$8, %esp
	pushl	-10116(%ebp)
	pushl	-10108(%ebp)
	call	value_required
	addl	$16, %esp
	subl	$12, %esp
	pushl	-10116(%ebp)
	call	atoi
	addl	$16, %esp
	movw	%ax, port
	jmp	.L246
.L247:
	subl	$8, %esp
	pushl	$.LC79
	pushl	-10108(%ebp)
	call	strcasecmp
	addl	$16, %esp
	testl	%eax, %eax
	jne	.L248
	subl	$8, %esp
	pushl	-10116(%ebp)
	pushl	-10108(%ebp)
	call	value_required
	addl	$16, %esp
	subl	$12, %esp
	pushl	-10116(%ebp)
	call	e_strdup
	addl	$16, %esp
	movl	%eax, dir
	jmp	.L246
.L248:
	subl	$8, %esp
	pushl	$.LC28
	pushl	-10108(%ebp)
	call	strcasecmp
	addl	$16, %esp
	testl	%eax, %eax
	jne	.L249
	subl	$8, %esp
	pushl	-10116(%ebp)
	pushl	-10108(%ebp)
	call	no_value_required
	addl	$16, %esp
	movl	$1, do_chroot
	movl	$1, no_symlink_check
	jmp	.L246
.L249:
	subl	$8, %esp
	pushl	$.LC80
	pushl	-10108(%ebp)
	call	strcasecmp
	addl	$16, %esp
	testl	%eax, %eax
	jne	.L250
	subl	$8, %esp
	pushl	-10116(%ebp)
	pushl	-10108(%ebp)
	call	no_value_required
	addl	$16, %esp
	movl	$0, do_chroot
	movl	$0, no_symlink_check
	jmp	.L246
.L250:
	subl	$8, %esp
	pushl	$.LC81
	pushl	-10108(%ebp)
	call	strcasecmp
	addl	$16, %esp
	testl	%eax, %eax
	jne	.L251
	subl	$8, %esp
	pushl	-10116(%ebp)
	pushl	-10108(%ebp)
	call	value_required
	addl	$16, %esp
	subl	$12, %esp
	pushl	-10116(%ebp)
	call	e_strdup
	addl	$16, %esp
	movl	%eax, data_dir
	jmp	.L246
.L251:
	subl	$8, %esp
	pushl	$.LC82
	pushl	-10108(%ebp)
	call	strcasecmp
	addl	$16, %esp
	testl	%eax, %eax
	jne	.L252
	subl	$8, %esp
	pushl	-10116(%ebp)
	pushl	-10108(%ebp)
	call	no_value_required
	addl	$16, %esp
	movl	$0, no_symlink_check
	jmp	.L246
.L252:
	subl	$8, %esp
	pushl	$.LC83
	pushl	-10108(%ebp)
	call	strcasecmp
	addl	$16, %esp
	testl	%eax, %eax
	jne	.L253
	subl	$8, %esp
	pushl	-10116(%ebp)
	pushl	-10108(%ebp)
	call	no_value_required
	addl	$16, %esp
	movl	$1, no_symlink_check
	jmp	.L246
.L253:
	subl	$8, %esp
	pushl	$.LC84
	pushl	-10108(%ebp)
	call	strcasecmp
	addl	$16, %esp
	testl	%eax, %eax
	jne	.L254
	subl	$8, %esp
	pushl	-10116(%ebp)
	pushl	-10108(%ebp)
	call	no_value_required
	addl	$16, %esp
	movl	$0, no_symlink_check
	jmp	.L246
.L254:
	subl	$8, %esp
	pushl	$.LC85
	pushl	-10108(%ebp)
	call	strcasecmp
	addl	$16, %esp
	testl	%eax, %eax
	jne	.L255
	subl	$8, %esp
	pushl	-10116(%ebp)
	pushl	-10108(%ebp)
	call	no_value_required
	addl	$16, %esp
	movl	$1, no_symlink_check
	jmp	.L246
.L255:
	subl	$8, %esp
	pushl	$.LC86
	pushl	-10108(%ebp)
	call	strcasecmp
	addl	$16, %esp
	testl	%eax, %eax
	jne	.L256
	subl	$8, %esp
	pushl	-10116(%ebp)
	pushl	-10108(%ebp)
	call	value_required
	addl	$16, %esp
	subl	$12, %esp
	pushl	-10116(%ebp)
	call	e_strdup
	addl	$16, %esp
	movl	%eax, user
	jmp	.L246
.L256:
	subl	$8, %esp
	pushl	$.LC87
	pushl	-10108(%ebp)
	call	strcasecmp
	addl	$16, %esp
	testl	%eax, %eax
	jne	.L257
	subl	$8, %esp
	pushl	-10116(%ebp)
	pushl	-10108(%ebp)
	call	value_required
	addl	$16, %esp
	subl	$12, %esp
	pushl	-10116(%ebp)
	call	e_strdup
	addl	$16, %esp
	movl	%eax, cgi_pattern
	jmp	.L246
.L257:
	subl	$8, %esp
	pushl	$.LC88
	pushl	-10108(%ebp)
	call	strcasecmp
	addl	$16, %esp
	testl	%eax, %eax
	jne	.L258
	subl	$8, %esp
	pushl	-10116(%ebp)
	pushl	-10108(%ebp)
	call	value_required
	addl	$16, %esp
	subl	$12, %esp
	pushl	-10116(%ebp)
	call	atoi
	addl	$16, %esp
	movl	%eax, cgi_limit
	jmp	.L246
.L258:
	subl	$8, %esp
	pushl	$.LC89
	pushl	-10108(%ebp)
	call	strcasecmp
	addl	$16, %esp
	testl	%eax, %eax
	jne	.L259
	subl	$8, %esp
	pushl	-10116(%ebp)
	pushl	-10108(%ebp)
	call	value_required
	addl	$16, %esp
	subl	$12, %esp
	pushl	-10116(%ebp)
	call	e_strdup
	addl	$16, %esp
	movl	%eax, url_pattern
	jmp	.L246
.L259:
	subl	$8, %esp
	pushl	$.LC90
	pushl	-10108(%ebp)
	call	strcasecmp
	addl	$16, %esp
	testl	%eax, %eax
	jne	.L260
	subl	$8, %esp
	pushl	-10116(%ebp)
	pushl	-10108(%ebp)
	call	no_value_required
	addl	$16, %esp
	movl	$1, no_empty_referers
	jmp	.L246
.L260:
	subl	$8, %esp
	pushl	$.LC91
	pushl	-10108(%ebp)
	call	strcasecmp
	addl	$16, %esp
	testl	%eax, %eax
	jne	.L261
	subl	$8, %esp
	pushl	-10116(%ebp)
	pushl	-10108(%ebp)
	call	value_required
	addl	$16, %esp
	subl	$12, %esp
	pushl	-10116(%ebp)
	call	e_strdup
	addl	$16, %esp
	movl	%eax, local_pattern
	jmp	.L246
.L261:
	subl	$8, %esp
	pushl	$.LC92
	pushl	-10108(%ebp)
	call	strcasecmp
	addl	$16, %esp
	testl	%eax, %eax
	jne	.L262
	subl	$8, %esp
	pushl	-10116(%ebp)
	pushl	-10108(%ebp)
	call	value_required
	addl	$16, %esp
	subl	$12, %esp
	pushl	-10116(%ebp)
	call	e_strdup
	addl	$16, %esp
	movl	%eax, throttlefile
	jmp	.L246
.L262:
	subl	$8, %esp
	pushl	$.LC93
	pushl	-10108(%ebp)
	call	strcasecmp
	addl	$16, %esp
	testl	%eax, %eax
	jne	.L263
	subl	$8, %esp
	pushl	-10116(%ebp)
	pushl	-10108(%ebp)
	call	value_required
	addl	$16, %esp
	subl	$12, %esp
	pushl	-10116(%ebp)
	call	e_strdup
	addl	$16, %esp
	movl	%eax, hostname
	jmp	.L246
.L263:
	subl	$8, %esp
	pushl	$.LC94
	pushl	-10108(%ebp)
	call	strcasecmp
	addl	$16, %esp
	testl	%eax, %eax
	jne	.L264
	subl	$8, %esp
	pushl	-10116(%ebp)
	pushl	-10108(%ebp)
	call	value_required
	addl	$16, %esp
	subl	$12, %esp
	pushl	-10116(%ebp)
	call	e_strdup
	addl	$16, %esp
	movl	%eax, logfile
	jmp	.L246
.L264:
	subl	$8, %esp
	pushl	$.LC95
	pushl	-10108(%ebp)
	call	strcasecmp
	addl	$16, %esp
	testl	%eax, %eax
	jne	.L265
	subl	$8, %esp
	pushl	-10116(%ebp)
	pushl	-10108(%ebp)
	call	no_value_required
	addl	$16, %esp
	movl	$1, do_vhost
	jmp	.L246
.L265:
	subl	$8, %esp
	pushl	$.LC96
	pushl	-10108(%ebp)
	call	strcasecmp
	addl	$16, %esp
	testl	%eax, %eax
	jne	.L266
	subl	$8, %esp
	pushl	-10116(%ebp)
	pushl	-10108(%ebp)
	call	no_value_required
	addl	$16, %esp
	movl	$0, do_vhost
	jmp	.L246
.L266:
	subl	$8, %esp
	pushl	$.LC97
	pushl	-10108(%ebp)
	call	strcasecmp
	addl	$16, %esp
	testl	%eax, %eax
	jne	.L267
	subl	$8, %esp
	pushl	-10116(%ebp)
	pushl	-10108(%ebp)
	call	no_value_required
	addl	$16, %esp
	movl	$1, do_global_passwd
	jmp	.L246
.L267:
	subl	$8, %esp
	pushl	$.LC98
	pushl	-10108(%ebp)
	call	strcasecmp
	addl	$16, %esp
	testl	%eax, %eax
	jne	.L268
	subl	$8, %esp
	pushl	-10116(%ebp)
	pushl	-10108(%ebp)
	call	no_value_required
	addl	$16, %esp
	movl	$0, do_global_passwd
	jmp	.L246
.L268:
	subl	$8, %esp
	pushl	$.LC99
	pushl	-10108(%ebp)
	call	strcasecmp
	addl	$16, %esp
	testl	%eax, %eax
	jne	.L269
	subl	$8, %esp
	pushl	-10116(%ebp)
	pushl	-10108(%ebp)
	call	value_required
	addl	$16, %esp
	subl	$12, %esp
	pushl	-10116(%ebp)
	call	e_strdup
	addl	$16, %esp
	movl	%eax, pidfile
	jmp	.L246
.L269:
	subl	$8, %esp
	pushl	$.LC100
	pushl	-10108(%ebp)
	call	strcasecmp
	addl	$16, %esp
	testl	%eax, %eax
	jne	.L270
	subl	$8, %esp
	pushl	-10116(%ebp)
	pushl	-10108(%ebp)
	call	value_required
	addl	$16, %esp
	subl	$12, %esp
	pushl	-10116(%ebp)
	call	e_strdup
	addl	$16, %esp
	movl	%eax, charset
	jmp	.L246
.L270:
	subl	$8, %esp
	pushl	$.LC101
	pushl	-10108(%ebp)
	call	strcasecmp
	addl	$16, %esp
	testl	%eax, %eax
	jne	.L271
	subl	$8, %esp
	pushl	-10116(%ebp)
	pushl	-10108(%ebp)
	call	value_required
	addl	$16, %esp
	subl	$12, %esp
	pushl	-10116(%ebp)
	call	e_strdup
	addl	$16, %esp
	movl	%eax, p3p
	jmp	.L246
.L271:
	subl	$8, %esp
	pushl	$.LC102
	pushl	-10108(%ebp)
	call	strcasecmp
	addl	$16, %esp
	testl	%eax, %eax
	jne	.L272
	subl	$8, %esp
	pushl	-10116(%ebp)
	pushl	-10108(%ebp)
	call	value_required
	addl	$16, %esp
	subl	$12, %esp
	pushl	-10116(%ebp)
	call	atoi
	addl	$16, %esp
	movl	%eax, max_age
	jmp	.L246
.L272:
	movl	argv0, %ecx
	movl	$stderr, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L273
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L273:
	movl	stderr, %eax
	pushl	-10108(%ebp)
	pushl	%ecx
	pushl	$.LC103
	pushl	%eax
	call	fprintf
	addl	$16, %esp
	call	__asan_handle_no_return
	subl	$12, %esp
	pushl	$1
	call	exit
.L246:
	movl	-10120(%ebp), %eax
	movl	%eax, -10124(%ebp)
	subl	$8, %esp
	pushl	$.LC76
	pushl	-10124(%ebp)
	call	strspn
	addl	$16, %esp
	addl	%eax, -10124(%ebp)
.L238:
	movl	-10124(%ebp), %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%al
	movl	%eax, %esi
	movl	%edx, %eax
	andl	$7, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%esi, %eax
	testb	%al, %al
	je	.L274
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_load1
.L274:
	movl	-10124(%ebp), %eax
	movzbl	(%eax), %eax
	testb	%al, %al
	jne	.L275
.L235:
	subl	$4, %esp
	pushl	-10112(%ebp)
	pushl	$10000
	movl	-10144(%ebp), %eax
	subl	$10048, %eax
	pushl	%eax
	call	fgets
	addl	$16, %esp
	testl	%eax, %eax
	jne	.L276
	subl	$12, %esp
	pushl	-10112(%ebp)
	call	fclose
	addl	$16, %esp
	cmpl	%ebx, -10148(%ebp)
	je	.L231
	movl	$1172321806, (%ebx)
	subl	$4, %esp
	pushl	-10148(%ebp)
	pushl	$10076
	pushl	%ebx
	call	__asan_stack_free_8
	addl	$16, %esp
	jmp	.L232
.L231:
	movl	-10152(%ebp), %eax
	movl	$0, 536870912(%eax)
	movl	$0, 536872164(%eax)
.L232:
	movl	-28(%ebp), %eax
	xorl	%gs:20, %eax
	je	.L277
	call	__stack_chk_fail
.L277:
	leal	-12(%ebp), %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE10:
	.size	read_config, .-read_config
	.section	.rodata
	.align 32
.LC104:
	.string	"%s: value required for %s option\n"
	.zero	62
	.text
	.type	value_required, @function
value_required:
.LASANPC11:
.LFB11:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%esi
	pushl	%ebx
	.cfi_offset 6, -12
	.cfi_offset 3, -16
	cmpl	$0, 12(%ebp)
	jne	.L278
	movl	argv0, %ecx
	movl	$stderr, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L280
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L280:
	movl	stderr, %eax
	pushl	8(%ebp)
	pushl	%ecx
	pushl	$.LC104
	pushl	%eax
	call	fprintf
	addl	$16, %esp
	call	__asan_handle_no_return
	subl	$12, %esp
	pushl	$1
	call	exit
.L278:
	leal	-8(%ebp), %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE11:
	.size	value_required, .-value_required
	.section	.rodata
	.align 32
.LC105:
	.string	"%s: no value required for %s option\n"
	.zero	59
	.text
	.type	no_value_required, @function
no_value_required:
.LASANPC12:
.LFB12:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%esi
	pushl	%ebx
	.cfi_offset 6, -12
	.cfi_offset 3, -16
	cmpl	$0, 12(%ebp)
	je	.L281
	movl	argv0, %ecx
	movl	$stderr, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L283
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L283:
	movl	stderr, %eax
	pushl	8(%ebp)
	pushl	%ecx
	pushl	$.LC105
	pushl	%eax
	call	fprintf
	addl	$16, %esp
	call	__asan_handle_no_return
	subl	$12, %esp
	pushl	$1
	call	exit
.L281:
	leal	-8(%ebp), %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE12:
	.size	no_value_required, .-no_value_required
	.section	.rodata
	.align 32
.LC106:
	.string	"out of memory copying a string"
	.zero	33
	.align 32
.LC107:
	.string	"%s: out of memory copying a string\n"
	.zero	60
	.text
	.type	e_strdup, @function
e_strdup:
.LASANPC13:
.LFB13:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%esi
	pushl	%ebx
	subl	$16, %esp
	.cfi_offset 6, -12
	.cfi_offset 3, -16
	subl	$12, %esp
	pushl	8(%ebp)
	call	strdup
	addl	$16, %esp
	movl	%eax, -12(%ebp)
	cmpl	$0, -12(%ebp)
	jne	.L285
	subl	$8, %esp
	pushl	$.LC106
	pushl	$2
	call	syslog
	addl	$16, %esp
	movl	argv0, %ecx
	movl	$stderr, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L286
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L286:
	movl	stderr, %eax
	subl	$4, %esp
	pushl	%ecx
	pushl	$.LC107
	pushl	%eax
	call	fprintf
	addl	$16, %esp
	call	__asan_handle_no_return
	subl	$12, %esp
	pushl	$1
	call	exit
.L285:
	movl	-12(%ebp), %eax
	leal	-8(%ebp), %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE13:
	.size	e_strdup, .-e_strdup
	.globl	__asan_stack_malloc_2
	.section	.rodata
	.align 4
.LC108:
	.string	"3 32 4 2 ai 96 32 5 hints 160 10 7 portstr "
	.align 32
.LC109:
	.string	"%d"
	.zero	61
	.align 32
.LC110:
	.string	"getaddrinfo %.80s - %.80s"
	.zero	38
	.align 32
.LC111:
	.string	"%s: getaddrinfo %s - %s\n"
	.zero	39
	.align 32
.LC112:
	.string	"%.80s - sockaddr too small (%lu < %lu)"
	.zero	57
	.text
	.type	lookup_hostname, @function
lookup_hostname:
.LASANPC14:
.LFB14:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$300, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	movl	8(%ebp), %eax
	movl	%eax, -268(%ebp)
	movl	16(%ebp), %eax
	movl	%eax, -272(%ebp)
	movl	20(%ebp), %eax
	movl	%eax, -276(%ebp)
	movl	28(%ebp), %eax
	movl	%eax, -280(%ebp)
	leal	-248(%ebp), %eax
	movl	%eax, -284(%ebp)
	movl	%eax, -304(%ebp)
	cmpl	$0, __asan_option_detect_stack_use_after_return
	je	.L288
	subl	$8, %esp
	pushl	-284(%ebp)
	pushl	$220
	call	__asan_stack_malloc_2
	addl	$16, %esp
	movl	%eax, -284(%ebp)
.L288:
	movl	-284(%ebp), %edi
	movl	%edi, %eax
	addl	$224, %eax
	movl	%eax, %esi
	movl	%esi, -292(%ebp)
	movl	%edi, %eax
	movl	$1102416563, (%eax)
	movl	%edi, %eax
	movl	$.LC108, 4(%eax)
	movl	$.LASANPC14, 8(%eax)
	shrl	$3, %eax
	movl	%eax, %edi
	movl	$-235802127, 536870912(%edi)
	movl	$-185273340, 536870916(%edi)
	movl	$-218959118, 536870920(%edi)
	movl	$-218959118, 536870928(%edi)
	movl	$-185335296, 536870932(%edi)
	movl	%gs:20, %eax
	movl	%eax, -28(%ebp)
	xorl	%eax, %eax
	movl	%esi, %eax
	addl	$-128, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%edx, %eax
	andl	$7, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L292
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_store1
.L292:
	movl	-292(%ebp), %eax
	addl	$-128, %eax
	addl	$31, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%edx, %eax
	andl	$7, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L293
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_store1
.L293:
	subl	$4, %esp
	pushl	$32
	pushl	$0
	movl	-292(%ebp), %esi
	movl	%esi, %eax
	addl	$-128, %eax
	pushl	%eax
	call	memset
	addl	$16, %esp
	movl	%esi, %eax
	movl	$0, -124(%eax)
	movl	%esi, %eax
	movl	$1, -128(%eax)
	movl	%esi, %eax
	movl	$1, -120(%eax)
	movzwl	port, %eax
	movzwl	%ax, %eax
	pushl	%eax
	pushl	$.LC109
	pushl	$10
	movl	%esi, %eax
	subl	$64, %eax
	pushl	%eax
	call	snprintf
	addl	$16, %esp
	movl	hostname, %eax
	leal	-192(%esi), %edx
	pushl	%edx
	leal	-128(%esi), %edx
	pushl	%edx
	leal	-64(%esi), %edx
	pushl	%edx
	pushl	%eax
	call	getaddrinfo
	addl	$16, %esp
	movl	%eax, -252(%ebp)
	cmpl	$0, -252(%ebp)
	je	.L294
	subl	$12, %esp
	pushl	-252(%ebp)
	call	gai_strerror
	addl	$16, %esp
	movl	hostname, %edx
	pushl	%eax
	pushl	%edx
	pushl	$.LC110
	pushl	$2
	call	syslog
	addl	$16, %esp
	subl	$12, %esp
	pushl	-252(%ebp)
	call	gai_strerror
	addl	$16, %esp
	movl	%eax, %ebx
	movl	hostname, %edi
	movl	argv0, %esi
	movl	$stderr, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	-284(%ebp)
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	setge	%al
	andb	-284(%ebp), %al
	testb	%al, %al
	je	.L295
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_load4
.L295:
	movl	stderr, %eax
	subl	$12, %esp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	pushl	$.LC111
	pushl	%eax
	call	fprintf
	addl	$32, %esp
	call	__asan_handle_no_return
	subl	$12, %esp
	pushl	$1
	call	exit
.L294:
	movl	$0, -260(%ebp)
	movl	$0, -256(%ebp)
	movl	-292(%ebp), %eax
	movl	-192(%eax), %eax
	movl	%eax, -264(%ebp)
	jmp	.L296
.L304:
	movl	-264(%ebp), %eax
	addl	$4, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L297
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_load4
.L297:
	movl	-264(%ebp), %eax
	movl	4(%eax), %eax
	cmpl	$2, %eax
	je	.L299
	cmpl	$10, %eax
	jne	.L298
	cmpl	$0, -260(%ebp)
	jne	.L301
	movl	-264(%ebp), %eax
	movl	%eax, -260(%ebp)
	jmp	.L298
.L301:
	jmp	.L298
.L299:
	cmpl	$0, -256(%ebp)
	jne	.L302
	movl	-264(%ebp), %eax
	movl	%eax, -256(%ebp)
	jmp	.L334
.L302:
.L334:
	nop
.L298:
	movl	-264(%ebp), %eax
	addl	$28, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L303
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_load4
.L303:
	movl	-264(%ebp), %eax
	movl	28(%eax), %eax
	movl	%eax, -264(%ebp)
.L296:
	cmpl	$0, -264(%ebp)
	jne	.L304
	cmpl	$0, -260(%ebp)
	jne	.L305
	movl	-280(%ebp), %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L306
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_store4
.L306:
	movl	-280(%ebp), %eax
	movl	$0, (%eax)
	jmp	.L307
.L305:
	movl	-260(%ebp), %eax
	addl	$16, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L308
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_load4
.L308:
	movl	-260(%ebp), %eax
	movl	16(%eax), %eax
	cmpl	24(%ebp), %eax
	jbe	.L309
	movl	-260(%ebp), %eax
	movl	16(%eax), %edx
	movl	hostname, %eax
	subl	$12, %esp
	pushl	%edx
	pushl	24(%ebp)
	pushl	%eax
	pushl	$.LC112
	pushl	$2
	call	syslog
	addl	$32, %esp
	call	__asan_handle_no_return
	subl	$12, %esp
	pushl	$1
	call	exit
.L309:
	cmpl	$0, 24(%ebp)
	je	.L310
	movl	-276(%ebp), %esi
	movl	%esi, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %edx
	testb	%dl, %dl
	setne	%cl
	movl	%esi, %eax
	andl	$7, %eax
	cmpb	%dl, %al
	setge	%al
	andl	%eax, %ecx
	movb	%cl, -288(%ebp)
	movl	24(%ebp), %eax
	leal	-1(%eax), %edx
	movl	-276(%ebp), %eax
	addl	%edx, %eax
	movl	%eax, %ecx
	movl	%ecx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ecx, %eax
	andl	$7, %eax
	cmpb	%dl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L311
	subl	$12, %esp
	pushl	%ecx
	call	__asan_report_store1
.L311:
	cmpb	$0, -288(%ebp)
	je	.L310
	subl	$12, %esp
	pushl	%esi
	call	__asan_report_store1
.L310:
	subl	$4, %esp
	pushl	24(%ebp)
	pushl	$0
	pushl	-276(%ebp)
	call	memset
	addl	$16, %esp
	movl	-260(%ebp), %eax
	addl	$16, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L312
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_load4
.L312:
	movl	-260(%ebp), %eax
	movl	16(%eax), %eax
	movl	%eax, -288(%ebp)
	movl	-260(%ebp), %eax
	addl	$20, %eax
	movl	%eax, %ecx
	movl	%ecx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ecx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L313
	subl	$12, %esp
	pushl	%ecx
	call	__asan_report_load4
.L313:
	movl	-260(%ebp), %eax
	movl	20(%eax), %eax
	movl	%eax, %ebx
	movl	%ebx, -296(%ebp)
	cmpl	$0, -288(%ebp)
	je	.L314
	movl	%ebx, %esi
	movl	%esi, %ecx
	shrl	$3, %ecx
	movl	%ecx, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %edx
	testb	%dl, %dl
	setne	%cl
	movl	%esi, %eax
	andl	$7, %eax
	cmpb	%dl, %al
	setge	%al
	andl	%eax, %ecx
	movb	%cl, -297(%ebp)
	movl	-288(%ebp), %eax
	subl	$1, %eax
	addl	%ebx, %eax
	movl	%eax, %ecx
	movl	%ecx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ecx, %eax
	andl	$7, %eax
	cmpb	%dl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L315
	subl	$12, %esp
	pushl	%ecx
	call	__asan_report_load1
.L315:
	cmpb	$0, -297(%ebp)
	je	.L314
	subl	$12, %esp
	pushl	%esi
	call	__asan_report_load1
.L314:
	movl	-288(%ebp), %ebx
	movl	%ebx, %eax
	testl	%eax, %eax
	je	.L316
	movl	-276(%ebp), %esi
	movl	%esi, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %edx
	testb	%dl, %dl
	setne	%cl
	movl	%esi, %eax
	andl	$7, %eax
	cmpb	%dl, %al
	setge	%al
	andl	%eax, %ecx
	movb	%cl, -297(%ebp)
	movl	%ebx, %eax
	leal	-1(%eax), %edx
	movl	-276(%ebp), %eax
	addl	%edx, %eax
	movl	%eax, %ecx
	movl	%ecx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ecx, %eax
	andl	$7, %eax
	cmpb	%dl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L317
	subl	$12, %esp
	pushl	%ecx
	call	__asan_report_store1
.L317:
	cmpb	$0, -297(%ebp)
	je	.L316
	subl	$12, %esp
	pushl	%esi
	call	__asan_report_store1
.L316:
	subl	$4, %esp
	pushl	-288(%ebp)
	pushl	-296(%ebp)
	pushl	-276(%ebp)
	call	memmove
	addl	$16, %esp
	movl	-280(%ebp), %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L318
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_store4
.L318:
	movl	-280(%ebp), %eax
	movl	$1, (%eax)
.L307:
	cmpl	$0, -256(%ebp)
	jne	.L319
	movl	-272(%ebp), %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L320
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_store4
.L320:
	movl	-272(%ebp), %eax
	movl	$0, (%eax)
	jmp	.L321
.L319:
	movl	-256(%ebp), %eax
	addl	$16, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L322
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_load4
.L322:
	movl	-256(%ebp), %eax
	movl	16(%eax), %eax
	cmpl	12(%ebp), %eax
	jbe	.L323
	movl	-256(%ebp), %eax
	movl	16(%eax), %edx
	movl	hostname, %eax
	subl	$12, %esp
	pushl	%edx
	pushl	12(%ebp)
	pushl	%eax
	pushl	$.LC112
	pushl	$2
	call	syslog
	addl	$32, %esp
	call	__asan_handle_no_return
	subl	$12, %esp
	pushl	$1
	call	exit
.L323:
	cmpl	$0, 12(%ebp)
	je	.L324
	movl	-268(%ebp), %esi
	movl	%esi, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %edx
	testb	%dl, %dl
	setne	%cl
	movl	%esi, %eax
	andl	$7, %eax
	cmpb	%dl, %al
	setge	%al
	andl	%eax, %ecx
	movb	%cl, -288(%ebp)
	movl	12(%ebp), %eax
	leal	-1(%eax), %edx
	movl	-268(%ebp), %eax
	addl	%edx, %eax
	movl	%eax, %ecx
	movl	%ecx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ecx, %eax
	andl	$7, %eax
	cmpb	%dl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L325
	subl	$12, %esp
	pushl	%ecx
	call	__asan_report_store1
.L325:
	cmpb	$0, -288(%ebp)
	je	.L324
	subl	$12, %esp
	pushl	%esi
	call	__asan_report_store1
.L324:
	subl	$4, %esp
	pushl	12(%ebp)
	pushl	$0
	pushl	-268(%ebp)
	call	memset
	addl	$16, %esp
	movl	-256(%ebp), %eax
	addl	$16, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L326
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_load4
.L326:
	movl	-256(%ebp), %eax
	movl	16(%eax), %eax
	movl	%eax, -288(%ebp)
	movl	-256(%ebp), %eax
	addl	$20, %eax
	movl	%eax, %ecx
	movl	%ecx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ecx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L327
	subl	$12, %esp
	pushl	%ecx
	call	__asan_report_load4
.L327:
	movl	-256(%ebp), %eax
	movl	20(%eax), %eax
	movl	%eax, %ebx
	movl	%ebx, -296(%ebp)
	cmpl	$0, -288(%ebp)
	je	.L328
	movl	%ebx, %esi
	movl	%esi, %ecx
	shrl	$3, %ecx
	movl	%ecx, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %edx
	testb	%dl, %dl
	setne	%cl
	movl	%esi, %eax
	andl	$7, %eax
	cmpb	%dl, %al
	setge	%al
	andl	%eax, %ecx
	movb	%cl, -297(%ebp)
	movl	-288(%ebp), %eax
	subl	$1, %eax
	addl	%ebx, %eax
	movl	%eax, %ecx
	movl	%ecx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ecx, %eax
	andl	$7, %eax
	cmpb	%dl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L329
	subl	$12, %esp
	pushl	%ecx
	call	__asan_report_load1
.L329:
	cmpb	$0, -297(%ebp)
	je	.L328
	subl	$12, %esp
	pushl	%esi
	call	__asan_report_load1
.L328:
	movl	-288(%ebp), %ebx
	movl	%ebx, %eax
	testl	%eax, %eax
	je	.L330
	movl	-268(%ebp), %esi
	movl	%esi, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %edx
	testb	%dl, %dl
	setne	%cl
	movl	%esi, %eax
	andl	$7, %eax
	cmpb	%dl, %al
	setge	%al
	andl	%eax, %ecx
	movb	%cl, -297(%ebp)
	movl	%ebx, %eax
	leal	-1(%eax), %edx
	movl	-268(%ebp), %eax
	addl	%edx, %eax
	movl	%eax, %ecx
	movl	%ecx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ecx, %eax
	andl	$7, %eax
	cmpb	%dl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L331
	subl	$12, %esp
	pushl	%ecx
	call	__asan_report_store1
.L331:
	cmpb	$0, -297(%ebp)
	je	.L330
	subl	$12, %esp
	pushl	%esi
	call	__asan_report_store1
.L330:
	subl	$4, %esp
	pushl	-288(%ebp)
	pushl	-296(%ebp)
	pushl	-268(%ebp)
	call	memmove
	addl	$16, %esp
	movl	-272(%ebp), %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L332
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_store4
.L332:
	movl	-272(%ebp), %eax
	movl	$1, (%eax)
.L321:
	movl	-292(%ebp), %eax
	movl	-192(%eax), %eax
	subl	$12, %esp
	pushl	%eax
	call	freeaddrinfo
	addl	$16, %esp
	movl	-284(%ebp), %esi
	cmpl	%esi, -304(%ebp)
	je	.L289
	movl	-284(%ebp), %eax
	movl	$1172321806, (%eax)
	movl	$-168430091, 536870912(%edi)
	movl	$-168430091, 536870916(%edi)
	movl	$-168430091, 536870920(%edi)
	movl	$-168430091, 536870924(%edi)
	movl	$-168430091, 536870928(%edi)
	movl	$-168430091, 536870932(%edi)
	movw	$-2571, 536870936(%edi)
	movb	$-11, 536870938(%edi)
	jmp	.L290
.L289:
	movl	$0, 536870912(%edi)
	movl	$0, 536870916(%edi)
	movl	$0, 536870920(%edi)
	movl	$0, 536870928(%edi)
	movl	$0, 536870932(%edi)
.L290:
	movl	-28(%ebp), %eax
	xorl	%gs:20, %eax
	je	.L333
	call	__stack_chk_fail
.L333:
	leal	-12(%ebp), %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE14:
	.size	lookup_hostname, .-lookup_hostname
	.section	.rodata
	.align 4
.LC113:
	.string	"5 32 4 9 max_limit 96 4 9 min_limit 160 8 2 tv 224 5000 3 buf 5280 5000 7 pattern "
	.align 32
.LC114:
	.string	" %4900[^ \t] %ld-%ld"
	.zero	44
	.align 32
.LC115:
	.string	" %4900[^ \t] %ld"
	.zero	48
	.align 32
.LC116:
	.string	"unparsable line in %.80s - %.80s"
	.zero	63
	.align 32
.LC117:
	.string	"%s: unparsable line in %.80s - %.80s\n"
	.zero	58
	.align 32
.LC118:
	.string	"|/"
	.zero	61
	.align 32
.LC119:
	.string	"out of memory allocating a throttletab"
	.zero	57
	.align 32
.LC120:
	.string	"%s: out of memory allocating a throttletab\n"
	.zero	52
	.text
	.type	read_throttlefile, @function
read_throttlefile:
.LASANPC15:
.LFB15:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$10396, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	movl	8(%ebp), %eax
	movl	%eax, -10380(%ebp)
	leal	-10360(%ebp), %eax
	movl	%eax, -10384(%ebp)
	movl	%eax, -10388(%ebp)
	cmpl	$0, __asan_option_detect_stack_use_after_return
	je	.L335
	subl	$8, %esp
	pushl	-10384(%ebp)
	pushl	$10332
	call	__asan_stack_malloc_8
	addl	$16, %esp
	movl	%eax, -10384(%ebp)
.L335:
	movl	-10384(%ebp), %esi
	movl	%esi, %eax
	addl	$10336, %eax
	movl	%eax, %ebx
	movl	%esi, %eax
	movl	$1102416563, (%eax)
	movl	%esi, %eax
	movl	$.LC113, 4(%eax)
	movl	$.LASANPC15, 8(%eax)
	shrl	$3, %eax
	movl	%eax, -10392(%ebp)
	movl	$-235802127, 536870912(%eax)
	movl	$-185273340, 536870916(%eax)
	movl	$-218959118, 536870920(%eax)
	movl	$-185273340, 536870924(%eax)
	movl	$-218959118, 536870928(%eax)
	movl	$-185273344, 536870932(%eax)
	movl	$-218959118, 536870936(%eax)
	movl	$-185273344, 536871564(%eax)
	movl	$-218959118, 536871568(%eax)
	movl	$-185273344, 536872196(%eax)
	movl	%gs:20, %eax
	movl	%eax, -28(%ebp)
	xorl	%eax, %eax
	subl	$8, %esp
	pushl	$.LC75
	pushl	-10380(%ebp)
	call	fopen
	addl	$16, %esp
	movl	%eax, -10368(%ebp)
	cmpl	$0, -10368(%ebp)
	jne	.L341
	subl	$4, %esp
	pushl	-10380(%ebp)
	pushl	$.LC15
	pushl	$2
	call	syslog
	addl	$16, %esp
	subl	$12, %esp
	pushl	-10380(%ebp)
	call	perror
	addl	$16, %esp
	call	__asan_handle_no_return
	subl	$12, %esp
	pushl	$1
	call	exit
.L341:
	subl	$8, %esp
	pushl	$0
	leal	-10176(%ebx), %eax
	pushl	%eax
	call	gettimeofday
	addl	$16, %esp
	jmp	.L342
.L372:
	subl	$8, %esp
	pushl	$35
	leal	-10112(%ebx), %eax
	pushl	%eax
	call	strchr
	addl	$16, %esp
	movl	%eax, -10364(%ebp)
	cmpl	$0, -10364(%ebp)
	je	.L343
	movl	-10364(%ebp), %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%al
	movl	%eax, %esi
	movl	%edx, %eax
	andl	$7, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%esi, %eax
	testb	%al, %al
	je	.L344
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_store1
.L344:
	movl	-10364(%ebp), %eax
	movb	$0, (%eax)
.L343:
	leal	-10112(%ebx), %eax
	movl	%eax, -10396(%ebp)
	movl	%eax, %ecx
	movl	%ecx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %edx
	testb	%dl, %dl
	setne	%al
	movl	%eax, %esi
	movl	%ecx, %eax
	andl	$7, %eax
	cmpb	%dl, %al
	setge	%al
	andl	%esi, %eax
	testb	%al, %al
	je	.L345
	subl	$12, %esp
	pushl	%ecx
	call	__asan_report_load1
.L345:
	subl	$12, %esp
	leal	-10112(%ebx), %eax
	pushl	%eax
	call	strlen
	addl	$16, %esp
	movl	%eax, %edi
	movl	-10396(%ebp), %eax
	addl	%edi, %eax
	movl	%eax, %ecx
	movl	%ecx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %edx
	testb	%dl, %dl
	setne	%al
	movl	%eax, %esi
	movl	%ecx, %eax
	andl	$7, %eax
	cmpb	%dl, %al
	setge	%al
	andl	%esi, %eax
	testb	%al, %al
	je	.L346
	subl	$12, %esp
	pushl	%ecx
	call	__asan_report_load1
.L346:
	movl	%edi, -10372(%ebp)
	jmp	.L347
.L351:
	subl	$1, -10372(%ebp)
	leal	-10112(%ebx), %edx
	movl	-10372(%ebp), %eax
	addl	%edx, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%al
	movl	%eax, %esi
	movl	%edx, %eax
	andl	$7, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%esi, %eax
	testb	%al, %al
	je	.L348
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_store1
.L348:
	movl	-10372(%ebp), %eax
	addl	%ebx, %eax
	subl	$10112, %eax
	movb	$0, (%eax)
.L347:
	cmpl	$0, -10372(%ebp)
	jle	.L349
	movl	-10372(%ebp), %eax
	leal	-1(%eax), %edi
	leal	-10112(%ebx), %eax
	addl	%edi, %eax
	movl	%eax, %ecx
	movl	%ecx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %edx
	testb	%dl, %dl
	setne	%al
	movl	%eax, %esi
	movl	%ecx, %eax
	andl	$7, %eax
	cmpb	%dl, %al
	setge	%al
	andl	%esi, %eax
	testb	%al, %al
	je	.L350
	subl	$12, %esp
	pushl	%ecx
	call	__asan_report_load1
.L350:
	movzbl	-10112(%edi,%ebx), %eax
	cmpb	$32, %al
	je	.L351
	movl	-10372(%ebp), %eax
	leal	-1(%eax), %edi
	leal	-10112(%ebx), %eax
	addl	%edi, %eax
	movl	%eax, %ecx
	movl	%ecx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %edx
	testb	%dl, %dl
	setne	%al
	movl	%eax, %esi
	movl	%ecx, %eax
	andl	$7, %eax
	cmpb	%dl, %al
	setge	%al
	andl	%esi, %eax
	testb	%al, %al
	je	.L352
	subl	$12, %esp
	pushl	%ecx
	call	__asan_report_load1
.L352:
	movzbl	-10112(%edi,%ebx), %eax
	cmpb	$9, %al
	je	.L351
	movl	-10372(%ebp), %eax
	leal	-1(%eax), %edi
	leal	-10112(%ebx), %eax
	addl	%edi, %eax
	movl	%eax, %ecx
	movl	%ecx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %edx
	testb	%dl, %dl
	setne	%al
	movl	%eax, %esi
	movl	%ecx, %eax
	andl	$7, %eax
	cmpb	%dl, %al
	setge	%al
	andl	%esi, %eax
	testb	%al, %al
	je	.L353
	subl	$12, %esp
	pushl	%ecx
	call	__asan_report_load1
.L353:
	movzbl	-10112(%edi,%ebx), %eax
	cmpb	$10, %al
	je	.L351
	movl	-10372(%ebp), %eax
	leal	-1(%eax), %edi
	leal	-10112(%ebx), %eax
	addl	%edi, %eax
	movl	%eax, %ecx
	movl	%ecx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %edx
	testb	%dl, %dl
	setne	%al
	movl	%eax, %esi
	movl	%ecx, %eax
	andl	$7, %eax
	cmpb	%dl, %al
	setge	%al
	andl	%esi, %eax
	testb	%al, %al
	je	.L354
	subl	$12, %esp
	pushl	%ecx
	call	__asan_report_load1
.L354:
	movzbl	-10112(%edi,%ebx), %eax
	cmpb	$13, %al
	je	.L351
.L349:
	cmpl	$0, -10372(%ebp)
	jne	.L355
	jmp	.L342
.L355:
	subl	$12, %esp
	leal	-10304(%ebx), %eax
	pushl	%eax
	leal	-10240(%ebx), %eax
	pushl	%eax
	leal	-5056(%ebx), %eax
	pushl	%eax
	pushl	$.LC114
	leal	-10112(%ebx), %eax
	pushl	%eax
	call	__isoc99_sscanf
	addl	$32, %esp
	cmpl	$3, %eax
	je	.L356
	leal	-10304(%ebx), %eax
	pushl	%eax
	leal	-5056(%ebx), %eax
	pushl	%eax
	pushl	$.LC115
	leal	-10112(%ebx), %eax
	pushl	%eax
	call	__isoc99_sscanf
	addl	$16, %esp
	cmpl	$2, %eax
	jne	.L357
	movl	$0, -10240(%ebx)
	jmp	.L356
.L357:
	leal	-10112(%ebx), %eax
	pushl	%eax
	pushl	-10380(%ebp)
	pushl	$.LC116
	pushl	$2
	call	syslog
	addl	$16, %esp
	movl	argv0, %edi
	movl	$stderr, %eax
	movl	%eax, %ecx
	movl	%ecx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %edx
	testb	%dl, %dl
	setne	%al
	movl	%eax, %esi
	movl	%ecx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	setge	%al
	andl	%esi, %eax
	testb	%al, %al
	je	.L358
	subl	$12, %esp
	pushl	%ecx
	call	__asan_report_load4
.L358:
	movl	stderr, %eax
	subl	$12, %esp
	leal	-10112(%ebx), %edx
	pushl	%edx
	pushl	-10380(%ebp)
	pushl	%edi
	pushl	$.LC117
	pushl	%eax
	call	fprintf
	addl	$32, %esp
	jmp	.L342
.L356:
	movzbl	-5056(%ebx), %eax
	cmpb	$47, %al
	jne	.L359
	subl	$8, %esp
	leal	-5056(%ebx), %eax
	addl	$1, %eax
	pushl	%eax
	leal	-5056(%ebx), %eax
	pushl	%eax
	call	strcpy
	addl	$16, %esp
.L359:
	jmp	.L360
.L361:
	movl	-10364(%ebp), %eax
	leal	2(%eax), %edx
	movl	-10364(%ebp), %eax
	addl	$1, %eax
	subl	$8, %esp
	pushl	%edx
	pushl	%eax
	call	strcpy
	addl	$16, %esp
.L360:
	subl	$8, %esp
	pushl	$.LC118
	leal	-5056(%ebx), %eax
	pushl	%eax
	call	strstr
	addl	$16, %esp
	movl	%eax, -10364(%ebp)
	cmpl	$0, -10364(%ebp)
	jne	.L361
	movl	numthrottles, %edx
	movl	maxthrottles, %eax
	cmpl	%eax, %edx
	jl	.L362
	movl	maxthrottles, %eax
	testl	%eax, %eax
	jne	.L363
	movl	$100, maxthrottles
	movl	maxthrottles, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	subl	$12, %esp
	pushl	%eax
	call	malloc
	addl	$16, %esp
	movl	%eax, throttles
	jmp	.L364
.L363:
	movl	maxthrottles, %eax
	addl	%eax, %eax
	movl	%eax, maxthrottles
	movl	maxthrottles, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	movl	%eax, %edx
	movl	throttles, %eax
	subl	$8, %esp
	pushl	%edx
	pushl	%eax
	call	realloc
	addl	$16, %esp
	movl	%eax, throttles
.L364:
	movl	throttles, %eax
	testl	%eax, %eax
	jne	.L362
	subl	$8, %esp
	pushl	$.LC119
	pushl	$2
	call	syslog
	addl	$16, %esp
	movl	argv0, %ecx
	movl	$stderr, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L365
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L365:
	movl	stderr, %eax
	subl	$4, %esp
	pushl	%ecx
	pushl	$.LC120
	pushl	%eax
	call	fprintf
	addl	$16, %esp
	call	__asan_handle_no_return
	subl	$12, %esp
	pushl	$1
	call	exit
.L362:
	movl	throttles, %ecx
	movl	numthrottles, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ecx,%eax), %edi
	subl	$12, %esp
	leal	-5056(%ebx), %eax
	pushl	%eax
	call	e_strdup
	addl	$16, %esp
	movl	%eax, -10396(%ebp)
	movl	%edi, %eax
	movl	%eax, %ecx
	movl	%ecx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %edx
	testb	%dl, %dl
	setne	%al
	movl	%eax, %esi
	movl	%ecx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	setge	%al
	andl	%esi, %eax
	testb	%al, %al
	je	.L366
	subl	$12, %esp
	pushl	%ecx
	call	__asan_report_store4
.L366:
	movl	-10396(%ebp), %eax
	movl	%eax, (%edi)
	movl	throttles, %ecx
	movl	numthrottles, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ecx,%eax), %edi
	movl	-10304(%ebx), %eax
	movl	%eax, -10396(%ebp)
	leal	4(%edi), %eax
	movl	%eax, %ecx
	movl	%ecx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %edx
	testb	%dl, %dl
	setne	%al
	movl	%eax, %esi
	movl	%ecx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	setge	%al
	andl	%esi, %eax
	testb	%al, %al
	je	.L367
	subl	$12, %esp
	pushl	%ecx
	call	__asan_report_store4
.L367:
	movl	-10396(%ebp), %eax
	movl	%eax, 4(%edi)
	movl	throttles, %ecx
	movl	numthrottles, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ecx,%eax), %edi
	movl	-10240(%ebx), %eax
	movl	%eax, -10396(%ebp)
	leal	8(%edi), %eax
	movl	%eax, %ecx
	movl	%ecx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %edx
	testb	%dl, %dl
	setne	%al
	movl	%eax, %esi
	movl	%ecx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	setge	%al
	andl	%esi, %eax
	testb	%al, %al
	je	.L368
	subl	$12, %esp
	pushl	%ecx
	call	__asan_report_store4
.L368:
	movl	-10396(%ebp), %eax
	movl	%eax, 8(%edi)
	movl	throttles, %ecx
	movl	numthrottles, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ecx,%eax), %edi
	leal	12(%edi), %eax
	movl	%eax, %ecx
	movl	%ecx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %edx
	testb	%dl, %dl
	setne	%al
	movl	%eax, %esi
	movl	%ecx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	setge	%al
	andl	%esi, %eax
	testb	%al, %al
	je	.L369
	subl	$12, %esp
	pushl	%ecx
	call	__asan_report_store4
.L369:
	movl	$0, 12(%edi)
	movl	throttles, %ecx
	movl	numthrottles, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ecx,%eax), %edi
	leal	16(%edi), %eax
	movl	%eax, %ecx
	movl	%ecx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %edx
	testb	%dl, %dl
	setne	%al
	movl	%eax, %esi
	movl	%ecx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	setge	%al
	andl	%esi, %eax
	testb	%al, %al
	je	.L370
	subl	$12, %esp
	pushl	%ecx
	call	__asan_report_store4
.L370:
	movl	$0, 16(%edi)
	movl	throttles, %ecx
	movl	numthrottles, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ecx,%eax), %edi
	leal	20(%edi), %eax
	movl	%eax, %ecx
	movl	%ecx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %edx
	testb	%dl, %dl
	setne	%al
	movl	%eax, %esi
	movl	%ecx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	setge	%al
	andl	%esi, %eax
	testb	%al, %al
	je	.L371
	subl	$12, %esp
	pushl	%ecx
	call	__asan_report_store4
.L371:
	movl	$0, 20(%edi)
	movl	numthrottles, %eax
	addl	$1, %eax
	movl	%eax, numthrottles
.L342:
	subl	$4, %esp
	pushl	-10368(%ebp)
	pushl	$5000
	leal	-10112(%ebx), %eax
	pushl	%eax
	call	fgets
	addl	$16, %esp
	testl	%eax, %eax
	jne	.L372
	subl	$12, %esp
	pushl	-10368(%ebp)
	call	fclose
	addl	$16, %esp
	movl	-10384(%ebp), %esi
	cmpl	%esi, -10388(%ebp)
	je	.L336
	movl	-10384(%ebp), %eax
	movl	$1172321806, (%eax)
	subl	$4, %esp
	pushl	-10388(%ebp)
	pushl	$10332
	pushl	%eax
	call	__asan_stack_free_8
	addl	$16, %esp
	jmp	.L337
.L336:
	movl	-10392(%ebp), %eax
	addl	$536870912, %eax
	movl	$28, %ecx
	movl	$0, %ebx
	movl	%ebx, (%eax)
	movl	%ebx, -4(%eax,%ecx)
	leal	4(%eax), %edx
	andl	$-4, %edx
	subl	%edx, %eax
	addl	%eax, %ecx
	andl	$-4, %ecx
	andl	$-4, %ecx
	movl	$0, %eax
.L338:
	movl	%ebx, (%edx,%eax)
	addl	$4, %eax
	cmpl	%ecx, %eax
	jb	.L338
	addl	%eax, %edx
	movl	-10392(%ebp), %eax
	movl	$0, 536871564(%eax)
	movl	$0, 536871568(%eax)
	movl	$0, 536872196(%eax)
.L337:
	movl	-28(%ebp), %eax
	xorl	%gs:20, %eax
	je	.L373
	call	__stack_chk_fail
.L373:
	leal	-12(%ebp), %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE15:
	.size	read_throttlefile, .-read_throttlefile
	.section	.rodata
.LC121:
	.string	"1 32 8 2 tv "
	.text
	.type	shut_down, @function
shut_down:
.LASANPC16:
.LFB16:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$140, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	leal	-120(%ebp), %esi
	movl	%esi, -148(%ebp)
	cmpl	$0, __asan_option_detect_stack_use_after_return
	je	.L374
	subl	$8, %esp
	pushl	%esi
	pushl	$96
	call	__asan_stack_malloc_1
	addl	$16, %esp
	movl	%eax, %esi
.L374:
	leal	96(%esi), %eax
	movl	%eax, %edi
	movl	%edi, -144(%ebp)
	movl	$1102416563, (%esi)
	movl	$.LC121, 4(%esi)
	movl	$.LASANPC16, 8(%esi)
	movl	%esi, %ebx
	shrl	$3, %ebx
	movl	%ebx, -140(%ebp)
	movl	$-235802127, 536870912(%ebx)
	movl	$-185273344, 536870916(%ebx)
	movl	$-202116109, 536870920(%ebx)
	subl	$8, %esp
	pushl	$0
	movl	%edi, %eax
	subl	$64, %eax
	pushl	%eax
	call	gettimeofday
	addl	$16, %esp
	subl	$12, %esp
	movl	%edi, %eax
	subl	$64, %eax
	pushl	%eax
	call	logstats
	addl	$16, %esp
	movl	$0, -128(%ebp)
	jmp	.L378
.L387:
	movl	connects, %ecx
	movl	-128(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$5, %eax
	leal	(%ecx,%eax), %edi
	movl	%edi, %eax
	movl	%eax, %ecx
	movl	%ecx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ecx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L379
	subl	$12, %esp
	pushl	%ecx
	call	__asan_report_load4
.L379:
	movl	(%edi), %eax
	testl	%eax, %eax
	je	.L380
	movl	connects, %ecx
	movl	-128(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$5, %eax
	leal	(%ecx,%eax), %edi
	leal	8(%edi), %eax
	movl	%eax, %ecx
	movl	%ecx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ecx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L381
	subl	$12, %esp
	pushl	%ecx
	call	__asan_report_load4
.L381:
	movl	8(%edi), %eax
	subl	$8, %esp
	movl	-144(%ebp), %edi
	leal	-64(%edi), %edx
	pushl	%edx
	pushl	%eax
	call	httpd_close_conn
	addl	$16, %esp
.L380:
	movl	connects, %ecx
	movl	-128(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$5, %eax
	leal	(%ecx,%eax), %edi
	leal	8(%edi), %eax
	movl	%eax, %ecx
	movl	%ecx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ecx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L382
	subl	$12, %esp
	pushl	%ecx
	call	__asan_report_load4
.L382:
	movl	8(%edi), %eax
	testl	%eax, %eax
	je	.L383
	movl	connects, %ecx
	movl	-128(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$5, %eax
	leal	(%ecx,%eax), %edi
	leal	8(%edi), %eax
	movl	%eax, %ecx
	movl	%ecx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ecx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L384
	subl	$12, %esp
	pushl	%ecx
	call	__asan_report_load4
.L384:
	movl	8(%edi), %eax
	subl	$12, %esp
	pushl	%eax
	call	httpd_destroy_conn
	addl	$16, %esp
	movl	connects, %ecx
	movl	-128(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$5, %eax
	leal	(%ecx,%eax), %edi
	leal	8(%edi), %eax
	movl	%eax, %ecx
	movl	%ecx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ecx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L385
	subl	$12, %esp
	pushl	%ecx
	call	__asan_report_load4
.L385:
	movl	8(%edi), %eax
	subl	$12, %esp
	pushl	%eax
	call	free
	addl	$16, %esp
	movl	httpd_conn_count, %eax
	subl	$1, %eax
	movl	%eax, httpd_conn_count
	movl	connects, %ecx
	movl	-128(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$5, %eax
	leal	(%ecx,%eax), %edi
	leal	8(%edi), %eax
	movl	%eax, %ecx
	movl	%ecx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ecx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L386
	subl	$12, %esp
	pushl	%ecx
	call	__asan_report_store4
.L386:
	movl	$0, 8(%edi)
.L383:
	addl	$1, -128(%ebp)
.L378:
	movl	max_connects, %eax
	cmpl	%eax, -128(%ebp)
	jl	.L387
	movl	hs, %eax
	testl	%eax, %eax
	je	.L388
	movl	hs, %eax
	movl	%eax, -124(%ebp)
	movl	$0, hs
	movl	-124(%ebp), %eax
	addl	$40, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L389
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_load4
.L389:
	movl	-124(%ebp), %eax
	movl	40(%eax), %eax
	cmpl	$-1, %eax
	je	.L390
	movl	-124(%ebp), %eax
	movl	40(%eax), %eax
	subl	$12, %esp
	pushl	%eax
	call	fdwatch_del_fd
	addl	$16, %esp
.L390:
	movl	-124(%ebp), %eax
	addl	$44, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L391
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_load4
.L391:
	movl	-124(%ebp), %eax
	movl	44(%eax), %eax
	cmpl	$-1, %eax
	je	.L392
	movl	-124(%ebp), %eax
	movl	44(%eax), %eax
	subl	$12, %esp
	pushl	%eax
	call	fdwatch_del_fd
	addl	$16, %esp
.L392:
	subl	$12, %esp
	pushl	-124(%ebp)
	call	httpd_terminate
	addl	$16, %esp
.L388:
	call	mmc_destroy
	call	tmr_destroy
	movl	connects, %eax
	subl	$12, %esp
	pushl	%eax
	call	free
	addl	$16, %esp
	movl	throttles, %eax
	testl	%eax, %eax
	je	.L377
	movl	throttles, %eax
	subl	$12, %esp
	pushl	%eax
	call	free
	addl	$16, %esp
.L377:
	cmpl	%esi, -148(%ebp)
	je	.L375
	movl	$1172321806, (%esi)
	movl	-140(%ebp), %eax
	movl	$-168430091, 536870912(%eax)
	movl	$-168430091, 536870916(%eax)
	movl	$-168430091, 536870920(%eax)
	jmp	.L376
.L375:
	movl	-140(%ebp), %eax
	movl	$0, 536870912(%eax)
	movl	$0, 536870916(%eax)
	movl	$0, 536870920(%eax)
.L376:
	leal	-12(%ebp), %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE16:
	.size	shut_down, .-shut_down
	.section	.rodata
.LC122:
	.string	"1 32 4 11 client_data "
	.align 32
.LC123:
	.string	"too many connections!"
	.zero	42
	.align 32
.LC124:
	.string	"the connects free list is messed up"
	.zero	60
	.align 32
.LC125:
	.string	"out of memory allocating an httpd_conn"
	.zero	57
	.text
	.type	handle_newconnect, @function
handle_newconnect:
.LASANPC17:
.LFB17:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$140, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	leal	-120(%ebp), %edi
	movl	%edi, -148(%ebp)
	cmpl	$0, __asan_option_detect_stack_use_after_return
	je	.L394
	subl	$8, %esp
	pushl	%edi
	pushl	$96
	call	__asan_stack_malloc_1
	addl	$16, %esp
	movl	%eax, %edi
.L394:
	leal	96(%edi), %eax
	movl	%eax, -144(%ebp)
	movl	$1102416563, (%edi)
	movl	$.LC122, 4(%edi)
	movl	$.LASANPC17, 8(%edi)
	movl	%edi, %eax
	shrl	$3, %eax
	movl	%eax, -140(%ebp)
	movl	$-235802127, 536870912(%eax)
	movl	$-185273340, 536870916(%eax)
	movl	$-202116109, 536870920(%eax)
.L425:
	movl	num_connects, %edx
	movl	max_connects, %eax
	cmpl	%eax, %edx
	jl	.L398
	subl	$8, %esp
	pushl	$.LC123
	pushl	$4
	call	syslog
	addl	$16, %esp
	subl	$12, %esp
	pushl	8(%ebp)
	call	tmr_run
	addl	$16, %esp
	movl	$0, %eax
	jmp	.L426
.L398:
	movl	first_free_connect, %eax
	cmpl	$-1, %eax
	je	.L400
	movl	connects, %ecx
	movl	first_free_connect, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$5, %eax
	leal	(%ecx,%eax), %esi
	movl	%esi, %eax
	movl	%eax, %ecx
	movl	%ecx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ecx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L401
	subl	$12, %esp
	pushl	%ecx
	call	__asan_report_load4
.L401:
	movl	(%esi), %eax
	testl	%eax, %eax
	je	.L402
.L400:
	subl	$8, %esp
	pushl	$.LC124
	pushl	$2
	call	syslog
	addl	$16, %esp
	call	__asan_handle_no_return
	subl	$12, %esp
	pushl	$1
	call	exit
.L402:
	movl	connects, %ecx
	movl	first_free_connect, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$5, %eax
	addl	%ecx, %eax
	movl	%eax, -124(%ebp)
	movl	-124(%ebp), %eax
	addl	$8, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L403
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_load4
.L403:
	movl	-124(%ebp), %eax
	movl	8(%eax), %eax
	testl	%eax, %eax
	jne	.L404
	subl	$12, %esp
	pushl	$456
	call	malloc
	addl	$16, %esp
	movl	%eax, %edx
	movl	-124(%ebp), %eax
	movl	%edx, 8(%eax)
	movl	-124(%ebp), %eax
	movl	8(%eax), %eax
	testl	%eax, %eax
	jne	.L405
	subl	$8, %esp
	pushl	$.LC125
	pushl	$2
	call	syslog
	addl	$16, %esp
	call	__asan_handle_no_return
	subl	$12, %esp
	pushl	$1
	call	exit
.L405:
	movl	-124(%ebp), %eax
	addl	$8, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L406
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_load4
.L406:
	movl	-124(%ebp), %eax
	movl	8(%eax), %esi
	movl	%esi, %eax
	movl	%eax, %ecx
	movl	%ecx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ecx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L407
	subl	$12, %esp
	pushl	%ecx
	call	__asan_report_store4
.L407:
	movl	$0, (%esi)
	movl	httpd_conn_count, %eax
	addl	$1, %eax
	movl	%eax, httpd_conn_count
.L404:
	movl	-124(%ebp), %eax
	addl	$8, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L408
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_load4
.L408:
	movl	-124(%ebp), %eax
	movl	8(%eax), %edx
	movl	hs, %eax
	subl	$4, %esp
	pushl	%edx
	pushl	12(%ebp)
	pushl	%eax
	call	httpd_get_conn
	addl	$16, %esp
	testl	%eax, %eax
	je	.L410
	cmpl	$2, %eax
	je	.L411
	jmp	.L427
.L410:
	subl	$12, %esp
	pushl	8(%ebp)
	call	tmr_run
	addl	$16, %esp
	movl	$0, %eax
	jmp	.L426
.L411:
	movl	$1, %eax
	jmp	.L426
.L427:
	movl	-124(%ebp), %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L412
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_store4
.L412:
	movl	-124(%ebp), %eax
	movl	$1, (%eax)
	movl	-124(%ebp), %eax
	addl	$4, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L413
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_load4
.L413:
	movl	-124(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, first_free_connect
	movl	-124(%ebp), %eax
	movl	$-1, 4(%eax)
	movl	num_connects, %eax
	addl	$1, %eax
	movl	%eax, num_connects
	movl	-124(%ebp), %eax
	movl	-144(%ebp), %esi
	movl	%eax, -64(%esi)
	movl	8(%ebp), %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L414
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_load4
.L414:
	movl	8(%ebp), %eax
	movl	(%eax), %esi
	movl	-124(%ebp), %eax
	addl	$68, %eax
	movl	%eax, %ecx
	movl	%ecx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ecx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L415
	subl	$12, %esp
	pushl	%ecx
	call	__asan_report_store4
.L415:
	movl	-124(%ebp), %eax
	movl	%esi, 68(%eax)
	movl	-124(%ebp), %eax
	addl	$72, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L416
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_store4
.L416:
	movl	-124(%ebp), %eax
	movl	$0, 72(%eax)
	movl	-124(%ebp), %eax
	addl	$76, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L417
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_store4
.L417:
	movl	-124(%ebp), %eax
	movl	$0, 76(%eax)
	movl	-124(%ebp), %eax
	addl	$92, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L418
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_store4
.L418:
	movl	-124(%ebp), %eax
	movl	$0, 92(%eax)
	movl	-124(%ebp), %eax
	addl	$52, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L419
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_store4
.L419:
	movl	-124(%ebp), %eax
	movl	$0, 52(%eax)
	movl	-124(%ebp), %eax
	addl	$8, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L420
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_load4
.L420:
	movl	-124(%ebp), %eax
	movl	8(%eax), %ebx
	leal	448(%ebx), %eax
	movl	%eax, %ecx
	movl	%ecx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %edx
	testb	%dl, %dl
	setne	%al
	movl	%eax, %esi
	movl	%ecx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	setge	%al
	andl	%esi, %eax
	testb	%al, %al
	je	.L421
	subl	$12, %esp
	pushl	%ecx
	call	__asan_report_load4
.L421:
	movl	448(%ebx), %eax
	subl	$12, %esp
	pushl	%eax
	call	httpd_set_ndelay
	addl	$16, %esp
	movl	-124(%ebp), %eax
	addl	$8, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L422
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_load4
.L422:
	movl	-124(%ebp), %eax
	movl	8(%eax), %ebx
	leal	448(%ebx), %eax
	movl	%eax, %ecx
	movl	%ecx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %edx
	testb	%dl, %dl
	setne	%al
	movl	%eax, %esi
	movl	%ecx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	setge	%al
	andl	%esi, %eax
	testb	%al, %al
	je	.L423
	subl	$12, %esp
	pushl	%ecx
	call	__asan_report_load4
.L423:
	movl	448(%ebx), %eax
	subl	$4, %esp
	pushl	$0
	pushl	-124(%ebp)
	pushl	%eax
	call	fdwatch_add_fd
	addl	$16, %esp
	movl	stats_connections, %eax
	addl	$1, %eax
	movl	%eax, stats_connections
	movl	num_connects, %edx
	movl	stats_simultaneous, %eax
	cmpl	%eax, %edx
	jle	.L424
	movl	num_connects, %eax
	movl	%eax, stats_simultaneous
.L424:
	jmp	.L425
.L426:
	cmpl	%edi, -148(%ebp)
	je	.L395
	movl	$1172321806, (%edi)
	movl	-140(%ebp), %edi
	movl	$-168430091, 536870912(%edi)
	movl	$-168430091, 536870916(%edi)
	movl	$-168430091, 536870920(%edi)
	jmp	.L396
.L395:
	movl	-140(%ebp), %esi
	movl	$0, 536870912(%esi)
	movl	$0, 536870916(%esi)
	movl	$0, 536870920(%esi)
.L396:
	leal	-12(%ebp), %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE17:
	.size	handle_newconnect, .-handle_newconnect
	.type	handle_read, @function
handle_read:
.LASANPC18:
.LFB18:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$140, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	leal	-120(%ebp), %eax
	movl	%eax, -140(%ebp)
	movl	%eax, -152(%ebp)
	cmpl	$0, __asan_option_detect_stack_use_after_return
	je	.L428
	subl	$8, %esp
	pushl	-140(%ebp)
	pushl	$96
	call	__asan_stack_malloc_1
	addl	$16, %esp
	movl	%eax, -140(%ebp)
.L428:
	movl	-140(%ebp), %edi
	movl	%edi, %eax
	addl	$96, %eax
	movl	%eax, -148(%ebp)
	movl	%edi, %eax
	movl	$1102416563, (%eax)
	movl	%edi, %eax
	movl	$.LC122, 4(%eax)
	movl	$.LASANPC18, 8(%eax)
	shrl	$3, %eax
	movl	%eax, -144(%ebp)
	movl	$-235802127, 536870912(%eax)
	movl	$-185273340, 536870916(%eax)
	movl	$-202116109, 536870920(%eax)
	movl	8(%ebp), %eax
	addl	$8, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L432
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_load4
.L432:
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, -128(%ebp)
	movl	-128(%ebp), %eax
	addl	$144, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L433
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_load4
.L433:
	movl	-128(%ebp), %eax
	movl	144(%eax), %esi
	movl	-128(%ebp), %eax
	addl	$140, %eax
	movl	%eax, %ecx
	movl	%ecx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ecx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L434
	subl	$12, %esp
	pushl	%ecx
	call	__asan_report_load4
.L434:
	movl	-128(%ebp), %eax
	movl	140(%eax), %eax
	cmpl	%eax, %esi
	jb	.L435
	movl	-128(%ebp), %eax
	movl	140(%eax), %eax
	cmpl	$5000, %eax
	jbe	.L436
	movl	$httpd_err400form, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L437
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_load4
.L437:
	movl	httpd_err400form, %ebx
	movl	$httpd_err400title, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%al
	movl	%eax, %esi
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%esi, %eax
	testb	%al, %al
	je	.L438
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_load4
.L438:
	movl	httpd_err400title, %eax
	subl	$8, %esp
	pushl	$.LC48
	pushl	%ebx
	pushl	$.LC48
	pushl	%eax
	pushl	$400
	pushl	-128(%ebp)
	call	httpd_send_err
	addl	$32, %esp
	subl	$8, %esp
	pushl	12(%ebp)
	pushl	8(%ebp)
	call	finish_connection
	addl	$16, %esp
	jmp	.L431
.L436:
	movl	-128(%ebp), %eax
	addl	$140, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L440
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_load4
.L440:
	movl	-128(%ebp), %eax
	movl	140(%eax), %eax
	leal	1000(%eax), %ecx
	movl	-128(%ebp), %eax
	leal	140(%eax), %edx
	movl	-128(%ebp), %eax
	addl	$136, %eax
	subl	$4, %esp
	pushl	%ecx
	pushl	%edx
	pushl	%eax
	call	httpd_realloc_str
	addl	$16, %esp
.L435:
	movl	-128(%ebp), %eax
	addl	$140, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L441
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_load4
.L441:
	movl	-128(%ebp), %eax
	movl	140(%eax), %edi
	movl	-128(%ebp), %eax
	addl	$136, %eax
	movl	%eax, %ecx
	movl	%ecx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ecx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L442
	subl	$12, %esp
	pushl	%ecx
	call	__asan_report_load4
.L442:
	movl	-128(%ebp), %eax
	movl	136(%eax), %esi
	movl	-128(%ebp), %eax
	addl	$144, %eax
	movl	%eax, %ecx
	movl	%ecx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ecx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L443
	subl	$12, %esp
	pushl	%ecx
	call	__asan_report_load4
.L443:
	movl	-128(%ebp), %eax
	movl	144(%eax), %eax
	addl	%eax, %esi
	movl	-128(%ebp), %eax
	addl	$448, %eax
	movl	%eax, %ecx
	movl	%ecx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ecx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L444
	subl	$12, %esp
	pushl	%ecx
	call	__asan_report_load4
.L444:
	movl	-128(%ebp), %eax
	movl	448(%eax), %eax
	subl	$4, %esp
	pushl	%edi
	pushl	%esi
	pushl	%eax
	call	read
	addl	$16, %esp
	movl	%eax, -124(%ebp)
	cmpl	$0, -124(%ebp)
	jne	.L445
	movl	$httpd_err400form, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L446
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_load4
.L446:
	movl	httpd_err400form, %ebx
	movl	$httpd_err400title, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%al
	movl	%eax, %esi
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%esi, %eax
	testb	%al, %al
	je	.L447
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_load4
.L447:
	movl	httpd_err400title, %eax
	subl	$8, %esp
	pushl	$.LC48
	pushl	%ebx
	pushl	$.LC48
	pushl	%eax
	pushl	$400
	pushl	-128(%ebp)
	call	httpd_send_err
	addl	$32, %esp
	subl	$8, %esp
	pushl	12(%ebp)
	pushl	8(%ebp)
	call	finish_connection
	addl	$16, %esp
	jmp	.L431
.L445:
	cmpl	$0, -124(%ebp)
	jns	.L448
	call	__errno_location
	movl	%eax, %ebx
	movl	%ebx, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%al
	movl	%eax, %esi
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%esi, %eax
	testb	%al, %al
	je	.L449
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_load4
.L449:
	movl	(%ebx), %eax
	cmpl	$4, %eax
	je	.L450
	call	__errno_location
	movl	%eax, %ebx
	movl	%ebx, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%al
	movl	%eax, %esi
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%esi, %eax
	testb	%al, %al
	je	.L451
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_load4
.L451:
	movl	(%ebx), %eax
	cmpl	$11, %eax
	je	.L450
	call	__errno_location
	movl	%eax, %ebx
	movl	%ebx, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%al
	movl	%eax, %esi
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%esi, %eax
	testb	%al, %al
	je	.L452
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_load4
.L452:
	movl	(%ebx), %eax
	cmpl	$11, %eax
	jne	.L453
.L450:
	jmp	.L431
.L453:
	movl	$httpd_err400form, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L454
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_load4
.L454:
	movl	httpd_err400form, %ebx
	movl	$httpd_err400title, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%al
	movl	%eax, %esi
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%esi, %eax
	testb	%al, %al
	je	.L455
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_load4
.L455:
	movl	httpd_err400title, %eax
	subl	$8, %esp
	pushl	$.LC48
	pushl	%ebx
	pushl	$.LC48
	pushl	%eax
	pushl	$400
	pushl	-128(%ebp)
	call	httpd_send_err
	addl	$32, %esp
	subl	$8, %esp
	pushl	12(%ebp)
	pushl	8(%ebp)
	call	finish_connection
	addl	$16, %esp
	jmp	.L431
.L448:
	movl	-128(%ebp), %eax
	addl	$144, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L456
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_load4
.L456:
	movl	-128(%ebp), %eax
	movl	144(%eax), %edx
	movl	-124(%ebp), %eax
	addl	%eax, %edx
	movl	-128(%ebp), %eax
	movl	%edx, 144(%eax)
	movl	12(%ebp), %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L457
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_load4
.L457:
	movl	12(%ebp), %eax
	movl	(%eax), %esi
	movl	8(%ebp), %eax
	addl	$68, %eax
	movl	%eax, %ecx
	movl	%ecx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ecx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L458
	subl	$12, %esp
	pushl	%ecx
	call	__asan_report_store4
.L458:
	movl	8(%ebp), %eax
	movl	%esi, 68(%eax)
	subl	$12, %esp
	pushl	-128(%ebp)
	call	httpd_got_request
	addl	$16, %esp
	testl	%eax, %eax
	je	.L504
	cmpl	$2, %eax
	jne	.L503
	movl	$httpd_err400form, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L462
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_load4
.L462:
	movl	httpd_err400form, %ebx
	movl	$httpd_err400title, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%al
	movl	%eax, %esi
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%esi, %eax
	testb	%al, %al
	je	.L463
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_load4
.L463:
	movl	httpd_err400title, %eax
	subl	$8, %esp
	pushl	$.LC48
	pushl	%ebx
	pushl	$.LC48
	pushl	%eax
	pushl	$400
	pushl	-128(%ebp)
	call	httpd_send_err
	addl	$32, %esp
	subl	$8, %esp
	pushl	12(%ebp)
	pushl	8(%ebp)
	call	finish_connection
	addl	$16, %esp
	jmp	.L431
.L503:
	subl	$12, %esp
	pushl	-128(%ebp)
	call	httpd_parse_request
	addl	$16, %esp
	testl	%eax, %eax
	jns	.L464
	subl	$8, %esp
	pushl	12(%ebp)
	pushl	8(%ebp)
	call	finish_connection
	addl	$16, %esp
	jmp	.L431
.L464:
	subl	$12, %esp
	pushl	8(%ebp)
	call	check_throttles
	addl	$16, %esp
	testl	%eax, %eax
	jne	.L465
	movl	-128(%ebp), %eax
	addl	$172, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L466
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_load4
.L466:
	movl	-128(%ebp), %eax
	movl	172(%eax), %edi
	movl	$httpd_err503form, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L467
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_load4
.L467:
	movl	httpd_err503form, %esi
	movl	$httpd_err503title, %eax
	movl	%eax, %ecx
	movl	%ecx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ecx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L468
	subl	$12, %esp
	pushl	%ecx
	call	__asan_report_load4
.L468:
	movl	httpd_err503title, %eax
	subl	$8, %esp
	pushl	%edi
	pushl	%esi
	pushl	$.LC48
	pushl	%eax
	pushl	$503
	pushl	-128(%ebp)
	call	httpd_send_err
	addl	$32, %esp
	subl	$8, %esp
	pushl	12(%ebp)
	pushl	8(%ebp)
	call	finish_connection
	addl	$16, %esp
	jmp	.L431
.L465:
	subl	$8, %esp
	pushl	12(%ebp)
	pushl	-128(%ebp)
	call	httpd_start_request
	addl	$16, %esp
	testl	%eax, %eax
	jns	.L469
	subl	$8, %esp
	pushl	12(%ebp)
	pushl	8(%ebp)
	call	finish_connection
	addl	$16, %esp
	jmp	.L431
.L469:
	movl	-128(%ebp), %eax
	addl	$336, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L470
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_load4
.L470:
	movl	-128(%ebp), %eax
	movl	336(%eax), %eax
	testl	%eax, %eax
	je	.L471
	movl	-128(%ebp), %eax
	addl	$344, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L472
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_load4
.L472:
	movl	-128(%ebp), %eax
	movl	344(%eax), %esi
	movl	8(%ebp), %eax
	addl	$92, %eax
	movl	%eax, %ecx
	movl	%ecx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ecx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L473
	subl	$12, %esp
	pushl	%ecx
	call	__asan_report_store4
.L473:
	movl	8(%ebp), %eax
	movl	%esi, 92(%eax)
	movl	-128(%ebp), %eax
	addl	$348, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L474
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_load4
.L474:
	movl	-128(%ebp), %eax
	movl	348(%eax), %eax
	leal	1(%eax), %esi
	movl	8(%ebp), %eax
	addl	$88, %eax
	movl	%eax, %ecx
	movl	%ecx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ecx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L475
	subl	$12, %esp
	pushl	%ecx
	call	__asan_report_store4
.L475:
	movl	8(%ebp), %eax
	movl	%esi, 88(%eax)
	jmp	.L476
.L471:
	movl	-128(%ebp), %eax
	addl	$164, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L477
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_load4
.L477:
	movl	-128(%ebp), %eax
	movl	164(%eax), %eax
	testl	%eax, %eax
	jns	.L478
	movl	8(%ebp), %eax
	addl	$88, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L479
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_store4
.L479:
	movl	8(%ebp), %eax
	movl	$0, 88(%eax)
	jmp	.L476
.L478:
	movl	-128(%ebp), %eax
	addl	$164, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L480
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_load4
.L480:
	movl	-128(%ebp), %eax
	movl	164(%eax), %esi
	movl	8(%ebp), %eax
	addl	$88, %eax
	movl	%eax, %ecx
	movl	%ecx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ecx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L481
	subl	$12, %esp
	pushl	%ecx
	call	__asan_report_store4
.L481:
	movl	8(%ebp), %eax
	movl	%esi, 88(%eax)
.L476:
	movl	-128(%ebp), %eax
	addl	$452, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L482
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_load4
.L482:
	movl	-128(%ebp), %eax
	movl	452(%eax), %eax
	testl	%eax, %eax
	jne	.L483
	movl	$0, -132(%ebp)
	jmp	.L484
.L490:
	movl	throttles, %ebx
	movl	-132(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	addl	$12, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%al
	movl	%eax, %esi
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%esi, %eax
	testb	%al, %al
	je	.L485
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_load4
.L485:
	movl	8(%ebp), %eax
	movl	-132(%ebp), %edx
	movl	12(%eax,%edx,4), %eax
	movl	%eax, %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ebx,%eax), %edi
	movl	throttles, %ecx
	movl	8(%ebp), %eax
	movl	-132(%ebp), %edx
	movl	12(%eax,%edx,4), %eax
	movl	%eax, %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ecx,%eax), %esi
	leal	16(%esi), %eax
	movl	%eax, %ecx
	movl	%ecx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ecx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L486
	subl	$12, %esp
	pushl	%ecx
	call	__asan_report_load4
.L486:
	movl	16(%esi), %esi
	movl	-128(%ebp), %eax
	addl	$168, %eax
	movl	%eax, %ecx
	movl	%ecx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ecx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L487
	subl	$12, %esp
	pushl	%ecx
	call	__asan_report_load4
.L487:
	movl	-128(%ebp), %eax
	movl	168(%eax), %eax
	addl	%eax, %esi
	leal	16(%edi), %eax
	movl	%eax, %ecx
	movl	%ecx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ecx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L488
	subl	$12, %esp
	pushl	%ecx
	call	__asan_report_store4
.L488:
	movl	%esi, 16(%edi)
	addl	$1, -132(%ebp)
.L484:
	movl	8(%ebp), %eax
	addl	$52, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L489
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_load4
.L489:
	movl	8(%ebp), %eax
	movl	52(%eax), %eax
	cmpl	-132(%ebp), %eax
	jg	.L490
	movl	-128(%ebp), %eax
	addl	$168, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L491
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_load4
.L491:
	movl	-128(%ebp), %eax
	movl	168(%eax), %ebx
	movl	8(%ebp), %eax
	addl	$92, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%al
	movl	%eax, %esi
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%esi, %eax
	testb	%al, %al
	je	.L492
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_store4
.L492:
	movl	8(%ebp), %eax
	movl	%ebx, 92(%eax)
	subl	$8, %esp
	pushl	12(%ebp)
	pushl	8(%ebp)
	call	finish_connection
	addl	$16, %esp
	jmp	.L431
.L483:
	movl	8(%ebp), %eax
	addl	$92, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L493
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_load4
.L493:
	movl	8(%ebp), %eax
	movl	92(%eax), %esi
	movl	8(%ebp), %eax
	addl	$88, %eax
	movl	%eax, %ecx
	movl	%ecx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ecx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L494
	subl	$12, %esp
	pushl	%ecx
	call	__asan_report_load4
.L494:
	movl	8(%ebp), %eax
	movl	88(%eax), %eax
	cmpl	%eax, %esi
	jl	.L495
	subl	$8, %esp
	pushl	12(%ebp)
	pushl	8(%ebp)
	call	finish_connection
	addl	$16, %esp
	jmp	.L431
.L495:
	movl	8(%ebp), %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L496
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_store4
.L496:
	movl	8(%ebp), %eax
	movl	$2, (%eax)
	movl	12(%ebp), %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L497
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_load4
.L497:
	movl	12(%ebp), %eax
	movl	(%eax), %esi
	movl	8(%ebp), %eax
	addl	$64, %eax
	movl	%eax, %ecx
	movl	%ecx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ecx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L498
	subl	$12, %esp
	pushl	%ecx
	call	__asan_report_store4
.L498:
	movl	8(%ebp), %eax
	movl	%esi, 64(%eax)
	movl	8(%ebp), %eax
	addl	$80, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L499
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_store4
.L499:
	movl	8(%ebp), %eax
	movl	$0, 80(%eax)
	movl	8(%ebp), %eax
	movl	-148(%ebp), %edi
	movl	%eax, -64(%edi)
	movl	-128(%ebp), %eax
	addl	$448, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L500
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_load4
.L500:
	movl	-128(%ebp), %eax
	movl	448(%eax), %eax
	subl	$12, %esp
	pushl	%eax
	call	fdwatch_del_fd
	addl	$16, %esp
	movl	-128(%ebp), %eax
	addl	$448, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L501
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_load4
.L501:
	movl	-128(%ebp), %eax
	movl	448(%eax), %eax
	subl	$4, %esp
	pushl	$1
	pushl	8(%ebp)
	pushl	%eax
	call	fdwatch_add_fd
	addl	$16, %esp
	jmp	.L431
.L504:
	nop
.L431:
	movl	-140(%ebp), %edi
	cmpl	%edi, -152(%ebp)
	je	.L429
	movl	-140(%ebp), %eax
	movl	$1172321806, (%eax)
	movl	-144(%ebp), %eax
	movl	$-168430091, 536870912(%eax)
	movl	$-168430091, 536870916(%eax)
	movl	$-168430091, 536870920(%eax)
	jmp	.L430
.L429:
	movl	-144(%ebp), %eax
	movl	$0, 536870912(%eax)
	movl	$0, 536870916(%eax)
	movl	$0, 536870920(%eax)
.L430:
	leal	-12(%ebp), %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE18:
	.size	handle_read, .-handle_read
	.section	.rodata
	.align 4
.LC126:
	.string	"2 32 4 11 client_data 96 16 2 iv "
	.align 32
.LC127:
	.string	"replacing non-null wakeup_timer!"
	.zero	63
	.align 32
.LC128:
	.string	"tmr_create(wakeup_connection) failed"
	.zero	59
	.align 32
.LC129:
	.string	"write - %m sending %.80s"
	.zero	39
	.text
	.type	handle_send, @function
handle_send:
.LASANPC19:
.LFB19:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$236, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	leal	-184(%ebp), %eax
	movl	%eax, -224(%ebp)
	movl	%eax, -244(%ebp)
	cmpl	$0, __asan_option_detect_stack_use_after_return
	je	.L505
	subl	$8, %esp
	pushl	-224(%ebp)
	pushl	$160
	call	__asan_stack_malloc_2
	addl	$16, %esp
	movl	%eax, -224(%ebp)
.L505:
	movl	-224(%ebp), %edi
	movl	%edi, %eax
	addl	$160, %eax
	movl	%eax, -220(%ebp)
	movl	%edi, %eax
	movl	$1102416563, (%eax)
	movl	%edi, %eax
	movl	$.LC126, 4(%eax)
	movl	$.LASANPC19, 8(%eax)
	shrl	$3, %eax
	movl	%eax, -232(%ebp)
	movl	$-235802127, 536870912(%eax)
	movl	$-185273340, 536870916(%eax)
	movl	$-218959118, 536870920(%eax)
	movl	$-185335808, 536870924(%eax)
	movl	$-202116109, 536870928(%eax)
	movl	8(%ebp), %eax
	addl	$8, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L509
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_load4
.L509:
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, -196(%ebp)
	movl	8(%ebp), %eax
	addl	$56, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L510
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_load4
.L510:
	movl	8(%ebp), %eax
	movl	56(%eax), %eax
	cmpl	$-1, %eax
	jne	.L511
	movl	$1000000000, -212(%ebp)
	jmp	.L512
.L511:
	movl	8(%ebp), %eax
	addl	$56, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L513
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_load4
.L513:
	movl	8(%ebp), %eax
	movl	56(%eax), %eax
	leal	3(%eax), %edx
	testl	%eax, %eax
	cmovs	%edx, %eax
	sarl	$2, %eax
	movl	%eax, -212(%ebp)
.L512:
	movl	-196(%ebp), %eax
	addl	$304, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L514
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_load4
.L514:
	movl	-196(%ebp), %eax
	movl	304(%eax), %eax
	testl	%eax, %eax
	jne	.L515
	movl	8(%ebp), %eax
	addl	$88, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L516
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_load4
.L516:
	movl	8(%ebp), %eax
	movl	88(%eax), %esi
	movl	8(%ebp), %eax
	addl	$92, %eax
	movl	%eax, %ecx
	movl	%ecx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ecx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L517
	subl	$12, %esp
	pushl	%ecx
	call	__asan_report_load4
.L517:
	movl	8(%ebp), %eax
	movl	92(%eax), %eax
	subl	%eax, %esi
	movl	%esi, %eax
	movl	%eax, %edx
	movl	-212(%ebp), %eax
	cmpl	%eax, %edx
	cmovbe	%edx, %eax
	movl	%eax, %edi
	movl	-196(%ebp), %eax
	addl	$452, %eax
	movl	%eax, %ecx
	movl	%ecx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ecx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L518
	subl	$12, %esp
	pushl	%ecx
	call	__asan_report_load4
.L518:
	movl	-196(%ebp), %eax
	movl	452(%eax), %edx
	movl	8(%ebp), %eax
	movl	92(%eax), %eax
	leal	(%edx,%eax), %esi
	movl	-196(%ebp), %eax
	addl	$448, %eax
	movl	%eax, %ecx
	movl	%ecx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ecx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L519
	subl	$12, %esp
	pushl	%ecx
	call	__asan_report_load4
.L519:
	movl	-196(%ebp), %eax
	movl	448(%eax), %eax
	subl	$4, %esp
	pushl	%edi
	pushl	%esi
	pushl	%eax
	call	write
	addl	$16, %esp
	movl	%eax, -208(%ebp)
	jmp	.L520
.L515:
	movl	-196(%ebp), %eax
	addl	$252, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L521
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_load4
.L521:
	movl	-196(%ebp), %eax
	movl	252(%eax), %eax
	movl	-220(%ebp), %edi
	movl	%eax, -64(%edi)
	movl	-196(%ebp), %eax
	addl	$304, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L522
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_load4
.L522:
	movl	-196(%ebp), %eax
	movl	304(%eax), %eax
	movl	-220(%ebp), %edi
	movl	%eax, -60(%edi)
	movl	-196(%ebp), %eax
	addl	$452, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L523
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_load4
.L523:
	movl	-196(%ebp), %eax
	movl	452(%eax), %esi
	movl	8(%ebp), %eax
	addl	$92, %eax
	movl	%eax, %ecx
	movl	%ecx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ecx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L524
	subl	$12, %esp
	pushl	%ecx
	call	__asan_report_load4
.L524:
	movl	8(%ebp), %eax
	movl	92(%eax), %eax
	addl	%esi, %eax
	movl	-220(%ebp), %edi
	movl	%eax, -56(%edi)
	movl	8(%ebp), %eax
	addl	$88, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L525
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_load4
.L525:
	movl	8(%ebp), %eax
	movl	88(%eax), %edx
	movl	8(%ebp), %eax
	movl	92(%eax), %eax
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, %edx
	movl	-212(%ebp), %eax
	cmpl	%eax, %edx
	cmovbe	%edx, %eax
	movl	-220(%ebp), %edi
	movl	%eax, -52(%edi)
	movl	-196(%ebp), %eax
	addl	$448, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L526
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_load4
.L526:
	movl	-196(%ebp), %eax
	movl	448(%eax), %eax
	subl	$4, %esp
	pushl	$2
	movl	-220(%ebp), %edi
	leal	-64(%edi), %edx
	pushl	%edx
	pushl	%eax
	call	writev
	addl	$16, %esp
	movl	%eax, -208(%ebp)
.L520:
	cmpl	$0, -208(%ebp)
	jns	.L527
	call	__errno_location
	movl	%eax, %ebx
	movl	%ebx, %ecx
	movl	%ecx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %edx
	testb	%dl, %dl
	setne	%al
	movl	%eax, %esi
	movl	%ecx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	setge	%al
	andl	%esi, %eax
	testb	%al, %al
	je	.L528
	subl	$12, %esp
	pushl	%ecx
	call	__asan_report_load4
.L528:
	movl	(%ebx), %eax
	cmpl	$4, %eax
	jne	.L527
	jmp	.L508
.L527:
	cmpl	$0, -208(%ebp)
	je	.L530
	cmpl	$0, -208(%ebp)
	jns	.L531
	call	__errno_location
	movl	%eax, %ebx
	movl	%ebx, %ecx
	movl	%ecx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %edx
	testb	%dl, %dl
	setne	%al
	movl	%eax, %esi
	movl	%ecx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	setge	%al
	andl	%esi, %eax
	testb	%al, %al
	je	.L532
	subl	$12, %esp
	pushl	%ecx
	call	__asan_report_load4
.L532:
	movl	(%ebx), %eax
	cmpl	$11, %eax
	je	.L530
	call	__errno_location
	movl	%eax, %ebx
	movl	%ebx, %ecx
	movl	%ecx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %edx
	testb	%dl, %dl
	setne	%al
	movl	%eax, %esi
	movl	%ecx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	setge	%al
	andl	%esi, %eax
	testb	%al, %al
	je	.L533
	subl	$12, %esp
	pushl	%ecx
	call	__asan_report_load4
.L533:
	movl	(%ebx), %eax
	cmpl	$11, %eax
	jne	.L531
.L530:
	movl	8(%ebp), %eax
	addl	$80, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L534
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_load4
.L534:
	movl	8(%ebp), %eax
	movl	80(%eax), %eax
	leal	100(%eax), %edx
	movl	8(%ebp), %eax
	movl	%edx, 80(%eax)
	movl	8(%ebp), %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L535
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_store4
.L535:
	movl	8(%ebp), %eax
	movl	$3, (%eax)
	movl	-196(%ebp), %eax
	addl	$448, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L536
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_load4
.L536:
	movl	-196(%ebp), %eax
	movl	448(%eax), %eax
	subl	$12, %esp
	pushl	%eax
	call	fdwatch_del_fd
	addl	$16, %esp
	movl	8(%ebp), %eax
	movl	-220(%ebp), %edi
	movl	%eax, -128(%edi)
	movl	8(%ebp), %eax
	addl	$72, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L537
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_load4
.L537:
	movl	8(%ebp), %eax
	movl	72(%eax), %eax
	testl	%eax, %eax
	je	.L538
	subl	$8, %esp
	pushl	$.LC127
	pushl	$3
	call	syslog
	addl	$16, %esp
.L538:
	movl	8(%ebp), %eax
	addl	$80, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L539
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_load4
.L539:
	movl	8(%ebp), %eax
	movl	80(%eax), %eax
	subl	$12, %esp
	pushl	$0
	pushl	%eax
	movl	-220(%ebp), %eax
	pushl	-128(%eax)
	pushl	$wakeup_connection
	pushl	12(%ebp)
	call	tmr_create
	addl	$32, %esp
	movl	%eax, %ebx
	movl	8(%ebp), %eax
	addl	$72, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%al
	movl	%eax, %esi
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%esi, %eax
	testb	%al, %al
	je	.L540
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_store4
.L540:
	movl	8(%ebp), %eax
	movl	%ebx, 72(%eax)
	movl	8(%ebp), %eax
	movl	72(%eax), %eax
	testl	%eax, %eax
	jne	.L541
	subl	$8, %esp
	pushl	$.LC128
	pushl	$2
	call	syslog
	addl	$16, %esp
	call	__asan_handle_no_return
	subl	$12, %esp
	pushl	$1
	call	exit
.L541:
	jmp	.L508
.L531:
	cmpl	$0, -208(%ebp)
	jns	.L542
	call	__errno_location
	movl	%eax, %ebx
	movl	%ebx, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%al
	movl	%eax, %esi
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%esi, %eax
	testb	%al, %al
	je	.L543
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_load4
.L543:
	movl	(%ebx), %eax
	cmpl	$32, %eax
	je	.L544
	call	__errno_location
	movl	%eax, %ebx
	movl	%ebx, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%al
	movl	%eax, %esi
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%esi, %eax
	testb	%al, %al
	je	.L545
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_load4
.L545:
	movl	(%ebx), %eax
	cmpl	$22, %eax
	je	.L544
	call	__errno_location
	movl	%eax, %ebx
	movl	%ebx, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%al
	movl	%eax, %esi
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%esi, %eax
	testb	%al, %al
	je	.L546
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_load4
.L546:
	movl	(%ebx), %eax
	cmpl	$104, %eax
	je	.L544
	movl	-196(%ebp), %eax
	addl	$172, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L547
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_load4
.L547:
	movl	-196(%ebp), %eax
	movl	172(%eax), %eax
	subl	$4, %esp
	pushl	%eax
	pushl	$.LC129
	pushl	$3
	call	syslog
	addl	$16, %esp
.L544:
	subl	$8, %esp
	pushl	12(%ebp)
	pushl	8(%ebp)
	call	clear_connection
	addl	$16, %esp
	jmp	.L508
.L542:
	movl	12(%ebp), %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L548
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_load4
.L548:
	movl	12(%ebp), %eax
	movl	(%eax), %esi
	movl	8(%ebp), %eax
	addl	$68, %eax
	movl	%eax, %ecx
	movl	%ecx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ecx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L549
	subl	$12, %esp
	pushl	%ecx
	call	__asan_report_store4
.L549:
	movl	8(%ebp), %eax
	movl	%esi, 68(%eax)
	movl	-196(%ebp), %eax
	addl	$304, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L550
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_load4
.L550:
	movl	-196(%ebp), %eax
	movl	304(%eax), %eax
	testl	%eax, %eax
	je	.L551
	movl	-208(%ebp), %edx
	movl	-196(%ebp), %eax
	movl	304(%eax), %eax
	cmpl	%eax, %edx
	jae	.L552
	movl	-196(%ebp), %eax
	movl	304(%eax), %edx
	movl	-208(%ebp), %eax
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, -192(%ebp)
	movl	-192(%ebp), %edi
	movl	-196(%ebp), %eax
	addl	$252, %eax
	movl	%eax, %ecx
	movl	%ecx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ecx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L553
	subl	$12, %esp
	pushl	%ecx
	call	__asan_report_load4
.L553:
	movl	-196(%ebp), %eax
	movl	252(%eax), %edx
	movl	-208(%ebp), %eax
	addl	%edx, %eax
	movl	%eax, %ebx
	movl	%ebx, -236(%ebp)
	movl	-196(%ebp), %eax
	movl	252(%eax), %eax
	movl	%eax, -228(%ebp)
	testl	%edi, %edi
	je	.L554
	movl	%ebx, %esi
	movl	%esi, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %edx
	testb	%dl, %dl
	setne	%cl
	movl	%esi, %eax
	andl	$7, %eax
	cmpb	%dl, %al
	setge	%al
	andl	%eax, %ecx
	movb	%cl, -237(%ebp)
	leal	-1(%edi), %eax
	addl	%ebx, %eax
	movl	%eax, %ecx
	movl	%ecx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ecx, %eax
	andl	$7, %eax
	cmpb	%dl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L555
	subl	$12, %esp
	pushl	%ecx
	call	__asan_report_load1
.L555:
	cmpb	$0, -237(%ebp)
	je	.L554
	subl	$12, %esp
	pushl	%esi
	call	__asan_report_load1
.L554:
	testl	%edi, %edi
	je	.L556
	movl	-228(%ebp), %ebx
	movl	%ebx, %esi
	movl	%esi, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %edx
	testb	%dl, %dl
	setne	%cl
	movl	%esi, %eax
	andl	$7, %eax
	cmpb	%dl, %al
	setge	%al
	andl	%eax, %ecx
	movb	%cl, -237(%ebp)
	leal	-1(%edi), %eax
	addl	%ebx, %eax
	movl	%eax, %ecx
	movl	%ecx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ecx, %eax
	andl	$7, %eax
	cmpb	%dl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L557
	subl	$12, %esp
	pushl	%ecx
	call	__asan_report_store1
.L557:
	cmpb	$0, -237(%ebp)
	je	.L556
	subl	$12, %esp
	pushl	%esi
	call	__asan_report_store1
.L556:
	subl	$4, %esp
	pushl	%edi
	pushl	-236(%ebp)
	pushl	-228(%ebp)
	call	memmove
	addl	$16, %esp
	movl	-192(%ebp), %edx
	movl	-196(%ebp), %eax
	movl	%edx, 304(%eax)
	movl	$0, -208(%ebp)
	jmp	.L551
.L552:
	movl	-208(%ebp), %esi
	movl	-196(%ebp), %eax
	addl	$304, %eax
	movl	%eax, %ecx
	movl	%ecx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ecx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L558
	subl	$12, %esp
	pushl	%ecx
	call	__asan_report_load4
.L558:
	movl	-196(%ebp), %eax
	movl	304(%eax), %eax
	subl	%eax, %esi
	movl	%esi, %eax
	movl	%eax, -208(%ebp)
	movl	-196(%ebp), %eax
	movl	$0, 304(%eax)
.L551:
	movl	8(%ebp), %eax
	addl	$92, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L559
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_load4
.L559:
	movl	8(%ebp), %eax
	movl	92(%eax), %edx
	movl	-208(%ebp), %eax
	addl	%eax, %edx
	movl	8(%ebp), %eax
	movl	%edx, 92(%eax)
	movl	8(%ebp), %eax
	addl	$8, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L560
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_load4
.L560:
	movl	8(%ebp), %eax
	movl	8(%eax), %edi
	movl	8(%ebp), %eax
	movl	8(%eax), %esi
	leal	168(%esi), %eax
	movl	%eax, %ecx
	movl	%ecx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ecx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L561
	subl	$12, %esp
	pushl	%ecx
	call	__asan_report_load4
.L561:
	movl	168(%esi), %edx
	movl	-208(%ebp), %eax
	leal	(%edx,%eax), %esi
	leal	168(%edi), %eax
	movl	%eax, %ecx
	movl	%ecx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ecx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L562
	subl	$12, %esp
	pushl	%ecx
	call	__asan_report_store4
.L562:
	movl	%esi, 168(%edi)
	movl	$0, -200(%ebp)
	jmp	.L563
.L568:
	movl	throttles, %esi
	movl	-200(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	addl	$12, %eax
	movl	%eax, %ecx
	movl	%ecx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ecx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L564
	subl	$12, %esp
	pushl	%ecx
	call	__asan_report_load4
.L564:
	movl	8(%ebp), %eax
	movl	-200(%ebp), %edx
	movl	12(%eax,%edx,4), %eax
	movl	%eax, %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%esi,%eax), %edi
	movl	throttles, %ecx
	movl	8(%ebp), %edx
	movl	-200(%ebp), %eax
	movl	12(%edx,%eax,4), %eax
	movl	%eax, %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ecx,%eax), %esi
	leal	16(%esi), %eax
	movl	%eax, %ecx
	movl	%ecx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ecx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L565
	subl	$12, %esp
	pushl	%ecx
	call	__asan_report_load4
.L565:
	movl	16(%esi), %edx
	movl	-208(%ebp), %eax
	leal	(%edx,%eax), %esi
	leal	16(%edi), %eax
	movl	%eax, %ecx
	movl	%ecx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ecx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L566
	subl	$12, %esp
	pushl	%ecx
	call	__asan_report_store4
.L566:
	movl	%esi, 16(%edi)
	addl	$1, -200(%ebp)
.L563:
	movl	8(%ebp), %eax
	addl	$52, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L567
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_load4
.L567:
	movl	8(%ebp), %eax
	movl	52(%eax), %eax
	cmpl	-200(%ebp), %eax
	jg	.L568
	movl	8(%ebp), %eax
	addl	$92, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L569
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_load4
.L569:
	movl	8(%ebp), %eax
	movl	92(%eax), %esi
	movl	8(%ebp), %eax
	addl	$88, %eax
	movl	%eax, %ecx
	movl	%ecx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ecx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L570
	subl	$12, %esp
	pushl	%ecx
	call	__asan_report_load4
.L570:
	movl	8(%ebp), %eax
	movl	88(%eax), %eax
	cmpl	%eax, %esi
	jl	.L571
	subl	$8, %esp
	pushl	12(%ebp)
	pushl	8(%ebp)
	call	finish_connection
	addl	$16, %esp
	jmp	.L508
.L571:
	movl	8(%ebp), %eax
	addl	$80, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L572
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_load4
.L572:
	movl	8(%ebp), %eax
	movl	80(%eax), %eax
	cmpl	$100, %eax
	jle	.L573
	movl	8(%ebp), %eax
	movl	80(%eax), %eax
	leal	-100(%eax), %edx
	movl	8(%ebp), %eax
	movl	%edx, 80(%eax)
.L573:
	movl	8(%ebp), %eax
	addl	$56, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L574
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_load4
.L574:
	movl	8(%ebp), %eax
	movl	56(%eax), %eax
	cmpl	$-1, %eax
	je	.L508
	movl	12(%ebp), %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L576
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_load4
.L576:
	movl	12(%ebp), %eax
	movl	(%eax), %esi
	movl	8(%ebp), %eax
	addl	$64, %eax
	movl	%eax, %ecx
	movl	%ecx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ecx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L577
	subl	$12, %esp
	pushl	%ecx
	call	__asan_report_load4
.L577:
	movl	8(%ebp), %eax
	movl	64(%eax), %eax
	subl	%eax, %esi
	movl	%esi, %eax
	movl	%eax, -204(%ebp)
	cmpl	$0, -204(%ebp)
	jne	.L578
	movl	$1, -204(%ebp)
.L578:
	movl	8(%ebp), %eax
	addl	$8, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L579
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_load4
.L579:
	movl	8(%ebp), %eax
	movl	8(%eax), %ebx
	leal	168(%ebx), %eax
	movl	%eax, %ecx
	movl	%ecx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %edx
	testb	%dl, %dl
	setne	%al
	movl	%eax, %esi
	movl	%ecx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	setge	%al
	andl	%esi, %eax
	testb	%al, %al
	je	.L580
	subl	$12, %esp
	pushl	%ecx
	call	__asan_report_load4
.L580:
	movl	168(%ebx), %eax
	cltd
	idivl	-204(%ebp)
	movl	%eax, %esi
	movl	8(%ebp), %eax
	addl	$56, %eax
	movl	%eax, %ecx
	movl	%ecx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ecx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L581
	subl	$12, %esp
	pushl	%ecx
	call	__asan_report_load4
.L581:
	movl	8(%ebp), %eax
	movl	56(%eax), %eax
	cmpl	%eax, %esi
	jle	.L508
	movl	8(%ebp), %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L582
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_store4
.L582:
	movl	8(%ebp), %eax
	movl	$3, (%eax)
	movl	-196(%ebp), %eax
	addl	$448, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L583
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_load4
.L583:
	movl	-196(%ebp), %eax
	movl	448(%eax), %eax
	subl	$12, %esp
	pushl	%eax
	call	fdwatch_del_fd
	addl	$16, %esp
	movl	8(%ebp), %eax
	addl	$8, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L584
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_load4
.L584:
	movl	8(%ebp), %eax
	movl	8(%eax), %ebx
	leal	168(%ebx), %eax
	movl	%eax, %ecx
	movl	%ecx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %edx
	testb	%dl, %dl
	setne	%al
	movl	%eax, %esi
	movl	%ecx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	setge	%al
	andl	%esi, %eax
	testb	%al, %al
	je	.L585
	subl	$12, %esp
	pushl	%ecx
	call	__asan_report_load4
.L585:
	movl	168(%ebx), %esi
	movl	8(%ebp), %eax
	addl	$56, %eax
	movl	%eax, %ecx
	movl	%ecx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ecx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L586
	subl	$12, %esp
	pushl	%ecx
	call	__asan_report_load4
.L586:
	movl	8(%ebp), %eax
	movl	56(%eax), %edi
	movl	%esi, %eax
	cltd
	idivl	%edi
	subl	-204(%ebp), %eax
	movl	%eax, -188(%ebp)
	movl	8(%ebp), %eax
	movl	-220(%ebp), %edi
	movl	%eax, -128(%edi)
	movl	8(%ebp), %eax
	addl	$72, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L587
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_load4
.L587:
	movl	8(%ebp), %eax
	movl	72(%eax), %eax
	testl	%eax, %eax
	je	.L588
	subl	$8, %esp
	pushl	$.LC127
	pushl	$3
	call	syslog
	addl	$16, %esp
.L588:
	cmpl	$0, -188(%ebp)
	jle	.L589
	movl	-188(%ebp), %eax
	imull	$1000, %eax, %eax
	jmp	.L590
.L589:
	movl	$500, %eax
.L590:
	subl	$12, %esp
	pushl	$0
	pushl	%eax
	movl	-220(%ebp), %eax
	pushl	-128(%eax)
	pushl	$wakeup_connection
	pushl	12(%ebp)
	call	tmr_create
	addl	$32, %esp
	movl	%eax, %ebx
	movl	8(%ebp), %eax
	addl	$72, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%al
	movl	%eax, %esi
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%esi, %eax
	testb	%al, %al
	je	.L591
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_store4
.L591:
	movl	8(%ebp), %eax
	movl	%ebx, 72(%eax)
	movl	8(%ebp), %eax
	movl	72(%eax), %eax
	testl	%eax, %eax
	jne	.L508
	subl	$8, %esp
	pushl	$.LC128
	pushl	$2
	call	syslog
	addl	$16, %esp
	call	__asan_handle_no_return
	subl	$12, %esp
	pushl	$1
	call	exit
.L508:
	movl	-224(%ebp), %edi
	cmpl	%edi, -244(%ebp)
	je	.L506
	movl	-224(%ebp), %eax
	movl	$1172321806, (%eax)
	movl	-232(%ebp), %eax
	movl	$-168430091, 536870912(%eax)
	movl	$-168430091, 536870916(%eax)
	movl	$-168430091, 536870920(%eax)
	movl	$-168430091, 536870924(%eax)
	movl	$-168430091, 536870928(%eax)
	jmp	.L507
.L506:
	movl	-232(%ebp), %eax
	movl	$0, 536870912(%eax)
	movl	$0, 536870916(%eax)
	movl	$0, 536870920(%eax)
	movl	$0, 536870924(%eax)
	movl	$0, 536870928(%eax)
.L507:
	leal	-12(%ebp), %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE19:
	.size	handle_send, .-handle_send
	.section	.rodata
.LC130:
	.string	"1 32 4096 3 buf "
	.text
	.type	handle_linger, @function
handle_linger:
.LASANPC20:
.LFB20:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$4252, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	movl	8(%ebp), %eax
	movl	%eax, -4236(%ebp)
	movl	12(%ebp), %eax
	movl	%eax, -4240(%ebp)
	leal	-4216(%ebp), %ebx
	movl	%ebx, -4244(%ebp)
	cmpl	$0, __asan_option_detect_stack_use_after_return
	je	.L593
	subl	$8, %esp
	pushl	%ebx
	pushl	$4188
	call	__asan_stack_malloc_7
	addl	$16, %esp
	movl	%eax, %ebx
.L593:
	leal	4192(%ebx), %eax
	movl	%eax, -4248(%ebp)
	movl	$1102416563, (%ebx)
	movl	$.LC130, 4(%ebx)
	movl	$.LASANPC20, 8(%ebx)
	movl	%ebx, %eax
	shrl	$3, %eax
	movl	%eax, -4252(%ebp)
	movl	$-235802127, 536870912(%eax)
	movl	$-202116109, 536871428(%eax)
	movl	%gs:20, %eax
	movl	%eax, -28(%ebp)
	xorl	%eax, %eax
	movl	-4236(%ebp), %eax
	addl	$8, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%al
	movl	%eax, %esi
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%esi, %eax
	testb	%al, %al
	je	.L597
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_load4
.L597:
	movl	-4236(%ebp), %eax
	movl	8(%eax), %esi
	leal	448(%esi), %eax
	movl	%eax, %ecx
	movl	%ecx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %edx
	testb	%dl, %dl
	setne	%al
	movl	%eax, %edi
	movl	%ecx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	setge	%al
	andl	%edi, %eax
	testb	%al, %al
	je	.L598
	subl	$12, %esp
	pushl	%ecx
	call	__asan_report_load4
.L598:
	movl	448(%esi), %eax
	subl	$4, %esp
	pushl	$4096
	movl	-4248(%ebp), %edx
	subl	$4160, %edx
	pushl	%edx
	pushl	%eax
	call	read
	addl	$16, %esp
	movl	%eax, -4220(%ebp)
	cmpl	$0, -4220(%ebp)
	jns	.L599
	call	__errno_location
	movl	%eax, %esi
	movl	%esi, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%al
	movl	%eax, %edi
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%edi, %eax
	testb	%al, %al
	je	.L600
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_load4
.L600:
	movl	(%esi), %eax
	cmpl	$4, %eax
	je	.L596
	call	__errno_location
	movl	%eax, %esi
	movl	%esi, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%al
	movl	%eax, %edi
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%edi, %eax
	testb	%al, %al
	je	.L602
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_load4
.L602:
	movl	(%esi), %eax
	cmpl	$11, %eax
	je	.L596
.L599:
	cmpl	$0, -4220(%ebp)
	jg	.L596
	subl	$8, %esp
	pushl	-4240(%ebp)
	pushl	-4236(%ebp)
	call	really_clear_connection
	addl	$16, %esp
.L596:
	cmpl	%ebx, -4244(%ebp)
	je	.L594
	movl	$1172321806, (%ebx)
	subl	$4, %esp
	pushl	-4244(%ebp)
	pushl	$4188
	pushl	%ebx
	call	__asan_stack_free_7
	addl	$16, %esp
	jmp	.L595
.L594:
	movl	-4252(%ebp), %eax
	movl	$0, 536870912(%eax)
	movl	$0, 536871428(%eax)
.L595:
	movl	-28(%ebp), %eax
	xorl	%gs:20, %eax
	je	.L605
	call	__stack_chk_fail
.L605:
	leal	-12(%ebp), %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE20:
	.size	handle_linger, .-handle_linger
	.section	.rodata
	.align 32
.LC131:
	.string	"throttle sending count was negative - shouldn't happen!"
	.zero	40
	.text
	.type	check_throttles, @function
check_throttles:
.LASANPC21:
.LFB21:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$44, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	movl	8(%ebp), %eax
	addl	$52, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L607
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_store4
.L607:
	movl	8(%ebp), %eax
	movl	$0, 52(%eax)
	movl	8(%ebp), %eax
	addl	$60, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L608
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_store4
.L608:
	movl	8(%ebp), %eax
	movl	$-1, 60(%eax)
	movl	8(%ebp), %eax
	movl	60(%eax), %ecx
	movl	8(%ebp), %eax
	addl	$56, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L609
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_store4
.L609:
	movl	8(%ebp), %eax
	movl	%ecx, 56(%eax)
	movl	$0, -32(%ebp)
	jmp	.L610
.L640:
	movl	8(%ebp), %eax
	addl	$8, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L611
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L611:
	movl	8(%ebp), %eax
	movl	8(%eax), %edx
	leal	188(%edx), %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%esi, %ecx
	testb	%cl, %cl
	je	.L612
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L612:
	movl	188(%edx), %eax
	movl	%eax, -44(%ebp)
	movl	throttles, %ecx
	movl	-32(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	addl	%eax, %ecx
	movl	%ecx, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %edi
	movl	%eax, %esi
	andl	$7, %esi
	addl	$3, %esi
	movl	%esi, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%edi, %edx
	testb	%dl, %dl
	je	.L613
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L613:
	movl	(%ecx), %eax
	subl	$8, %esp
	pushl	-44(%ebp)
	pushl	%eax
	call	match
	addl	$16, %esp
	testl	%eax, %eax
	je	.L614
	movl	throttles, %ecx
	movl	-32(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ecx,%eax), %edx
	leal	12(%edx), %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%esi, %ecx
	testb	%cl, %cl
	je	.L615
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L615:
	movl	12(%edx), %eax
	movl	%eax, -44(%ebp)
	movl	throttles, %ecx
	movl	-32(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ecx,%eax), %edx
	leal	4(%edx), %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %edi
	movl	%eax, %esi
	andl	$7, %esi
	addl	$3, %esi
	movl	%esi, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%edi, %ecx
	testb	%cl, %cl
	je	.L616
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L616:
	movl	4(%edx), %eax
	addl	%eax, %eax
	cmpl	%eax, -44(%ebp)
	jle	.L617
	movl	$0, %eax
	jmp	.L618
.L617:
	movl	throttles, %ecx
	movl	-32(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ecx,%eax), %edx
	leal	12(%edx), %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%esi, %ecx
	testb	%cl, %cl
	je	.L619
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L619:
	movl	12(%edx), %eax
	movl	%eax, -44(%ebp)
	movl	throttles, %ecx
	movl	-32(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ecx,%eax), %edx
	leal	8(%edx), %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %edi
	movl	%eax, %esi
	andl	$7, %esi
	addl	$3, %esi
	movl	%esi, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%edi, %ecx
	testb	%cl, %cl
	je	.L620
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L620:
	movl	8(%edx), %eax
	cmpl	%eax, -44(%ebp)
	jge	.L621
	movl	$0, %eax
	jmp	.L618
.L621:
	movl	throttles, %ecx
	movl	-32(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ecx,%eax), %edx
	leal	20(%edx), %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%esi, %ecx
	testb	%cl, %cl
	je	.L622
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L622:
	movl	20(%edx), %eax
	testl	%eax, %eax
	jns	.L623
	subl	$8, %esp
	pushl	$.LC131
	pushl	$3
	call	syslog
	addl	$16, %esp
	movl	throttles, %ecx
	movl	-32(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ecx,%eax), %edx
	leal	20(%edx), %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%esi, %ecx
	testb	%cl, %cl
	je	.L624
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_store4
.L624:
	movl	$0, 20(%edx)
.L623:
	movl	8(%ebp), %eax
	addl	$52, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L625
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L625:
	movl	8(%ebp), %eax
	movl	52(%eax), %eax
	leal	1(%eax), %ecx
	movl	8(%ebp), %edx
	movl	%ecx, 52(%edx)
	leal	0(,%eax,4), %ecx
	movl	8(%ebp), %edx
	addl	%ecx, %edx
	addl	$12, %edx
	movl	%edx, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %esi
	movl	%edx, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%esi, %ecx
	testb	%cl, %cl
	je	.L626
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_store4
.L626:
	movl	8(%ebp), %edx
	movl	-32(%ebp), %ecx
	movl	%ecx, 12(%edx,%eax,4)
	movl	throttles, %ecx
	movl	-32(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	addl	%ecx, %eax
	leal	20(%eax), %edx
	movl	%edx, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %esi
	movl	%edx, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%esi, %ecx
	testb	%cl, %cl
	je	.L627
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_load4
.L627:
	movl	20(%eax), %edx
	addl	$1, %edx
	movl	%edx, 20(%eax)
	movl	throttles, %ecx
	movl	-32(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ecx,%eax), %edx
	leal	4(%edx), %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%esi, %ecx
	testb	%cl, %cl
	je	.L628
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L628:
	movl	4(%edx), %eax
	movl	%eax, -44(%ebp)
	movl	throttles, %ecx
	movl	-32(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ecx,%eax), %edx
	leal	20(%edx), %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %edi
	movl	%eax, %esi
	andl	$7, %esi
	addl	$3, %esi
	movl	%esi, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%edi, %ecx
	testb	%cl, %cl
	je	.L629
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L629:
	movl	20(%edx), %edi
	movl	-44(%ebp), %eax
	cltd
	idivl	%edi
	movl	%eax, -28(%ebp)
	movl	8(%ebp), %eax
	addl	$56, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L630
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L630:
	movl	8(%ebp), %eax
	movl	56(%eax), %eax
	cmpl	$-1, %eax
	jne	.L631
	movl	8(%ebp), %eax
	movl	-28(%ebp), %edx
	movl	%edx, 56(%eax)
	jmp	.L632
.L631:
	movl	8(%ebp), %eax
	addl	$56, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L633
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L633:
	movl	8(%ebp), %eax
	movl	56(%eax), %edx
	movl	-28(%ebp), %eax
	cmpl	%eax, %edx
	cmovg	%eax, %edx
	movl	8(%ebp), %eax
	movl	%edx, 56(%eax)
.L632:
	movl	throttles, %ecx
	movl	-32(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ecx,%eax), %edx
	leal	8(%edx), %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%esi, %ecx
	testb	%cl, %cl
	je	.L634
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L634:
	movl	8(%edx), %eax
	movl	%eax, -28(%ebp)
	movl	8(%ebp), %eax
	addl	$60, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L635
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L635:
	movl	8(%ebp), %eax
	movl	60(%eax), %eax
	cmpl	$-1, %eax
	jne	.L636
	movl	8(%ebp), %eax
	movl	-28(%ebp), %edx
	movl	%edx, 60(%eax)
	jmp	.L614
.L636:
	movl	8(%ebp), %eax
	addl	$60, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L637
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L637:
	movl	8(%ebp), %eax
	movl	60(%eax), %edx
	movl	-28(%ebp), %eax
	cmpl	%eax, %edx
	cmovl	%eax, %edx
	movl	8(%ebp), %eax
	movl	%edx, 60(%eax)
.L614:
	addl	$1, -32(%ebp)
.L610:
	movl	numthrottles, %eax
	cmpl	%eax, -32(%ebp)
	jge	.L638
	movl	8(%ebp), %eax
	addl	$52, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L639
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L639:
	movl	8(%ebp), %eax
	movl	52(%eax), %eax
	cmpl	$9, %eax
	jle	.L640
.L638:
	movl	$1, %eax
.L618:
	leal	-12(%ebp), %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE21:
	.size	check_throttles, .-check_throttles
	.type	clear_throttles, @function
clear_throttles:
.LASANPC22:
.LFB22:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%esi
	pushl	%ebx
	subl	$16, %esp
	.cfi_offset 6, -12
	.cfi_offset 3, -16
	movl	$0, -12(%ebp)
	jmp	.L642
.L646:
	movl	throttles, %ecx
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	addl	$12, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L643
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L643:
	movl	8(%ebp), %eax
	movl	-12(%ebp), %edx
	movl	12(%eax,%edx,4), %eax
	movl	%eax, %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	addl	%ecx, %eax
	leal	20(%eax), %edx
	movl	%edx, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %esi
	movl	%edx, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%esi, %ecx
	testb	%cl, %cl
	je	.L644
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_load4
.L644:
	movl	20(%eax), %edx
	subl	$1, %edx
	movl	%edx, 20(%eax)
	addl	$1, -12(%ebp)
.L642:
	movl	8(%ebp), %eax
	addl	$52, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L645
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L645:
	movl	8(%ebp), %eax
	movl	52(%eax), %eax
	cmpl	-12(%ebp), %eax
	jg	.L646
	leal	-8(%ebp), %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE22:
	.size	clear_throttles, .-clear_throttles
	.section	.rodata
	.align 32
.LC132:
	.string	"throttle #%d '%.80s' rate %ld greatly exceeding limit %ld; %d sending"
	.zero	58
	.align 32
.LC133:
	.string	"throttle #%d '%.80s' rate %ld exceeding limit %ld; %d sending"
	.zero	34
	.align 32
.LC134:
	.string	"throttle #%d '%.80s' rate %ld lower than minimum %ld; %d sending"
	.zero	63
	.text
	.type	update_throttles, @function
update_throttles:
.LASANPC23:
.LFB23:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$60, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	movl	$0, -44(%ebp)
	jmp	.L648
.L676:
	movl	throttles, %ecx
	movl	-44(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ecx,%eax), %edi
	movl	throttles, %ecx
	movl	-44(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ecx,%eax), %edx
	leal	12(%edx), %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%esi, %ecx
	testb	%cl, %cl
	je	.L649
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L649:
	movl	12(%edx), %eax
	leal	(%eax,%eax), %esi
	movl	throttles, %ecx
	movl	-44(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	addl	%eax, %ecx
	leal	16(%ecx), %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ebx
	testb	%bl, %bl
	setne	-60(%ebp)
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%bl, %al
	setge	%al
	andb	-60(%ebp), %al
	testb	%al, %al
	je	.L650
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_load4
.L650:
	movl	16(%ecx), %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	leal	(%esi,%eax), %ecx
	movl	$1431655766, %edx
	movl	%ecx, %eax
	imull	%edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %ecx
	leal	12(%edi), %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L651
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_store4
.L651:
	movl	%ecx, 12(%edi)
	movl	throttles, %ecx
	movl	-44(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ecx,%eax), %edx
	leal	16(%edx), %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%esi, %ecx
	testb	%cl, %cl
	je	.L652
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_store4
.L652:
	movl	$0, 16(%edx)
	movl	throttles, %ecx
	movl	-44(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ecx,%eax), %edx
	leal	12(%edx), %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%esi, %ecx
	testb	%cl, %cl
	je	.L653
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L653:
	movl	12(%edx), %eax
	movl	%eax, -60(%ebp)
	movl	throttles, %ecx
	movl	-44(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ecx,%eax), %edx
	leal	4(%edx), %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %edi
	movl	%eax, %esi
	andl	$7, %esi
	addl	$3, %esi
	movl	%esi, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%edi, %ecx
	testb	%cl, %cl
	je	.L654
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L654:
	movl	4(%edx), %eax
	cmpl	%eax, -60(%ebp)
	jle	.L655
	movl	throttles, %ecx
	movl	-44(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ecx,%eax), %edx
	leal	20(%edx), %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%esi, %ecx
	testb	%cl, %cl
	je	.L656
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L656:
	movl	20(%edx), %eax
	testl	%eax, %eax
	je	.L655
	movl	throttles, %ecx
	movl	-44(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ecx,%eax), %edx
	leal	12(%edx), %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%esi, %ecx
	testb	%cl, %cl
	je	.L657
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L657:
	movl	12(%edx), %eax
	movl	%eax, -60(%ebp)
	movl	throttles, %ecx
	movl	-44(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ecx,%eax), %edx
	leal	4(%edx), %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %edi
	movl	%eax, %esi
	andl	$7, %esi
	addl	$3, %esi
	movl	%esi, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%edi, %ecx
	testb	%cl, %cl
	je	.L658
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L658:
	movl	4(%edx), %eax
	addl	%eax, %eax
	cmpl	%eax, -60(%ebp)
	jle	.L659
	movl	throttles, %ecx
	movl	-44(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ecx,%eax), %edx
	leal	20(%edx), %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%esi, %ecx
	testb	%cl, %cl
	je	.L660
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L660:
	movl	20(%edx), %eax
	movl	%eax, -60(%ebp)
	movl	throttles, %ecx
	movl	-44(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ecx,%eax), %edx
	leal	4(%edx), %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%esi, %ecx
	testb	%cl, %cl
	je	.L661
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L661:
	movl	4(%edx), %eax
	movl	%eax, -64(%ebp)
	movl	throttles, %ecx
	movl	-44(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	addl	%eax, %ecx
	leal	12(%ecx), %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ebx
	testb	%bl, %bl
	setne	%al
	movl	%eax, %esi
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%bl, %al
	setge	%al
	andl	%esi, %eax
	testb	%al, %al
	je	.L662
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_load4
.L662:
	movl	12(%ecx), %esi
	movl	throttles, %ecx
	movl	-44(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ecx,%eax), %ebx
	movl	%ebx, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%al
	movl	%eax, %edi
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%edi, %eax
	testb	%al, %al
	je	.L663
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_load4
.L663:
	movl	(%ebx), %eax
	subl	$4, %esp
	pushl	-60(%ebp)
	pushl	-64(%ebp)
	pushl	%esi
	pushl	%eax
	pushl	-44(%ebp)
	pushl	$.LC132
	pushl	$5
	call	syslog
	addl	$32, %esp
	jmp	.L655
.L659:
	movl	throttles, %ecx
	movl	-44(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ecx,%eax), %edx
	leal	20(%edx), %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%esi, %ecx
	testb	%cl, %cl
	je	.L664
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L664:
	movl	20(%edx), %eax
	movl	%eax, -60(%ebp)
	movl	throttles, %ecx
	movl	-44(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ecx,%eax), %edx
	leal	4(%edx), %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%esi, %ecx
	testb	%cl, %cl
	je	.L665
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L665:
	movl	4(%edx), %eax
	movl	%eax, -64(%ebp)
	movl	throttles, %ecx
	movl	-44(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	addl	%eax, %ecx
	leal	12(%ecx), %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ebx
	testb	%bl, %bl
	setne	%al
	movl	%eax, %esi
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%bl, %al
	setge	%al
	andl	%esi, %eax
	testb	%al, %al
	je	.L666
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_load4
.L666:
	movl	12(%ecx), %esi
	movl	throttles, %ecx
	movl	-44(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ecx,%eax), %ebx
	movl	%ebx, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%al
	movl	%eax, %edi
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%edi, %eax
	testb	%al, %al
	je	.L667
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_load4
.L667:
	movl	(%ebx), %eax
	subl	$4, %esp
	pushl	-60(%ebp)
	pushl	-64(%ebp)
	pushl	%esi
	pushl	%eax
	pushl	-44(%ebp)
	pushl	$.LC133
	pushl	$6
	call	syslog
	addl	$32, %esp
.L655:
	movl	throttles, %ecx
	movl	-44(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ecx,%eax), %edx
	leal	12(%edx), %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%esi, %ecx
	testb	%cl, %cl
	je	.L668
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L668:
	movl	12(%edx), %eax
	movl	%eax, -60(%ebp)
	movl	throttles, %ecx
	movl	-44(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ecx,%eax), %edx
	leal	8(%edx), %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %edi
	movl	%eax, %esi
	andl	$7, %esi
	addl	$3, %esi
	movl	%esi, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%edi, %ecx
	testb	%cl, %cl
	je	.L669
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L669:
	movl	8(%edx), %eax
	cmpl	%eax, -60(%ebp)
	jge	.L670
	movl	throttles, %ecx
	movl	-44(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ecx,%eax), %edx
	leal	20(%edx), %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%esi, %ecx
	testb	%cl, %cl
	je	.L671
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L671:
	movl	20(%edx), %eax
	testl	%eax, %eax
	je	.L670
	movl	throttles, %ecx
	movl	-44(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ecx,%eax), %edx
	leal	20(%edx), %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%esi, %ecx
	testb	%cl, %cl
	je	.L672
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L672:
	movl	20(%edx), %eax
	movl	%eax, -60(%ebp)
	movl	throttles, %ecx
	movl	-44(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ecx,%eax), %edx
	leal	8(%edx), %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%esi, %ecx
	testb	%cl, %cl
	je	.L673
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L673:
	movl	8(%edx), %eax
	movl	%eax, -64(%ebp)
	movl	throttles, %ecx
	movl	-44(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	addl	%eax, %ecx
	leal	12(%ecx), %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ebx
	testb	%bl, %bl
	setne	%al
	movl	%eax, %esi
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%bl, %al
	setge	%al
	andl	%esi, %eax
	testb	%al, %al
	je	.L674
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_load4
.L674:
	movl	12(%ecx), %esi
	movl	throttles, %ecx
	movl	-44(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ecx,%eax), %ebx
	movl	%ebx, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%al
	movl	%eax, %edi
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%edi, %eax
	testb	%al, %al
	je	.L675
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_load4
.L675:
	movl	(%ebx), %eax
	subl	$4, %esp
	pushl	-60(%ebp)
	pushl	-64(%ebp)
	pushl	%esi
	pushl	%eax
	pushl	-44(%ebp)
	pushl	$.LC134
	pushl	$5
	call	syslog
	addl	$32, %esp
.L670:
	addl	$1, -44(%ebp)
.L648:
	movl	numthrottles, %eax
	cmpl	%eax, -44(%ebp)
	jl	.L676
	movl	$0, -36(%ebp)
	jmp	.L677
.L692:
	movl	connects, %ecx
	movl	-36(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$5, %eax
	addl	%ecx, %eax
	movl	%eax, -32(%ebp)
	movl	-32(%ebp), %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L678
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L678:
	movl	-32(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$2, %eax
	je	.L679
	movl	-32(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$3, %eax
	jne	.L680
.L679:
	movl	-32(%ebp), %eax
	addl	$56, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L681
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_store4
.L681:
	movl	-32(%ebp), %eax
	movl	$-1, 56(%eax)
	movl	$0, -40(%ebp)
	jmp	.L682
.L691:
	movl	-40(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	-32(%ebp), %eax
	addl	%edx, %eax
	addl	$12, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L683
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L683:
	movl	-32(%ebp), %eax
	movl	-40(%ebp), %edx
	movl	12(%eax,%edx,4), %eax
	movl	%eax, -44(%ebp)
	movl	throttles, %ecx
	movl	-44(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ecx,%eax), %edx
	leal	4(%edx), %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%esi, %ecx
	testb	%cl, %cl
	je	.L684
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L684:
	movl	4(%edx), %eax
	movl	%eax, -60(%ebp)
	movl	throttles, %ecx
	movl	-44(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ecx,%eax), %edx
	leal	20(%edx), %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %edi
	movl	%eax, %esi
	andl	$7, %esi
	addl	$3, %esi
	movl	%esi, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%edi, %ecx
	testb	%cl, %cl
	je	.L685
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L685:
	movl	20(%edx), %edi
	movl	-60(%ebp), %eax
	cltd
	idivl	%edi
	movl	%eax, -28(%ebp)
	movl	-32(%ebp), %eax
	addl	$56, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L686
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L686:
	movl	-32(%ebp), %eax
	movl	56(%eax), %eax
	cmpl	$-1, %eax
	jne	.L687
	movl	-32(%ebp), %eax
	movl	-28(%ebp), %edx
	movl	%edx, 56(%eax)
	jmp	.L688
.L687:
	movl	-32(%ebp), %eax
	addl	$56, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L689
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L689:
	movl	-32(%ebp), %eax
	movl	56(%eax), %edx
	movl	-28(%ebp), %eax
	cmpl	%eax, %edx
	cmovg	%eax, %edx
	movl	-32(%ebp), %eax
	movl	%edx, 56(%eax)
.L688:
	addl	$1, -40(%ebp)
.L682:
	movl	-32(%ebp), %eax
	addl	$52, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L690
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L690:
	movl	-32(%ebp), %eax
	movl	52(%eax), %eax
	cmpl	-40(%ebp), %eax
	jg	.L691
.L680:
	addl	$1, -36(%ebp)
.L677:
	movl	max_connects, %eax
	cmpl	%eax, -36(%ebp)
	jl	.L692
	leal	-12(%ebp), %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE23:
	.size	update_throttles, .-update_throttles
	.type	finish_connection, @function
finish_connection:
.LASANPC24:
.LFB24:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$4, %esp
	.cfi_offset 3, -12
	movl	8(%ebp), %eax
	addl	$8, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L694
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L694:
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	subl	$12, %esp
	pushl	%eax
	call	httpd_write_response
	addl	$16, %esp
	subl	$8, %esp
	pushl	12(%ebp)
	pushl	8(%ebp)
	call	clear_connection
	addl	$16, %esp
	movl	-4(%ebp), %ebx
	leave
	.cfi_restore 5
	.cfi_restore 3
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE24:
	.size	finish_connection, .-finish_connection
	.section	.rodata
	.align 32
.LC135:
	.string	"replacing non-null linger_timer!"
	.zero	63
	.align 32
.LC136:
	.string	"tmr_create(linger_clear_connection) failed"
	.zero	53
	.text
	.type	clear_connection, @function
clear_connection:
.LASANPC25:
.LFB25:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$124, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	leal	-120(%ebp), %edi
	movl	%edi, -132(%ebp)
	cmpl	$0, __asan_option_detect_stack_use_after_return
	je	.L695
	subl	$8, %esp
	pushl	%edi
	pushl	$96
	call	__asan_stack_malloc_1
	addl	$16, %esp
	movl	%eax, %edi
.L695:
	leal	96(%edi), %eax
	movl	%eax, -124(%ebp)
	movl	$1102416563, (%edi)
	movl	$.LC122, 4(%edi)
	movl	$.LASANPC25, 8(%edi)
	movl	%edi, %eax
	shrl	$3, %eax
	movl	%eax, -128(%ebp)
	movl	$-235802127, 536870912(%eax)
	movl	$-185273340, 536870916(%eax)
	movl	$-202116109, 536870920(%eax)
	movl	8(%ebp), %eax
	addl	$72, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L699
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_load4
.L699:
	movl	8(%ebp), %eax
	movl	72(%eax), %eax
	testl	%eax, %eax
	je	.L700
	movl	8(%ebp), %eax
	movl	72(%eax), %eax
	subl	$12, %esp
	pushl	%eax
	call	tmr_cancel
	addl	$16, %esp
	movl	8(%ebp), %eax
	addl	$72, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L701
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_store4
.L701:
	movl	8(%ebp), %eax
	movl	$0, 72(%eax)
.L700:
	movl	8(%ebp), %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L702
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_load4
.L702:
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$4, %eax
	jne	.L703
	movl	8(%ebp), %eax
	addl	$76, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L704
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_load4
.L704:
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	subl	$12, %esp
	pushl	%eax
	call	tmr_cancel
	addl	$16, %esp
	movl	8(%ebp), %eax
	addl	$76, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L705
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_store4
.L705:
	movl	8(%ebp), %eax
	movl	$0, 76(%eax)
	movl	8(%ebp), %eax
	addl	$8, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L706
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_load4
.L706:
	movl	8(%ebp), %eax
	movl	8(%eax), %ebx
	leal	356(%ebx), %eax
	movl	%eax, %ecx
	movl	%ecx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %edx
	testb	%dl, %dl
	setne	%al
	movl	%eax, %esi
	movl	%ecx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	setge	%al
	andl	%esi, %eax
	testb	%al, %al
	je	.L707
	subl	$12, %esp
	pushl	%ecx
	call	__asan_report_store4
.L707:
	movl	$0, 356(%ebx)
.L703:
	movl	8(%ebp), %eax
	addl	$8, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L708
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_load4
.L708:
	movl	8(%ebp), %eax
	movl	8(%eax), %ebx
	leal	356(%ebx), %eax
	movl	%eax, %ecx
	movl	%ecx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %edx
	testb	%dl, %dl
	setne	%al
	movl	%eax, %esi
	movl	%ecx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	setge	%al
	andl	%esi, %eax
	testb	%al, %al
	je	.L709
	subl	$12, %esp
	pushl	%ecx
	call	__asan_report_load4
.L709:
	movl	356(%ebx), %eax
	testl	%eax, %eax
	je	.L710
	movl	8(%ebp), %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L711
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_load4
.L711:
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$3, %eax
	je	.L712
	movl	8(%ebp), %eax
	movl	8(%eax), %ebx
	leal	448(%ebx), %eax
	movl	%eax, %ecx
	movl	%ecx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %edx
	testb	%dl, %dl
	setne	%al
	movl	%eax, %esi
	movl	%ecx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	setge	%al
	andl	%esi, %eax
	testb	%al, %al
	je	.L713
	subl	$12, %esp
	pushl	%ecx
	call	__asan_report_load4
.L713:
	movl	448(%ebx), %eax
	subl	$12, %esp
	pushl	%eax
	call	fdwatch_del_fd
	addl	$16, %esp
.L712:
	movl	8(%ebp), %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L714
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_store4
.L714:
	movl	8(%ebp), %eax
	movl	$4, (%eax)
	movl	8(%ebp), %eax
	addl	$8, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L715
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_load4
.L715:
	movl	8(%ebp), %eax
	movl	8(%eax), %ebx
	leal	448(%ebx), %eax
	movl	%eax, %ecx
	movl	%ecx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %edx
	testb	%dl, %dl
	setne	%al
	movl	%eax, %esi
	movl	%ecx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	setge	%al
	andl	%esi, %eax
	testb	%al, %al
	je	.L716
	subl	$12, %esp
	pushl	%ecx
	call	__asan_report_load4
.L716:
	movl	448(%ebx), %eax
	subl	$8, %esp
	pushl	$1
	pushl	%eax
	call	shutdown
	addl	$16, %esp
	movl	8(%ebp), %eax
	addl	$8, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L717
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_load4
.L717:
	movl	8(%ebp), %eax
	movl	8(%eax), %ebx
	leal	448(%ebx), %eax
	movl	%eax, %ecx
	movl	%ecx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %edx
	testb	%dl, %dl
	setne	%al
	movl	%eax, %esi
	movl	%ecx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	setge	%al
	andl	%esi, %eax
	testb	%al, %al
	je	.L718
	subl	$12, %esp
	pushl	%ecx
	call	__asan_report_load4
.L718:
	movl	448(%ebx), %eax
	subl	$4, %esp
	pushl	$0
	pushl	8(%ebp)
	pushl	%eax
	call	fdwatch_add_fd
	addl	$16, %esp
	movl	8(%ebp), %eax
	movl	-124(%ebp), %esi
	movl	%eax, -64(%esi)
	movl	8(%ebp), %eax
	addl	$76, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L719
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_load4
.L719:
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	testl	%eax, %eax
	je	.L720
	subl	$8, %esp
	pushl	$.LC135
	pushl	$3
	call	syslog
	addl	$16, %esp
.L720:
	subl	$12, %esp
	pushl	$0
	pushl	$500
	movl	-124(%ebp), %eax
	pushl	-64(%eax)
	pushl	$linger_clear_connection
	pushl	12(%ebp)
	call	tmr_create
	addl	$32, %esp
	movl	%eax, %ebx
	movl	8(%ebp), %eax
	addl	$76, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%al
	movl	%eax, %esi
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%esi, %eax
	testb	%al, %al
	je	.L721
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_store4
.L721:
	movl	8(%ebp), %eax
	movl	%ebx, 76(%eax)
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	testl	%eax, %eax
	jne	.L698
	subl	$8, %esp
	pushl	$.LC136
	pushl	$2
	call	syslog
	addl	$16, %esp
	call	__asan_handle_no_return
	subl	$12, %esp
	pushl	$1
	call	exit
.L710:
	subl	$8, %esp
	pushl	12(%ebp)
	pushl	8(%ebp)
	call	really_clear_connection
	addl	$16, %esp
.L698:
	cmpl	%edi, -132(%ebp)
	je	.L696
	movl	$1172321806, (%edi)
	movl	-128(%ebp), %eax
	movl	$-168430091, 536870912(%eax)
	movl	$-168430091, 536870916(%eax)
	movl	$-168430091, 536870920(%eax)
	jmp	.L697
.L696:
	movl	-128(%ebp), %eax
	movl	$0, 536870912(%eax)
	movl	$0, 536870916(%eax)
	movl	$0, 536870920(%eax)
.L697:
	leal	-12(%ebp), %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE25:
	.size	clear_connection, .-clear_connection
	.type	really_clear_connection, @function
really_clear_connection:
.LASANPC26:
.LFB26:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%esi
	pushl	%ebx
	.cfi_offset 6, -12
	.cfi_offset 3, -16
	movl	8(%ebp), %eax
	addl	$8, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L724
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L724:
	movl	8(%ebp), %eax
	movl	8(%eax), %edx
	leal	168(%edx), %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%esi, %ecx
	testb	%cl, %cl
	je	.L725
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L725:
	movl	168(%edx), %edx
	movl	stats_bytes, %eax
	addl	%edx, %eax
	movl	%eax, stats_bytes
	movl	8(%ebp), %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L726
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L726:
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$3, %eax
	je	.L727
	movl	8(%ebp), %eax
	movl	8(%eax), %edx
	leal	448(%edx), %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%esi, %ecx
	testb	%cl, %cl
	je	.L728
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L728:
	movl	448(%edx), %eax
	subl	$12, %esp
	pushl	%eax
	call	fdwatch_del_fd
	addl	$16, %esp
.L727:
	movl	8(%ebp), %eax
	addl	$8, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L729
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L729:
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	subl	$8, %esp
	pushl	12(%ebp)
	pushl	%eax
	call	httpd_close_conn
	addl	$16, %esp
	subl	$8, %esp
	pushl	12(%ebp)
	pushl	8(%ebp)
	call	clear_throttles
	addl	$16, %esp
	movl	8(%ebp), %eax
	addl	$76, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L730
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L730:
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	testl	%eax, %eax
	je	.L731
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	subl	$12, %esp
	pushl	%eax
	call	tmr_cancel
	addl	$16, %esp
	movl	8(%ebp), %eax
	addl	$76, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L732
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_store4
.L732:
	movl	8(%ebp), %eax
	movl	$0, 76(%eax)
.L731:
	movl	8(%ebp), %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L733
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_store4
.L733:
	movl	8(%ebp), %eax
	movl	$0, (%eax)
	movl	first_free_connect, %ecx
	movl	8(%ebp), %eax
	addl	$4, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L734
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_store4
.L734:
	movl	8(%ebp), %eax
	movl	%ecx, 4(%eax)
	movl	8(%ebp), %edx
	movl	connects, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	sarl	$5, %eax
	imull	$-1431655765, %eax, %eax
	movl	%eax, first_free_connect
	movl	num_connects, %eax
	subl	$1, %eax
	movl	%eax, num_connects
	leal	-8(%ebp), %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE26:
	.size	really_clear_connection, .-really_clear_connection
	.section	.rodata
	.align 32
.LC137:
	.string	"%.80s connection timed out reading"
	.zero	61
	.align 32
.LC138:
	.string	"%.80s connection timed out sending"
	.zero	61
	.text
	.type	idle, @function
idle:
.LASANPC27:
.LFB27:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$44, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	movl	$0, -32(%ebp)
	jmp	.L736
.L752:
	movl	connects, %ecx
	movl	-32(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$5, %eax
	addl	%ecx, %eax
	movl	%eax, -28(%ebp)
	movl	-28(%ebp), %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L737
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L737:
	movl	-28(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$1, %eax
	je	.L739
	cmpl	$1, %eax
	jl	.L738
	cmpl	$3, %eax
	jg	.L738
	jmp	.L753
.L739:
	movl	12(%ebp), %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L741
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L741:
	movl	12(%ebp), %eax
	movl	(%eax), %ecx
	movl	-28(%ebp), %eax
	addl	$68, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L742
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L742:
	movl	-28(%ebp), %eax
	movl	68(%eax), %eax
	subl	%eax, %ecx
	movl	%ecx, %eax
	cmpl	$59, %eax
	jle	.L743
	movl	-28(%ebp), %eax
	addl	$8, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L744
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L744:
	movl	-28(%ebp), %eax
	movl	8(%eax), %eax
	addl	$8, %eax
	subl	$12, %esp
	pushl	%eax
	call	httpd_ntoa
	addl	$16, %esp
	subl	$4, %esp
	pushl	%eax
	pushl	$.LC137
	pushl	$6
	call	syslog
	addl	$16, %esp
	movl	$httpd_err408form, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L745
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L745:
	movl	httpd_err408form, %ebx
	movl	$httpd_err408title, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%cl
	movl	%ecx, %esi
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L746
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L746:
	movl	httpd_err408title, %eax
	movl	%eax, -44(%ebp)
	movl	-28(%ebp), %eax
	addl	$8, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%cl
	movl	%ecx, %edi
	movl	%eax, %esi
	andl	$7, %esi
	addl	$3, %esi
	movl	%esi, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%edi, %edx
	testb	%dl, %dl
	je	.L747
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L747:
	movl	-28(%ebp), %eax
	movl	8(%eax), %eax
	subl	$8, %esp
	pushl	$.LC48
	pushl	%ebx
	pushl	$.LC48
	pushl	-44(%ebp)
	pushl	$408
	pushl	%eax
	call	httpd_send_err
	addl	$32, %esp
	subl	$8, %esp
	pushl	12(%ebp)
	pushl	-28(%ebp)
	call	finish_connection
	addl	$16, %esp
	jmp	.L738
.L743:
	jmp	.L738
.L753:
	movl	12(%ebp), %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L748
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L748:
	movl	12(%ebp), %eax
	movl	(%eax), %ecx
	movl	-28(%ebp), %eax
	addl	$68, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L749
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L749:
	movl	-28(%ebp), %eax
	movl	68(%eax), %eax
	subl	%eax, %ecx
	movl	%ecx, %eax
	cmpl	$299, %eax
	jle	.L750
	movl	-28(%ebp), %eax
	addl	$8, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L751
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L751:
	movl	-28(%ebp), %eax
	movl	8(%eax), %eax
	addl	$8, %eax
	subl	$12, %esp
	pushl	%eax
	call	httpd_ntoa
	addl	$16, %esp
	subl	$4, %esp
	pushl	%eax
	pushl	$.LC138
	pushl	$6
	call	syslog
	addl	$16, %esp
	subl	$8, %esp
	pushl	12(%ebp)
	pushl	-28(%ebp)
	call	clear_connection
	addl	$16, %esp
	jmp	.L754
.L750:
.L754:
	nop
.L738:
	addl	$1, -32(%ebp)
.L736:
	movl	max_connects, %eax
	cmpl	%eax, -32(%ebp)
	jl	.L752
	leal	-12(%ebp), %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE27:
	.size	idle, .-idle
	.type	wakeup_connection, @function
wakeup_connection:
.LASANPC28:
.LFB28:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%esi
	pushl	%ebx
	subl	$16, %esp
	.cfi_offset 6, -12
	.cfi_offset 3, -16
	leal	8(%ebp), %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L756
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L756:
	movl	8(%ebp), %eax
	movl	%eax, -12(%ebp)
	movl	-12(%ebp), %eax
	addl	$72, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L757
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_store4
.L757:
	movl	-12(%ebp), %eax
	movl	$0, 72(%eax)
	movl	-12(%ebp), %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L758
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L758:
	movl	-12(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$3, %eax
	jne	.L755
	movl	-12(%ebp), %eax
	movl	$2, (%eax)
	movl	-12(%ebp), %eax
	addl	$8, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L760
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L760:
	movl	-12(%ebp), %eax
	movl	8(%eax), %edx
	leal	448(%edx), %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%esi, %ecx
	testb	%cl, %cl
	je	.L761
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L761:
	movl	448(%edx), %eax
	subl	$4, %esp
	pushl	$1
	pushl	-12(%ebp)
	pushl	%eax
	call	fdwatch_add_fd
	addl	$16, %esp
.L755:
	leal	-8(%ebp), %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE28:
	.size	wakeup_connection, .-wakeup_connection
	.type	linger_clear_connection, @function
linger_clear_connection:
.LASANPC29:
.LFB29:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$20, %esp
	.cfi_offset 3, -12
	leal	8(%ebp), %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L763
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_load4
.L763:
	movl	8(%ebp), %eax
	movl	%eax, -12(%ebp)
	movl	-12(%ebp), %eax
	addl	$76, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L764
	subl	$12, %esp
	pushl	%eax
	call	__asan_report_store4
.L764:
	movl	-12(%ebp), %eax
	movl	$0, 76(%eax)
	subl	$8, %esp
	pushl	12(%ebp)
	pushl	-12(%ebp)
	call	really_clear_connection
	addl	$16, %esp
	movl	-4(%ebp), %ebx
	leave
	.cfi_restore 5
	.cfi_restore 3
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE29:
	.size	linger_clear_connection, .-linger_clear_connection
	.type	occasional, @function
occasional:
.LASANPC30:
.LFB30:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$8, %esp
	subl	$12, %esp
	pushl	12(%ebp)
	call	mmc_cleanup
	addl	$16, %esp
	call	tmr_cleanup
	movl	$1, watchdog_flag
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE30:
	.size	occasional, .-occasional
	.type	show_stats, @function
show_stats:
.LASANPC31:
.LFB31:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$8, %esp
	subl	$12, %esp
	pushl	12(%ebp)
	call	logstats
	addl	$16, %esp
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE31:
	.size	show_stats, .-show_stats
	.section	.rodata
	.align 32
.LC139:
	.string	"up %ld seconds, stats for %ld seconds:"
	.zero	57
	.text
	.type	logstats, @function
logstats:
.LASANPC32:
.LFB32:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$140, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	leal	-120(%ebp), %ebx
	movl	%ebx, -140(%ebp)
	cmpl	$0, __asan_option_detect_stack_use_after_return
	je	.L767
	subl	$8, %esp
	pushl	%ebx
	pushl	$96
	call	__asan_stack_malloc_1
	addl	$16, %esp
	movl	%eax, %ebx
.L767:
	leal	96(%ebx), %eax
	movl	%eax, %edi
	movl	$1102416563, (%ebx)
	movl	$.LC121, 4(%ebx)
	movl	$.LASANPC32, 8(%ebx)
	movl	%ebx, %esi
	shrl	$3, %esi
	movl	$-235802127, 536870912(%esi)
	movl	$-185273344, 536870916(%esi)
	movl	$-202116109, 536870920(%esi)
	cmpl	$0, 8(%ebp)
	jne	.L771
	subl	$8, %esp
	pushl	$0
	leal	-64(%edi), %eax
	pushl	%eax
	call	gettimeofday
	addl	$16, %esp
	leal	-64(%edi), %eax
	movl	%eax, 8(%ebp)
.L771:
	movl	8(%ebp), %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%al
	movl	%eax, %edi
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%edi, %eax
	testb	%al, %al
	je	.L772
	subl	$12, %esp
	pushl	%edx
	call	__asan_report_load4
.L772:
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -128(%ebp)
	movl	start_time, %eax
	movl	-128(%ebp), %edx
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, -124(%ebp)
	movl	stats_time, %eax
	movl	-128(%ebp), %edx
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, -132(%ebp)
	cmpl	$0, -132(%ebp)
	jne	.L773
	movl	$1, -132(%ebp)
.L773:
	movl	-128(%ebp), %eax
	movl	%eax, stats_time
	pushl	-132(%ebp)
	pushl	-124(%ebp)
	pushl	$.LC139
	pushl	$6
	call	syslog
	addl	$16, %esp
	subl	$12, %esp
	pushl	-132(%ebp)
	call	thttpd_logstats
	addl	$16, %esp
	subl	$12, %esp
	pushl	-132(%ebp)
	call	httpd_logstats
	addl	$16, %esp
	subl	$12, %esp
	pushl	-132(%ebp)
	call	mmc_logstats
	addl	$16, %esp
	subl	$12, %esp
	pushl	-132(%ebp)
	call	fdwatch_logstats
	addl	$16, %esp
	subl	$12, %esp
	pushl	-132(%ebp)
	call	tmr_logstats
	addl	$16, %esp
	cmpl	%ebx, -140(%ebp)
	je	.L768
	movl	$1172321806, (%ebx)
	movl	$-168430091, 536870912(%esi)
	movl	$-168430091, 536870916(%esi)
	movl	$-168430091, 536870920(%esi)
	jmp	.L769
.L768:
	movl	$0, 536870912(%esi)
	movl	$0, 536870916(%esi)
	movl	$0, 536870920(%esi)
.L769:
	leal	-12(%ebp), %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE32:
	.size	logstats, .-logstats
	.section	.rodata
	.align 32
.LC140:
	.string	"  thttpd - %ld connections (%g/sec), %d max simultaneous, %lld bytes (%g/sec), %d httpd_conns allocated"
	.zero	56
	.text
	.type	thttpd_logstats, @function
thttpd_logstats:
.LASANPC33:
.LFB33:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%esi
	pushl	%ebx
	subl	$16, %esp
	.cfi_offset 6, -12
	.cfi_offset 3, -16
	cmpl	$0, 8(%ebp)
	jle	.L775
	movl	httpd_conn_count, %esi
	movl	stats_bytes, %eax
	movl	%eax, -12(%ebp)
	fildl	-12(%ebp)
	fildl	8(%ebp)
	fdivrp	%st, %st(1)
	movl	stats_bytes, %eax
	cltd
	movl	stats_simultaneous, %ebx
	movl	stats_connections, %ecx
	movl	%ecx, -12(%ebp)
	fildl	-12(%ebp)
	fildl	8(%ebp)
	fdivrp	%st, %st(1)
	fxch	%st(1)
	movl	stats_connections, %ecx
	subl	$4, %esp
	pushl	%esi
	leal	-8(%esp), %esp
	fstpl	(%esp)
	pushl	%edx
	pushl	%eax
	pushl	%ebx
	leal	-8(%esp), %esp
	fstpl	(%esp)
	pushl	%ecx
	pushl	$.LC140
	pushl	$6
	call	syslog
	addl	$48, %esp
.L775:
	movl	$0, stats_connections
	movl	$0, stats_bytes
	movl	$0, stats_simultaneous
	leal	-8(%ebp), %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE33:
	.size	thttpd_logstats, .-thttpd_logstats
	.section	.rodata
.LC142:
	.string	"watchdog_flag"
.LC143:
	.string	"thttpd.c"
.LC144:
	.string	"got_usr1"
.LC145:
	.string	"got_hup"
.LC146:
	.string	"terminate"
.LC147:
	.string	"hs"
.LC148:
	.string	"httpd_conn_count"
.LC149:
	.string	"first_free_connect"
.LC150:
	.string	"max_connects"
.LC151:
	.string	"num_connects"
.LC152:
	.string	"connects"
.LC153:
	.string	"maxthrottles"
.LC154:
	.string	"numthrottles"
.LC155:
	.string	"hostname"
.LC156:
	.string	"throttlefile"
.LC157:
	.string	"local_pattern"
.LC158:
	.string	"no_empty_referers"
.LC159:
	.string	"url_pattern"
.LC160:
	.string	"cgi_limit"
.LC161:
	.string	"cgi_pattern"
.LC162:
	.string	"do_global_passwd"
.LC163:
	.string	"do_vhost"
.LC164:
	.string	"no_symlink_check"
.LC165:
	.string	"no_log"
.LC166:
	.string	"do_chroot"
.LC167:
	.string	"argv0"
.LC168:
	.string	"*.LC138"
.LC169:
	.string	"*.LC20"
.LC170:
	.string	"*.LC97"
.LC171:
	.string	"*.LC6"
.LC172:
	.string	"*.LC41"
.LC173:
	.string	"*.LC118"
.LC174:
	.string	"*.LC119"
.LC175:
	.string	"*.LC107"
.LC176:
	.string	"*.LC132"
.LC177:
	.string	"*.LC33"
.LC178:
	.string	"*.LC36"
.LC179:
	.string	"*.LC69"
.LC180:
	.string	"*.LC93"
.LC181:
	.string	"*.LC60"
.LC182:
	.string	"*.LC115"
.LC183:
	.string	"*.LC10"
.LC184:
	.string	"*.LC5"
.LC185:
	.string	"*.LC54"
.LC186:
	.string	"*.LC27"
.LC187:
	.string	"*.LC34"
.LC188:
	.string	"*.LC94"
.LC189:
	.string	"*.LC28"
.LC190:
	.string	"*.LC90"
.LC191:
	.string	"*.LC40"
.LC192:
	.string	"*.LC55"
.LC193:
	.string	"*.LC103"
.LC194:
	.string	"*.LC110"
.LC195:
	.string	"*.LC87"
.LC196:
	.string	"*.LC73"
.LC197:
	.string	"*.LC134"
.LC198:
	.string	"*.LC62"
.LC199:
	.string	"*.LC112"
.LC200:
	.string	"*.LC114"
.LC201:
	.string	"*.LC116"
.LC202:
	.string	"*.LC19"
.LC203:
	.string	"*.LC89"
.LC204:
	.string	"*.LC98"
.LC205:
	.string	"*.LC49"
.LC206:
	.string	"*.LC56"
.LC207:
	.string	"*.LC99"
.LC208:
	.string	"*.LC22"
.LC209:
	.string	"*.LC61"
.LC210:
	.string	"*.LC88"
.LC211:
	.string	"*.LC21"
.LC212:
	.string	"*.LC7"
.LC213:
	.string	"*.LC42"
.LC214:
	.string	"*.LC25"
.LC215:
	.string	"*.LC2"
.LC216:
	.string	"*.LC39"
.LC217:
	.string	"*.LC47"
.LC218:
	.string	"*.LC109"
.LC219:
	.string	"*.LC32"
.LC220:
	.string	"*.LC101"
.LC221:
	.string	"*.LC128"
.LC222:
	.string	"*.LC13"
.LC223:
	.string	"*.LC83"
.LC224:
	.string	"*.LC50"
.LC225:
	.string	"*.LC31"
.LC226:
	.string	"*.LC12"
.LC227:
	.string	"*.LC45"
.LC228:
	.string	"*.LC79"
.LC229:
	.string	"*.LC72"
.LC230:
	.string	"*.LC125"
.LC231:
	.string	"*.LC66"
.LC232:
	.string	"*.LC63"
.LC233:
	.string	"*.LC64"
.LC234:
	.string	"*.LC17"
.LC235:
	.string	"*.LC75"
.LC236:
	.string	"*.LC24"
.LC237:
	.string	"*.LC23"
.LC238:
	.string	"*.LC140"
.LC239:
	.string	"*.LC117"
.LC240:
	.string	"*.LC26"
.LC241:
	.string	"*.LC105"
.LC242:
	.string	"*.LC29"
.LC243:
	.string	"*.LC76"
.LC244:
	.string	"*.LC67"
.LC245:
	.string	"*.LC80"
.LC246:
	.string	"*.LC100"
.LC247:
	.string	"*.LC65"
.LC248:
	.string	"*.LC84"
.LC249:
	.string	"*.LC8"
.LC250:
	.string	"*.LC91"
.LC251:
	.string	"*.LC48"
.LC252:
	.string	"*.LC30"
.LC253:
	.string	"*.LC111"
.LC254:
	.string	"*.LC129"
.LC255:
	.string	"*.LC43"
.LC256:
	.string	"*.LC137"
.LC257:
	.string	"*.LC15"
.LC258:
	.string	"*.LC139"
.LC259:
	.string	"*.LC78"
.LC260:
	.string	"*.LC70"
.LC261:
	.string	"*.LC120"
.LC262:
	.string	"*.LC53"
.LC263:
	.string	"*.LC68"
.LC264:
	.string	"*.LC57"
.LC265:
	.string	"*.LC136"
.LC266:
	.string	"*.LC131"
.LC267:
	.string	"*.LC44"
.LC268:
	.string	"*.LC133"
.LC269:
	.string	"*.LC135"
.LC270:
	.string	"*.LC104"
.LC271:
	.string	"*.LC38"
.LC272:
	.string	"*.LC37"
.LC273:
	.string	"*.LC127"
.LC274:
	.string	"*.LC3"
.LC275:
	.string	"*.LC81"
.LC276:
	.string	"*.LC58"
.LC277:
	.string	"*.LC4"
.LC278:
	.string	"*.LC18"
.LC279:
	.string	"*.LC14"
.LC280:
	.string	"*.LC123"
.LC281:
	.string	"*.LC92"
.LC282:
	.string	"*.LC35"
.LC283:
	.string	"*.LC102"
.LC284:
	.string	"*.LC85"
.LC285:
	.string	"*.LC124"
.LC286:
	.string	"*.LC0"
.LC287:
	.string	"*.LC51"
.LC288:
	.string	"*.LC71"
.LC289:
	.string	"*.LC96"
.LC290:
	.string	"*.LC52"
.LC291:
	.string	"*.LC59"
.LC292:
	.string	"*.LC95"
.LC293:
	.string	"*.LC86"
.LC294:
	.string	"*.LC106"
.LC295:
	.string	"*.LC46"
.LC296:
	.string	"*.LC11"
.LC297:
	.string	"*.LC82"
.LC298:
	.string	"*.LC16"
.LC299:
	.string	"*.LC77"
	.data
	.align 64
	.type	.LASAN0, @object
	.size	.LASAN0, 4032
.LASAN0:
	.long	watchdog_flag
	.long	4
	.long	64
	.long	.LC142
	.long	.LC143
	.long	0
	.long	got_usr1
	.long	4
	.long	64
	.long	.LC144
	.long	.LC143
	.long	0
	.long	got_hup
	.long	4
	.long	64
	.long	.LC145
	.long	.LC143
	.long	0
	.long	terminate
	.long	4
	.long	64
	.long	.LC146
	.long	.LC143
	.long	0
	.long	hs
	.long	4
	.long	64
	.long	.LC147
	.long	.LC143
	.long	0
	.long	httpd_conn_count
	.long	4
	.long	64
	.long	.LC148
	.long	.LC143
	.long	0
	.long	first_free_connect
	.long	4
	.long	64
	.long	.LC149
	.long	.LC143
	.long	0
	.long	max_connects
	.long	4
	.long	64
	.long	.LC150
	.long	.LC143
	.long	0
	.long	num_connects
	.long	4
	.long	64
	.long	.LC151
	.long	.LC143
	.long	0
	.long	connects
	.long	4
	.long	64
	.long	.LC152
	.long	.LC143
	.long	0
	.long	maxthrottles
	.long	4
	.long	64
	.long	.LC153
	.long	.LC143
	.long	0
	.long	numthrottles
	.long	4
	.long	64
	.long	.LC154
	.long	.LC143
	.long	0
	.long	throttles
	.long	4
	.long	64
	.long	.LC92
	.long	.LC143
	.long	0
	.long	max_age
	.long	4
	.long	64
	.long	.LC102
	.long	.LC143
	.long	0
	.long	p3p
	.long	4
	.long	64
	.long	.LC101
	.long	.LC143
	.long	0
	.long	charset
	.long	4
	.long	64
	.long	.LC100
	.long	.LC143
	.long	0
	.long	user
	.long	4
	.long	64
	.long	.LC86
	.long	.LC143
	.long	0
	.long	pidfile
	.long	4
	.long	64
	.long	.LC99
	.long	.LC143
	.long	0
	.long	hostname
	.long	4
	.long	64
	.long	.LC155
	.long	.LC143
	.long	0
	.long	throttlefile
	.long	4
	.long	64
	.long	.LC156
	.long	.LC143
	.long	0
	.long	logfile
	.long	4
	.long	64
	.long	.LC94
	.long	.LC143
	.long	0
	.long	local_pattern
	.long	4
	.long	64
	.long	.LC157
	.long	.LC143
	.long	0
	.long	no_empty_referers
	.long	4
	.long	64
	.long	.LC158
	.long	.LC143
	.long	0
	.long	url_pattern
	.long	4
	.long	64
	.long	.LC159
	.long	.LC143
	.long	0
	.long	cgi_limit
	.long	4
	.long	64
	.long	.LC160
	.long	.LC143
	.long	0
	.long	cgi_pattern
	.long	4
	.long	64
	.long	.LC161
	.long	.LC143
	.long	0
	.long	do_global_passwd
	.long	4
	.long	64
	.long	.LC162
	.long	.LC143
	.long	0
	.long	do_vhost
	.long	4
	.long	64
	.long	.LC163
	.long	.LC143
	.long	0
	.long	no_symlink_check
	.long	4
	.long	64
	.long	.LC164
	.long	.LC143
	.long	0
	.long	no_log
	.long	4
	.long	64
	.long	.LC165
	.long	.LC143
	.long	0
	.long	do_chroot
	.long	4
	.long	64
	.long	.LC166
	.long	.LC143
	.long	0
	.long	data_dir
	.long	4
	.long	64
	.long	.LC81
	.long	.LC143
	.long	0
	.long	dir
	.long	4
	.long	64
	.long	.LC79
	.long	.LC143
	.long	0
	.long	port
	.long	2
	.long	64
	.long	.LC78
	.long	.LC143
	.long	0
	.long	debug
	.long	4
	.long	64
	.long	.LC77
	.long	.LC143
	.long	0
	.long	argv0
	.long	4
	.long	64
	.long	.LC167
	.long	.LC143
	.long	0
	.long	.LC138
	.long	35
	.long	96
	.long	.LC168
	.long	.LC143
	.long	0
	.long	.LC20
	.long	11
	.long	64
	.long	.LC169
	.long	.LC143
	.long	0
	.long	.LC97
	.long	13
	.long	64
	.long	.LC170
	.long	.LC143
	.long	0
	.long	.LC6
	.long	19
	.long	64
	.long	.LC171
	.long	.LC143
	.long	0
	.long	.LC41
	.long	16
	.long	64
	.long	.LC172
	.long	.LC143
	.long	0
	.long	.LC118
	.long	3
	.long	64
	.long	.LC173
	.long	.LC143
	.long	0
	.long	.LC119
	.long	39
	.long	96
	.long	.LC174
	.long	.LC143
	.long	0
	.long	.LC107
	.long	36
	.long	96
	.long	.LC175
	.long	.LC143
	.long	0
	.long	.LC132
	.long	70
	.long	128
	.long	.LC176
	.long	.LC143
	.long	0
	.long	.LC33
	.long	20
	.long	64
	.long	.LC177
	.long	.LC143
	.long	0
	.long	.LC36
	.long	24
	.long	64
	.long	.LC178
	.long	.LC143
	.long	0
	.long	.LC69
	.long	3
	.long	64
	.long	.LC179
	.long	.LC143
	.long	0
	.long	.LC93
	.long	5
	.long	64
	.long	.LC180
	.long	.LC143
	.long	0
	.long	.LC60
	.long	3
	.long	64
	.long	.LC181
	.long	.LC143
	.long	0
	.long	.LC115
	.long	16
	.long	64
	.long	.LC182
	.long	.LC143
	.long	0
	.long	.LC10
	.long	29
	.long	64
	.long	.LC183
	.long	.LC143
	.long	0
	.long	.LC5
	.long	2
	.long	64
	.long	.LC184
	.long	.LC143
	.long	0
	.long	.LC54
	.long	3
	.long	64
	.long	.LC185
	.long	.LC143
	.long	0
	.long	.LC27
	.long	12
	.long	64
	.long	.LC186
	.long	.LC143
	.long	0
	.long	.LC34
	.long	15
	.long	64
	.long	.LC187
	.long	.LC143
	.long	0
	.long	.LC94
	.long	8
	.long	64
	.long	.LC188
	.long	.LC143
	.long	0
	.long	.LC28
	.long	7
	.long	64
	.long	.LC189
	.long	.LC143
	.long	0
	.long	.LC90
	.long	16
	.long	64
	.long	.LC190
	.long	.LC143
	.long	0
	.long	.LC40
	.long	12
	.long	64
	.long	.LC191
	.long	.LC143
	.long	0
	.long	.LC55
	.long	5
	.long	64
	.long	.LC192
	.long	.LC143
	.long	0
	.long	.LC103
	.long	32
	.long	64
	.long	.LC193
	.long	.LC143
	.long	0
	.long	.LC110
	.long	26
	.long	64
	.long	.LC194
	.long	.LC143
	.long	0
	.long	.LC87
	.long	7
	.long	64
	.long	.LC195
	.long	.LC143
	.long	0
	.long	.LC73
	.long	219
	.long	256
	.long	.LC196
	.long	.LC143
	.long	0
	.long	.LC134
	.long	65
	.long	128
	.long	.LC197
	.long	.LC143
	.long	0
	.long	.LC62
	.long	3
	.long	64
	.long	.LC198
	.long	.LC143
	.long	0
	.long	.LC112
	.long	39
	.long	96
	.long	.LC199
	.long	.LC143
	.long	0
	.long	.LC114
	.long	20
	.long	64
	.long	.LC200
	.long	.LC143
	.long	0
	.long	.LC116
	.long	33
	.long	96
	.long	.LC201
	.long	.LC143
	.long	0
	.long	.LC19
	.long	15
	.long	64
	.long	.LC202
	.long	.LC143
	.long	0
	.long	.LC89
	.long	7
	.long	64
	.long	.LC203
	.long	.LC143
	.long	0
	.long	.LC98
	.long	15
	.long	64
	.long	.LC204
	.long	.LC143
	.long	0
	.long	.LC49
	.long	3
	.long	64
	.long	.LC205
	.long	.LC143
	.long	0
	.long	.LC56
	.long	4
	.long	64
	.long	.LC206
	.long	.LC143
	.long	0
	.long	.LC99
	.long	8
	.long	64
	.long	.LC207
	.long	.LC143
	.long	0
	.long	.LC22
	.long	2
	.long	64
	.long	.LC208
	.long	.LC143
	.long	0
	.long	.LC61
	.long	3
	.long	64
	.long	.LC209
	.long	.LC143
	.long	0
	.long	.LC88
	.long	9
	.long	64
	.long	.LC210
	.long	.LC143
	.long	0
	.long	.LC21
	.long	6
	.long	64
	.long	.LC211
	.long	.LC143
	.long	0
	.long	.LC7
	.long	2
	.long	64
	.long	.LC212
	.long	.LC143
	.long	0
	.long	.LC42
	.long	12
	.long	64
	.long	.LC213
	.long	.LC143
	.long	0
	.long	.LC25
	.long	4
	.long	64
	.long	.LC214
	.long	.LC143
	.long	0
	.long	.LC2
	.long	16
	.long	64
	.long	.LC215
	.long	.LC143
	.long	0
	.long	.LC39
	.long	15
	.long	64
	.long	.LC216
	.long	.LC143
	.long	0
	.long	.LC47
	.long	11
	.long	64
	.long	.LC217
	.long	.LC143
	.long	0
	.long	.LC109
	.long	3
	.long	64
	.long	.LC218
	.long	.LC143
	.long	0
	.long	.LC32
	.long	13
	.long	64
	.long	.LC219
	.long	.LC143
	.long	0
	.long	.LC101
	.long	4
	.long	64
	.long	.LC220
	.long	.LC143
	.long	0
	.long	.LC128
	.long	37
	.long	96
	.long	.LC221
	.long	.LC143
	.long	0
	.long	.LC13
	.long	25
	.long	64
	.long	.LC222
	.long	.LC143
	.long	0
	.long	.LC83
	.long	10
	.long	64
	.long	.LC223
	.long	.LC143
	.long	0
	.long	.LC50
	.long	28
	.long	64
	.long	.LC224
	.long	.LC143
	.long	0
	.long	.LC31
	.long	18
	.long	64
	.long	.LC225
	.long	.LC143
	.long	0
	.long	.LC12
	.long	23
	.long	64
	.long	.LC226
	.long	.LC143
	.long	0
	.long	.LC45
	.long	13
	.long	64
	.long	.LC227
	.long	.LC143
	.long	0
	.long	.LC79
	.long	4
	.long	64
	.long	.LC228
	.long	.LC143
	.long	0
	.long	.LC72
	.long	3
	.long	64
	.long	.LC229
	.long	.LC143
	.long	0
	.long	.LC125
	.long	39
	.long	96
	.long	.LC230
	.long	.LC143
	.long	0
	.long	.LC66
	.long	3
	.long	64
	.long	.LC231
	.long	.LC143
	.long	0
	.long	.LC63
	.long	3
	.long	64
	.long	.LC232
	.long	.LC143
	.long	0
	.long	.LC64
	.long	3
	.long	64
	.long	.LC233
	.long	.LC143
	.long	0
	.long	.LC17
	.long	72
	.long	128
	.long	.LC234
	.long	.LC143
	.long	0
	.long	.LC75
	.long	2
	.long	64
	.long	.LC235
	.long	.LC143
	.long	0
	.long	.LC24
	.long	2
	.long	64
	.long	.LC236
	.long	.LC143
	.long	0
	.long	.LC23
	.long	12
	.long	64
	.long	.LC237
	.long	.LC143
	.long	0
	.long	.LC140
	.long	104
	.long	160
	.long	.LC238
	.long	.LC143
	.long	0
	.long	.LC117
	.long	38
	.long	96
	.long	.LC239
	.long	.LC143
	.long	0
	.long	.LC26
	.long	31
	.long	64
	.long	.LC240
	.long	.LC143
	.long	0
	.long	.LC105
	.long	37
	.long	96
	.long	.LC241
	.long	.LC143
	.long	0
	.long	.LC29
	.long	74
	.long	128
	.long	.LC242
	.long	.LC143
	.long	0
	.long	.LC76
	.long	5
	.long	64
	.long	.LC243
	.long	.LC143
	.long	0
	.long	.LC67
	.long	5
	.long	64
	.long	.LC244
	.long	.LC143
	.long	0
	.long	.LC80
	.long	9
	.long	64
	.long	.LC245
	.long	.LC143
	.long	0
	.long	.LC100
	.long	8
	.long	64
	.long	.LC246
	.long	.LC143
	.long	0
	.long	.LC65
	.long	5
	.long	64
	.long	.LC247
	.long	.LC143
	.long	0
	.long	.LC84
	.long	9
	.long	64
	.long	.LC248
	.long	.LC143
	.long	0
	.long	.LC8
	.long	22
	.long	64
	.long	.LC249
	.long	.LC143
	.long	0
	.long	.LC91
	.long	9
	.long	64
	.long	.LC250
	.long	.LC143
	.long	0
	.long	.LC48
	.long	1
	.long	64
	.long	.LC251
	.long	.LC143
	.long	0
	.long	.LC30
	.long	79
	.long	128
	.long	.LC252
	.long	.LC143
	.long	0
	.long	.LC111
	.long	25
	.long	64
	.long	.LC253
	.long	.LC143
	.long	0
	.long	.LC129
	.long	25
	.long	64
	.long	.LC254
	.long	.LC143
	.long	0
	.long	.LC43
	.long	58
	.long	96
	.long	.LC255
	.long	.LC143
	.long	0
	.long	.LC137
	.long	35
	.long	96
	.long	.LC256
	.long	.LC143
	.long	0
	.long	.LC15
	.long	11
	.long	64
	.long	.LC257
	.long	.LC143
	.long	0
	.long	.LC139
	.long	39
	.long	96
	.long	.LC258
	.long	.LC143
	.long	0
	.long	.LC78
	.long	5
	.long	64
	.long	.LC259
	.long	.LC143
	.long	0
	.long	.LC70
	.long	3
	.long	64
	.long	.LC260
	.long	.LC143
	.long	0
	.long	.LC120
	.long	44
	.long	96
	.long	.LC261
	.long	.LC143
	.long	0
	.long	.LC53
	.long	3
	.long	64
	.long	.LC262
	.long	.LC143
	.long	0
	.long	.LC68
	.long	3
	.long	64
	.long	.LC263
	.long	.LC143
	.long	0
	.long	.LC57
	.long	3
	.long	64
	.long	.LC264
	.long	.LC143
	.long	0
	.long	.LC136
	.long	43
	.long	96
	.long	.LC265
	.long	.LC143
	.long	0
	.long	.LC131
	.long	56
	.long	96
	.long	.LC266
	.long	.LC143
	.long	0
	.long	.LC44
	.long	38
	.long	96
	.long	.LC267
	.long	.LC143
	.long	0
	.long	.LC133
	.long	62
	.long	96
	.long	.LC268
	.long	.LC143
	.long	0
	.long	.LC135
	.long	33
	.long	96
	.long	.LC269
	.long	.LC143
	.long	0
	.long	.LC104
	.long	34
	.long	96
	.long	.LC270
	.long	.LC143
	.long	0
	.long	.LC38
	.long	30
	.long	64
	.long	.LC271
	.long	.LC143
	.long	0
	.long	.LC37
	.long	36
	.long	96
	.long	.LC272
	.long	.LC143
	.long	0
	.long	.LC127
	.long	33
	.long	96
	.long	.LC273
	.long	.LC143
	.long	0
	.long	.LC3
	.long	8
	.long	64
	.long	.LC274
	.long	.LC143
	.long	0
	.long	.LC81
	.long	9
	.long	64
	.long	.LC275
	.long	.LC143
	.long	0
	.long	.LC58
	.long	5
	.long	64
	.long	.LC276
	.long	.LC143
	.long	0
	.long	.LC4
	.long	5
	.long	64
	.long	.LC277
	.long	.LC143
	.long	0
	.long	.LC18
	.long	20
	.long	64
	.long	.LC278
	.long	.LC143
	.long	0
	.long	.LC14
	.long	10
	.long	64
	.long	.LC279
	.long	.LC143
	.long	0
	.long	.LC123
	.long	22
	.long	64
	.long	.LC280
	.long	.LC143
	.long	0
	.long	.LC92
	.long	10
	.long	64
	.long	.LC281
	.long	.LC143
	.long	0
	.long	.LC35
	.long	30
	.long	64
	.long	.LC282
	.long	.LC143
	.long	0
	.long	.LC102
	.long	8
	.long	64
	.long	.LC283
	.long	.LC143
	.long	0
	.long	.LC85
	.long	11
	.long	64
	.long	.LC284
	.long	.LC143
	.long	0
	.long	.LC124
	.long	36
	.long	96
	.long	.LC285
	.long	.LC143
	.long	0
	.long	.LC0
	.long	25
	.long	64
	.long	.LC286
	.long	.LC143
	.long	0
	.long	.LC51
	.long	3
	.long	64
	.long	.LC287
	.long	.LC143
	.long	0
	.long	.LC71
	.long	3
	.long	64
	.long	.LC288
	.long	.LC143
	.long	0
	.long	.LC96
	.long	8
	.long	64
	.long	.LC289
	.long	.LC143
	.long	0
	.long	.LC52
	.long	3
	.long	64
	.long	.LC290
	.long	.LC143
	.long	0
	.long	.LC59
	.long	3
	.long	64
	.long	.LC291
	.long	.LC143
	.long	0
	.long	.LC95
	.long	6
	.long	64
	.long	.LC292
	.long	.LC143
	.long	0
	.long	.LC86
	.long	5
	.long	64
	.long	.LC293
	.long	.LC143
	.long	0
	.long	.LC106
	.long	31
	.long	64
	.long	.LC294
	.long	.LC143
	.long	0
	.long	.LC46
	.long	7
	.long	64
	.long	.LC295
	.long	.LC143
	.long	0
	.long	.LC11
	.long	34
	.long	96
	.long	.LC296
	.long	.LC143
	.long	0
	.long	.LC82
	.long	8
	.long	64
	.long	.LC297
	.long	.LC143
	.long	0
	.long	.LC16
	.long	67
	.long	128
	.long	.LC298
	.long	.LC143
	.long	0
	.long	.LC77
	.long	6
	.long	64
	.long	.LC299
	.long	.LC143
	.long	0
	.text
	.type	_GLOBAL__sub_D_00099_0_terminate, @function
_GLOBAL__sub_D_00099_0_terminate:
.LFB34:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$8, %esp
	subl	$8, %esp
	pushl	$168
	pushl	$.LASAN0
	call	__asan_unregister_globals
	addl	$16, %esp
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE34:
	.size	_GLOBAL__sub_D_00099_0_terminate, .-_GLOBAL__sub_D_00099_0_terminate
	.section	.dtors.65436,"aw",@progbits
	.align 4
	.long	_GLOBAL__sub_D_00099_0_terminate
	.text
	.type	_GLOBAL__sub_I_00099_1_terminate, @function
_GLOBAL__sub_I_00099_1_terminate:
.LFB35:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$8, %esp
	call	__asan_init_v3
	subl	$8, %esp
	pushl	$168
	pushl	$.LASAN0
	call	__asan_register_globals
	addl	$16, %esp
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE35:
	.size	_GLOBAL__sub_I_00099_1_terminate, .-_GLOBAL__sub_I_00099_1_terminate
	.section	.ctors.65436,"aw",@progbits
	.align 4
	.long	_GLOBAL__sub_I_00099_1_terminate
	.ident	"GCC: (GNU) 4.9.0"
	.section	.note.GNU-stack,"",@progbits
