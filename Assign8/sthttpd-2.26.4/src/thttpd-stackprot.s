	.file	"thttpd.c"
	.local	argv0
	.comm	argv0,4,4
	.local	debug
	.comm	debug,4,4
	.local	port
	.comm	port,2,2
	.local	dir
	.comm	dir,4,4
	.local	data_dir
	.comm	data_dir,4,4
	.local	do_chroot
	.comm	do_chroot,4,4
	.local	no_log
	.comm	no_log,4,4
	.local	no_symlink_check
	.comm	no_symlink_check,4,4
	.local	do_vhost
	.comm	do_vhost,4,4
	.local	do_global_passwd
	.comm	do_global_passwd,4,4
	.local	cgi_pattern
	.comm	cgi_pattern,4,4
	.local	cgi_limit
	.comm	cgi_limit,4,4
	.local	url_pattern
	.comm	url_pattern,4,4
	.local	no_empty_referers
	.comm	no_empty_referers,4,4
	.local	local_pattern
	.comm	local_pattern,4,4
	.local	logfile
	.comm	logfile,4,4
	.local	throttlefile
	.comm	throttlefile,4,4
	.local	hostname
	.comm	hostname,4,4
	.local	pidfile
	.comm	pidfile,4,4
	.local	user
	.comm	user,4,4
	.local	charset
	.comm	charset,4,4
	.local	p3p
	.comm	p3p,4,4
	.local	max_age
	.comm	max_age,4,4
	.local	throttles
	.comm	throttles,4,4
	.local	numthrottles
	.comm	numthrottles,4,4
	.local	maxthrottles
	.comm	maxthrottles,4,4
	.local	connects
	.comm	connects,4,4
	.local	num_connects
	.comm	num_connects,4,4
	.local	max_connects
	.comm	max_connects,4,4
	.local	first_free_connect
	.comm	first_free_connect,4,4
	.local	httpd_conn_count
	.comm	httpd_conn_count,4,4
	.local	hs
	.comm	hs,4,4
.globl terminate
	.bss
	.align 4
	.type	terminate, @object
	.size	terminate, 4
terminate:
	.zero	4
	.comm	start_time,4,4
	.comm	stats_time,4,4
	.comm	stats_connections,4,4
	.comm	stats_bytes,4,4
	.comm	stats_simultaneous,4,4
	.local	got_hup
	.comm	got_hup,4,4
	.local	got_usr1
	.comm	got_usr1,4,4
	.local	watchdog_flag
	.comm	watchdog_flag,4,4
	.section	.rodata
.LC0:
	.string	"exiting due to signal %d"
	.text
	.type	handle_term, @function
handle_term:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$24, %esp
	call	shut_down
	movl	8(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	$.LC0, 4(%esp)
	movl	$5, (%esp)
	call	syslog
	call	closelog
	movl	$1, (%esp)
	call	exit
	.size	handle_term, .-handle_term
	.section	.rodata
.LC1:
	.string	"child wait - %m"
	.text
	.type	handle_chld, @function
handle_chld:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$40, %esp
	call	__errno_location
	movl	(%eax), %eax
	movl	%eax, -12(%ebp)
	jmp	.L11
.L15:
	nop
	jmp	.L11
.L16:
	nop
.L11:
	movl	$1, 8(%esp)
	leal	-20(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$-1, (%esp)
	call	waitpid
	movl	%eax, -16(%ebp)
	cmpl	$0, -16(%ebp)
	je	.L13
.L4:
	cmpl	$0, -16(%ebp)
	jns	.L6
	call	__errno_location
	movl	(%eax), %eax
	cmpl	$4, %eax
	je	.L7
	call	__errno_location
	movl	(%eax), %eax
	cmpl	$11, %eax
	jne	.L8
.L7:
	nop
	jmp	.L11
.L8:
	call	__errno_location
	movl	(%eax), %eax
	cmpl	$10, %eax
	je	.L14
	movl	$.LC1, 4(%esp)
	movl	$3, (%esp)
	call	syslog
	jmp	.L5
.L6:
	movl	hs, %eax
	testl	%eax, %eax
	je	.L15
	movl	hs, %eax
	movl	20(%eax), %edx
	subl	$1, %edx
	movl	%edx, 20(%eax)
	movl	hs, %eax
	movl	20(%eax), %eax
	testl	%eax, %eax
	jns	.L16
	movl	hs, %eax
	movl	$0, 20(%eax)
	jmp	.L11
.L13:
	nop
	jmp	.L5
.L14:
	nop
.L5:
	call	__errno_location
	movl	-12(%ebp), %edx
	movl	%edx, (%eax)
	leave
	ret
	.size	handle_chld, .-handle_chld
	.type	handle_hup, @function
handle_hup:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$24, %esp
	call	__errno_location
	movl	(%eax), %eax
	movl	%eax, -12(%ebp)
	movl	$1, got_hup
	call	__errno_location
	movl	-12(%ebp), %edx
	movl	%edx, (%eax)
	leave
	ret
	.size	handle_hup, .-handle_hup
	.section	.rodata
.LC2:
	.string	"exiting"
	.text
	.type	handle_usr1, @function
handle_usr1:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$24, %esp
	movl	num_connects, %eax
	testl	%eax, %eax
	jne	.L20
	call	shut_down
	movl	$.LC2, 4(%esp)
	movl	$5, (%esp)
	call	syslog
	call	closelog
	movl	$0, (%esp)
	call	exit
.L20:
	movl	$1, got_usr1
	leave
	ret
	.size	handle_usr1, .-handle_usr1
	.type	handle_usr2, @function
handle_usr2:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$40, %esp
	call	__errno_location
	movl	(%eax), %eax
	movl	%eax, -12(%ebp)
	movl	$0, (%esp)
	call	logstats
	call	__errno_location
	movl	-12(%ebp), %edx
	movl	%edx, (%eax)
	leave
	ret
	.size	handle_usr2, .-handle_usr2
	.section	.rodata
.LC3:
	.string	"/tmp"
	.text
	.type	handle_alrm, @function
handle_alrm:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$40, %esp
	call	__errno_location
	movl	(%eax), %eax
	movl	%eax, -12(%ebp)
	movl	watchdog_flag, %eax
	testl	%eax, %eax
	jne	.L25
	movl	$.LC3, (%esp)
	call	chdir
	call	abort
.L25:
	movl	$0, watchdog_flag
	movl	$360, (%esp)
	call	alarm
	call	__errno_location
	movl	-12(%ebp), %edx
	movl	%edx, (%eax)
	leave
	ret
	.size	handle_alrm, .-handle_alrm
	.section	.rodata
.LC4:
	.string	"-"
.LC5:
	.string	"re-opening logfile"
.LC6:
	.string	"a"
.LC7:
	.string	"re-opening %.80s - %m"
	.text
	.type	re_open_logfile, @function
re_open_logfile:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$40, %esp
	movl	no_log, %eax
	testl	%eax, %eax
	jne	.L33
	movl	hs, %eax
	testl	%eax, %eax
	je	.L34
.L29:
	movl	logfile, %eax
	testl	%eax, %eax
	je	.L32
	movl	logfile, %eax
	movl	$.LC4, 4(%esp)
	movl	%eax, (%esp)
	call	strcmp
	testl	%eax, %eax
	je	.L32
	movl	$.LC5, 4(%esp)
	movl	$5, (%esp)
	call	syslog
	movl	$.LC6, %edx
	movl	logfile, %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	fopen
	movl	%eax, -12(%ebp)
	cmpl	$0, -12(%ebp)
	jne	.L31
	movl	logfile, %eax
	movl	%eax, 8(%esp)
	movl	$.LC7, 4(%esp)
	movl	$2, (%esp)
	call	syslog
	jmp	.L32
.L31:
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	fileno
	movl	$1, 8(%esp)
	movl	$2, 4(%esp)
	movl	%eax, (%esp)
	call	fcntl
	movl	hs, %eax
	movl	-12(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	httpd_set_logfp
	jmp	.L32
.L33:
	nop
	jmp	.L32
.L34:
	nop
.L32:
	leave
	ret
	.size	re_open_logfile, .-re_open_logfile
	.section	.rodata
.LC8:
	.string	"can't find any valid address"
	.align 4
.LC9:
	.string	"%s: can't find any valid address\n"
.LC10:
	.string	"unknown user - '%.80s'"
.LC11:
	.string	"%s: unknown user - '%s'\n"
.LC12:
	.string	"/dev/null"
.LC13:
	.string	"%.80s - %m"
	.align 4
.LC14:
	.string	"logfile is not an absolute path, you may not be able to re-open it"
	.align 4
.LC15:
	.string	"%s: logfile is not an absolute path, you may not be able to re-open it\n"
.LC16:
	.string	"fchown logfile - %m"
.LC17:
	.string	"fchown logfile"
.LC18:
	.string	"chdir - %m"
.LC19:
	.string	"chdir"
.LC20:
	.string	"/"
.LC21:
	.string	"daemon - %m"
.LC22:
	.string	"w"
.LC23:
	.string	"%d\n"
	.align 4
.LC24:
	.string	"fdwatch initialization failure"
.LC25:
	.string	"chroot - %m"
.LC26:
	.string	"chroot"
	.align 4
.LC27:
	.string	"logfile is not within the chroot tree, you will not be able to re-open it"
	.align 4
.LC28:
	.string	"%s: logfile is not within the chroot tree, you will not be able to re-open it\n"
.LC29:
	.string	"chroot chdir - %m"
.LC30:
	.string	"chroot chdir"
.LC31:
	.string	"data_dir chdir - %m"
.LC32:
	.string	"data_dir chdir"
.LC33:
	.string	"tmr_create(occasional) failed"
.LC34:
	.string	"tmr_create(idle) failed"
	.align 4
.LC35:
	.string	"tmr_create(update_throttles) failed"
.LC36:
	.string	"tmr_create(show_stats) failed"
.LC37:
	.string	"setgroups - %m"
.LC38:
	.string	"setgid - %m"
.LC39:
	.string	"initgroups - %m"
.LC40:
	.string	"setuid - %m"
	.align 4
.LC41:
	.string	"started as root without requesting chroot(), warning only"
	.align 4
.LC42:
	.string	"out of memory allocating a connecttab"
.LC43:
	.string	"fdwatch - %m"
	.text
.globl main
	.type	main, @function
main:
	pushl	%ebp
	movl	%esp, %ebp
	andl	$-16, %esp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$4548, %esp
	movl	12(%ebp), %eax
	movl	%eax, 124(%esp)
	movl	%gs:20, %eax
	movl	%eax, 4540(%esp)
	xorl	%eax, %eax
	movl	$32767, 172(%esp)
	movl	$32767, 168(%esp)
	movl	124(%esp), %eax
	movl	(%eax), %eax
	movl	%eax, argv0
	movl	argv0, %eax
	movl	$47, 4(%esp)
	movl	%eax, (%esp)
	call	strrchr
	movl	%eax, 180(%esp)
	cmpl	$0, 180(%esp)
	je	.L36
	addl	$1, 180(%esp)
	jmp	.L37
.L36:
	movl	argv0, %eax
	movl	%eax, 180(%esp)
.L37:
	movl	$24, 8(%esp)
	movl	$9, 4(%esp)
	movl	180(%esp), %eax
	movl	%eax, (%esp)
	call	openlog
	movl	124(%esp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	parse_args
	call	tzset
	leal	140(%esp), %eax
	movl	%eax, 20(%esp)
	movl	$128, 16(%esp)
	leal	4284(%esp), %eax
	movl	%eax, 12(%esp)
	leal	144(%esp), %eax
	movl	%eax, 8(%esp)
	movl	$128, 4(%esp)
	leal	4412(%esp), %eax
	movl	%eax, (%esp)
	call	lookup_hostname
	movl	144(%esp), %eax
	testl	%eax, %eax
	jne	.L38
	movl	140(%esp), %eax
	testl	%eax, %eax
	jne	.L38
	movl	$.LC8, 4(%esp)
	movl	$3, (%esp)
	call	syslog
	movl	argv0, %ecx
	movl	$.LC9, %edx
	movl	stderr, %eax
	movl	%ecx, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	fprintf
	movl	$1, (%esp)
	call	exit
.L38:
	movl	$0, numthrottles
	movl	$0, maxthrottles
	movl	$0, throttles
	movl	throttlefile, %eax
	testl	%eax, %eax
	je	.L39
	movl	throttlefile, %eax
	movl	%eax, (%esp)
	call	read_throttlefile
.L39:
	call	getuid
	testl	%eax, %eax
	jne	.L40
	movl	user, %eax
	movl	%eax, (%esp)
	call	getpwnam
	movl	%eax, 176(%esp)
	cmpl	$0, 176(%esp)
	jne	.L41
	movl	user, %eax
	movl	%eax, 8(%esp)
	movl	$.LC10, 4(%esp)
	movl	$2, (%esp)
	call	syslog
	movl	user, %ebx
	movl	argv0, %ecx
	movl	$.LC11, %edx
	movl	stderr, %eax
	movl	%ebx, 12(%esp)
	movl	%ecx, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	fprintf
	movl	$1, (%esp)
	call	exit
.L41:
	movl	176(%esp), %eax
	movl	8(%eax), %eax
	movl	%eax, 172(%esp)
	movl	176(%esp), %eax
	movl	12(%eax), %eax
	movl	%eax, 168(%esp)
.L40:
	movl	logfile, %eax
	testl	%eax, %eax
	je	.L42
	movl	logfile, %eax
	movl	$.LC12, 4(%esp)
	movl	%eax, (%esp)
	call	strcmp
	testl	%eax, %eax
	jne	.L43
	movl	$1, no_log
	movl	$0, 164(%esp)
	jmp	.L44
.L43:
	movl	logfile, %eax
	movl	$.LC4, 4(%esp)
	movl	%eax, (%esp)
	call	strcmp
	testl	%eax, %eax
	jne	.L45
	movl	stdout, %eax
	movl	%eax, 164(%esp)
	jmp	.L44
.L45:
	movl	$.LC6, %edx
	movl	logfile, %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	fopen
	movl	%eax, 164(%esp)
	cmpl	$0, 164(%esp)
	jne	.L46
	movl	logfile, %eax
	movl	%eax, 8(%esp)
	movl	$.LC13, 4(%esp)
	movl	$2, (%esp)
	call	syslog
	movl	logfile, %eax
	movl	%eax, (%esp)
	call	perror
	movl	$1, (%esp)
	call	exit
.L46:
	movl	logfile, %eax
	movzbl	(%eax), %eax
	cmpb	$47, %al
	je	.L47
	movl	$.LC14, 4(%esp)
	movl	$4, (%esp)
	call	syslog
	movl	argv0, %ecx
	movl	$.LC15, %edx
	movl	stderr, %eax
	movl	%ecx, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	fprintf
.L47:
	movl	164(%esp), %eax
	movl	%eax, (%esp)
	call	fileno
	movl	$1, 8(%esp)
	movl	$2, 4(%esp)
	movl	%eax, (%esp)
	call	fcntl
	call	getuid
	testl	%eax, %eax
	jne	.L44
	movl	164(%esp), %eax
	movl	%eax, (%esp)
	call	fileno
	movl	168(%esp), %edx
	movl	%edx, 8(%esp)
	movl	172(%esp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	fchown
	testl	%eax, %eax
	jns	.L44
	movl	$.LC16, 4(%esp)
	movl	$4, (%esp)
	call	syslog
	movl	$.LC17, (%esp)
	call	perror
	jmp	.L44
.L42:
	movl	$0, 164(%esp)
.L44:
	movl	dir, %eax
	testl	%eax, %eax
	je	.L48
	movl	dir, %eax
	movl	%eax, (%esp)
	call	chdir
	testl	%eax, %eax
	jns	.L48
	movl	$.LC18, 4(%esp)
	movl	$2, (%esp)
	call	syslog
	movl	$.LC19, (%esp)
	call	perror
	movl	$1, (%esp)
	call	exit
.L48:
	movl	$4096, 4(%esp)
	leal	187(%esp), %eax
	movl	%eax, (%esp)
	call	getcwd
	leal	187(%esp), %eax
	movl	%eax, (%esp)
	call	strlen
	subl	$1, %eax
	movzbl	187(%esp,%eax), %eax
	cmpb	$47, %al
	je	.L49
	movl	$.LC20, %eax
	movl	%eax, 4(%esp)
	leal	187(%esp), %eax
	movl	%eax, (%esp)
	call	strcat
.L49:
	movl	debug, %eax
	testl	%eax, %eax
	jne	.L50
	movl	stdin, %eax
	movl	%eax, (%esp)
	call	fclose
	movl	stdout, %eax
	cmpl	%eax, 164(%esp)
	je	.L51
	movl	stdout, %eax
	movl	%eax, (%esp)
	call	fclose
.L51:
	movl	stderr, %eax
	movl	%eax, (%esp)
	call	fclose
	movl	$1, 4(%esp)
	movl	$1, (%esp)
	call	daemon
	testl	%eax, %eax
	jns	.L52
	movl	$.LC21, 4(%esp)
	movl	$2, (%esp)
	call	syslog
	movl	$1, (%esp)
	call	exit
.L50:
	call	setsid
.L52:
	movl	pidfile, %eax
	testl	%eax, %eax
	je	.L53
	movl	$.LC22, %edx
	movl	pidfile, %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	fopen
	movl	%eax, 136(%esp)
	cmpl	$0, 136(%esp)
	jne	.L54
	movl	pidfile, %eax
	movl	%eax, 8(%esp)
	movl	$.LC13, 4(%esp)
	movl	$2, (%esp)
	call	syslog
	movl	$1, (%esp)
	call	exit
.L54:
	call	getpid
	movl	$.LC23, %edx
	movl	%eax, 8(%esp)
	movl	%edx, 4(%esp)
	movl	136(%esp), %eax
	movl	%eax, (%esp)
	call	fprintf
	movl	136(%esp), %eax
	movl	%eax, (%esp)
	call	fclose
.L53:
	call	fdwatch_get_nfiles
	movl	%eax, max_connects
	movl	max_connects, %eax
	testl	%eax, %eax
	jns	.L55
	movl	$.LC24, 4(%esp)
	movl	$2, (%esp)
	call	syslog
	movl	$1, (%esp)
	call	exit
.L55:
	movl	max_connects, %eax
	subl	$10, %eax
	movl	%eax, max_connects
	movl	do_chroot, %eax
	testl	%eax, %eax
	je	.L56
	leal	187(%esp), %eax
	movl	%eax, (%esp)
	call	chroot
	testl	%eax, %eax
	jns	.L57
	movl	$.LC25, 4(%esp)
	movl	$2, (%esp)
	call	syslog
	movl	$.LC26, (%esp)
	call	perror
	movl	$1, (%esp)
	call	exit
.L57:
	movl	logfile, %eax
	testl	%eax, %eax
	je	.L58
	movl	logfile, %eax
	movl	$.LC4, 4(%esp)
	movl	%eax, (%esp)
	call	strcmp
	testl	%eax, %eax
	je	.L58
	leal	187(%esp), %eax
	movl	%eax, (%esp)
	call	strlen
	movl	logfile, %edx
	movl	%eax, 8(%esp)
	leal	187(%esp), %eax
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	strncmp
	testl	%eax, %eax
	jne	.L59
	movl	logfile, %ebx
	leal	187(%esp), %eax
	movl	%eax, (%esp)
	call	strlen
	subl	$1, %eax
	leal	(%ebx,%eax), %eax
	movl	%eax, %edx
	movl	logfile, %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	strcpy
	jmp	.L58
.L59:
	movl	$.LC27, 4(%esp)
	movl	$4, (%esp)
	call	syslog
	movl	argv0, %ecx
	movl	$.LC28, %edx
	movl	stderr, %eax
	movl	%ecx, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	fprintf
.L58:
	movl	$.LC20, %eax
	movl	$2, 8(%esp)
	movl	%eax, 4(%esp)
	leal	187(%esp), %eax
	movl	%eax, (%esp)
	call	memcpy
	leal	187(%esp), %eax
	movl	%eax, (%esp)
	call	chdir
	testl	%eax, %eax
	jns	.L56
	movl	$.LC29, 4(%esp)
	movl	$2, (%esp)
	call	syslog
	movl	$.LC30, (%esp)
	call	perror
	movl	$1, (%esp)
	call	exit
.L56:
	movl	data_dir, %eax
	testl	%eax, %eax
	je	.L60
	movl	data_dir, %eax
	movl	%eax, (%esp)
	call	chdir
	testl	%eax, %eax
	jns	.L60
	movl	$.LC31, 4(%esp)
	movl	$2, (%esp)
	call	syslog
	movl	$.LC32, (%esp)
	call	perror
	movl	$1, (%esp)
	call	exit
.L60:
	movl	$handle_term, 4(%esp)
	movl	$15, (%esp)
	call	sigset
	movl	$handle_term, 4(%esp)
	movl	$2, (%esp)
	call	sigset
	movl	$handle_chld, 4(%esp)
	movl	$17, (%esp)
	call	sigset
	movl	$1, 4(%esp)
	movl	$13, (%esp)
	call	sigset
	movl	$handle_hup, 4(%esp)
	movl	$1, (%esp)
	call	sigset
	movl	$handle_usr1, 4(%esp)
	movl	$10, (%esp)
	call	sigset
	movl	$handle_usr2, 4(%esp)
	movl	$12, (%esp)
	call	sigset
	movl	$handle_alrm, 4(%esp)
	movl	$14, (%esp)
	call	sigset
	movl	$0, got_hup
	movl	$0, got_usr1
	movl	$0, watchdog_flag
	movl	$360, (%esp)
	call	alarm
	call	tmr_init
	movl	no_empty_referers, %esi
	movl	local_pattern, %edi
	movl	url_pattern, %eax
	movl	%eax, 80(%esp)
	movl	do_global_passwd, %eax
	movl	%eax, 84(%esp)
	movl	do_vhost, %eax
	movl	%eax, 88(%esp)
	movl	no_symlink_check, %eax
	movl	%eax, 92(%esp)
	movl	no_log, %eax
	movl	%eax, 96(%esp)
	movl	max_age, %eax
	movl	%eax, 100(%esp)
	movl	p3p, %eax
	movl	%eax, 104(%esp)
	movl	charset, %eax
	movl	%eax, 108(%esp)
	movl	cgi_limit, %eax
	movl	%eax, 112(%esp)
	movl	cgi_pattern, %eax
	movl	%eax, 116(%esp)
	movzwl	port, %eax
	movzwl	%ax, %eax
	movl	%eax, 120(%esp)
	movl	140(%esp), %eax
	testl	%eax, %eax
	je	.L61
	leal	4284(%esp), %ebx
	jmp	.L62
.L61:
	movl	$0, %ebx
.L62:
	movl	144(%esp), %eax
	testl	%eax, %eax
	je	.L63
	leal	4412(%esp), %edx
	jmp	.L64
.L63:
	movl	$0, %edx
.L64:
	movl	hostname, %ecx
	movl	%esi, 68(%esp)
	movl	%edi, 64(%esp)
	movl	80(%esp), %eax
	movl	%eax, 60(%esp)
	movl	84(%esp), %eax
	movl	%eax, 56(%esp)
	movl	88(%esp), %eax
	movl	%eax, 52(%esp)
	movl	92(%esp), %eax
	movl	%eax, 48(%esp)
	movl	164(%esp), %eax
	movl	%eax, 44(%esp)
	movl	96(%esp), %eax
	movl	%eax, 40(%esp)
	leal	187(%esp), %eax
	movl	%eax, 36(%esp)
	movl	100(%esp), %eax
	movl	%eax, 32(%esp)
	movl	104(%esp), %eax
	movl	%eax, 28(%esp)
	movl	108(%esp), %eax
	movl	%eax, 24(%esp)
	movl	112(%esp), %eax
	movl	%eax, 20(%esp)
	movl	116(%esp), %eax
	movl	%eax, 16(%esp)
	movl	120(%esp), %eax
	movl	%eax, 12(%esp)
	movl	%ebx, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%ecx, (%esp)
	call	httpd_initialize
	movl	%eax, hs
	movl	hs, %eax
	testl	%eax, %eax
	jne	.L65
	movl	$1, (%esp)
	call	exit
.L65:
	movl	$1, 16(%esp)
	movl	$120000, 12(%esp)
	movl	JunkClientData, %eax
	movl	%eax, 8(%esp)
	movl	$occasional, 4(%esp)
	movl	$0, (%esp)
	call	tmr_create
	testl	%eax, %eax
	jne	.L66
	movl	$.LC33, 4(%esp)
	movl	$2, (%esp)
	call	syslog
	movl	$1, (%esp)
	call	exit
.L66:
	movl	$1, 16(%esp)
	movl	$5000, 12(%esp)
	movl	JunkClientData, %eax
	movl	%eax, 8(%esp)
	movl	$idle, 4(%esp)
	movl	$0, (%esp)
	call	tmr_create
	testl	%eax, %eax
	jne	.L67
	movl	$.LC34, 4(%esp)
	movl	$2, (%esp)
	call	syslog
	movl	$1, (%esp)
	call	exit
.L67:
	movl	numthrottles, %eax
	testl	%eax, %eax
	jle	.L68
	movl	$1, 16(%esp)
	movl	$2000, 12(%esp)
	movl	JunkClientData, %eax
	movl	%eax, 8(%esp)
	movl	$update_throttles, 4(%esp)
	movl	$0, (%esp)
	call	tmr_create
	testl	%eax, %eax
	jne	.L68
	movl	$.LC35, 4(%esp)
	movl	$2, (%esp)
	call	syslog
	movl	$1, (%esp)
	call	exit
.L68:
	movl	$1, 16(%esp)
	movl	$3600000, 12(%esp)
	movl	JunkClientData, %eax
	movl	%eax, 8(%esp)
	movl	$show_stats, 4(%esp)
	movl	$0, (%esp)
	call	tmr_create
	testl	%eax, %eax
	jne	.L69
	movl	$.LC36, 4(%esp)
	movl	$2, (%esp)
	call	syslog
	movl	$1, (%esp)
	call	exit
.L69:
	movl	$0, (%esp)
	call	time
	movl	%eax, stats_time
	movl	stats_time, %eax
	movl	%eax, start_time
	movl	$0, stats_connections
	movl	$0, stats_bytes
	movl	$0, stats_simultaneous
	call	getuid
	testl	%eax, %eax
	jne	.L70
	movl	$0, 4(%esp)
	movl	$0, (%esp)
	call	setgroups
	testl	%eax, %eax
	jns	.L71
	movl	$.LC37, 4(%esp)
	movl	$2, (%esp)
	call	syslog
	movl	$1, (%esp)
	call	exit
.L71:
	movl	168(%esp), %eax
	movl	%eax, (%esp)
	call	setgid
	testl	%eax, %eax
	jns	.L72
	movl	$.LC38, 4(%esp)
	movl	$2, (%esp)
	call	syslog
	movl	$1, (%esp)
	call	exit
.L72:
	movl	user, %eax
	movl	168(%esp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	initgroups
	testl	%eax, %eax
	jns	.L73
	movl	$.LC39, 4(%esp)
	movl	$4, (%esp)
	call	syslog
.L73:
	movl	172(%esp), %eax
	movl	%eax, (%esp)
	call	setuid
	testl	%eax, %eax
	jns	.L74
	movl	$.LC40, 4(%esp)
	movl	$2, (%esp)
	call	syslog
	movl	$1, (%esp)
	call	exit
.L74:
	movl	do_chroot, %eax
	testl	%eax, %eax
	jne	.L70
	movl	$.LC41, 4(%esp)
	movl	$4, (%esp)
	call	syslog
.L70:
	movl	max_connects, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$5, %eax
	movl	%eax, (%esp)
	call	malloc
	movl	%eax, connects
	movl	connects, %eax
	testl	%eax, %eax
	jne	.L75
	movl	$.LC42, 4(%esp)
	movl	$2, (%esp)
	call	syslog
	movl	$1, (%esp)
	call	exit
.L75:
	movl	$0, 156(%esp)
	jmp	.L76
.L77:
	movl	connects, %ecx
	movl	156(%esp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$5, %eax
	leal	(%ecx,%eax), %eax
	movl	$0, (%eax)
	movl	connects, %ecx
	movl	156(%esp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$5, %eax
	leal	(%ecx,%eax), %eax
	movl	156(%esp), %edx
	addl	$1, %edx
	movl	%edx, 4(%eax)
	movl	connects, %ecx
	movl	156(%esp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$5, %eax
	leal	(%ecx,%eax), %eax
	movl	$0, 8(%eax)
	addl	$1, 156(%esp)
.L76:
	movl	max_connects, %eax
	cmpl	%eax, 156(%esp)
	jl	.L77
	movl	connects, %ecx
	movl	max_connects, %eax
	leal	-1(%eax), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$5, %eax
	leal	(%ecx,%eax), %eax
	movl	$-1, 4(%eax)
	movl	$0, first_free_connect
	movl	$0, num_connects
	movl	$0, httpd_conn_count
	movl	hs, %eax
	testl	%eax, %eax
	je	.L78
	movl	hs, %eax
	movl	40(%eax), %eax
	cmpl	$-1, %eax
	je	.L79
	movl	hs, %eax
	movl	40(%eax), %eax
	movl	$0, 8(%esp)
	movl	$0, 4(%esp)
	movl	%eax, (%esp)
	call	fdwatch_add_fd
.L79:
	movl	hs, %eax
	movl	44(%eax), %eax
	cmpl	$-1, %eax
	je	.L78
	movl	hs, %eax
	movl	44(%eax), %eax
	movl	$0, 8(%esp)
	movl	$0, 4(%esp)
	movl	%eax, (%esp)
	call	fdwatch_add_fd
.L78:
	leal	128(%esp), %eax
	movl	%eax, (%esp)
	call	tmr_prepare_timeval
	jmp	.L80
.L97:
	movl	got_hup, %eax
	testl	%eax, %eax
	je	.L81
	call	re_open_logfile
	movl	$0, got_hup
.L81:
	leal	128(%esp), %eax
	movl	%eax, (%esp)
	call	tmr_mstimeout
	movl	%eax, (%esp)
	call	fdwatch
	movl	%eax, 160(%esp)
	cmpl	$0, 160(%esp)
	jns	.L82
	call	__errno_location
	movl	(%eax), %eax
	cmpl	$4, %eax
	je	.L100
	call	__errno_location
	movl	(%eax), %eax
	cmpl	$11, %eax
	je	.L101
.L84:
	movl	$.LC43, 4(%esp)
	movl	$3, (%esp)
	call	syslog
	movl	$1, (%esp)
	call	exit
.L82:
	leal	128(%esp), %eax
	movl	%eax, (%esp)
	call	tmr_prepare_timeval
	cmpl	$0, 160(%esp)
	jne	.L85
	leal	128(%esp), %eax
	movl	%eax, (%esp)
	call	tmr_run
	jmp	.L80
.L85:
	movl	hs, %eax
	testl	%eax, %eax
	je	.L86
	movl	hs, %eax
	movl	44(%eax), %eax
	cmpl	$-1, %eax
	je	.L86
	movl	hs, %eax
	movl	44(%eax), %eax
	movl	%eax, (%esp)
	call	fdwatch_check_fd
	testl	%eax, %eax
	je	.L86
	movl	hs, %eax
	movl	44(%eax), %eax
	movl	%eax, 4(%esp)
	leal	128(%esp), %eax
	movl	%eax, (%esp)
	call	handle_newconnect
	testl	%eax, %eax
	jne	.L102
.L86:
	movl	hs, %eax
	testl	%eax, %eax
	je	.L103
	movl	hs, %eax
	movl	40(%eax), %eax
	cmpl	$-1, %eax
	je	.L104
	movl	hs, %eax
	movl	40(%eax), %eax
	movl	%eax, (%esp)
	call	fdwatch_check_fd
	testl	%eax, %eax
	je	.L105
	movl	hs, %eax
	movl	40(%eax), %eax
	movl	%eax, 4(%esp)
	leal	128(%esp), %eax
	movl	%eax, (%esp)
	call	handle_newconnect
	testl	%eax, %eax
	je	.L106
	jmp	.L80
.L94:
	cmpl	$0, 152(%esp)
	je	.L107
.L89:
	movl	152(%esp), %eax
	movl	8(%eax), %eax
	movl	%eax, 148(%esp)
	movl	148(%esp), %eax
	movl	448(%eax), %eax
	movl	%eax, (%esp)
	call	fdwatch_check_fd
	testl	%eax, %eax
	jne	.L90
	leal	128(%esp), %eax
	movl	%eax, 4(%esp)
	movl	152(%esp), %eax
	movl	%eax, (%esp)
	call	clear_connection
	jmp	.L88
.L90:
	movl	152(%esp), %eax
	movl	(%eax), %eax
	cmpl	$2, %eax
	je	.L92
	cmpl	$4, %eax
	je	.L93
	cmpl	$1, %eax
	jne	.L88
.L91:
	leal	128(%esp), %eax
	movl	%eax, 4(%esp)
	movl	152(%esp), %eax
	movl	%eax, (%esp)
	call	handle_read
	jmp	.L88
.L92:
	leal	128(%esp), %eax
	movl	%eax, 4(%esp)
	movl	152(%esp), %eax
	movl	%eax, (%esp)
	call	handle_send
	jmp	.L88
.L93:
	leal	128(%esp), %eax
	movl	%eax, 4(%esp)
	movl	152(%esp), %eax
	movl	%eax, (%esp)
	call	handle_linger
	jmp	.L88
.L103:
	nop
	jmp	.L88
.L104:
	nop
	jmp	.L88
.L105:
	nop
	jmp	.L88
.L106:
	nop
	jmp	.L88
.L107:
	nop
.L88:
	call	fdwatch_get_next_client_data
	movl	%eax, 152(%esp)
	cmpl	$-1, 152(%esp)
	jne	.L94
	leal	128(%esp), %eax
	movl	%eax, (%esp)
	call	tmr_run
	movl	got_usr1, %eax
	testl	%eax, %eax
	je	.L80
	movl	terminate, %eax
	testl	%eax, %eax
	jne	.L80
	movl	$1, terminate
	movl	hs, %eax
	testl	%eax, %eax
	je	.L80
	movl	hs, %eax
	movl	40(%eax), %eax
	cmpl	$-1, %eax
	je	.L95
	movl	hs, %eax
	movl	40(%eax), %eax
	movl	%eax, (%esp)
	call	fdwatch_del_fd
.L95:
	movl	hs, %eax
	movl	44(%eax), %eax
	cmpl	$-1, %eax
	je	.L96
	movl	hs, %eax
	movl	44(%eax), %eax
	movl	%eax, (%esp)
	call	fdwatch_del_fd
.L96:
	movl	hs, %eax
	movl	%eax, (%esp)
	call	httpd_unlisten
	jmp	.L80
.L100:
	nop
	jmp	.L80
.L101:
	nop
	jmp	.L80
.L102:
	nop
.L80:
	movl	terminate, %eax
	testl	%eax, %eax
	je	.L97
	movl	num_connects, %eax
	testl	%eax, %eax
	jg	.L97
	call	shut_down
	movl	$.LC2, 4(%esp)
	movl	$5, (%esp)
	call	syslog
	call	closelog
	movl	$0, (%esp)
	call	exit
	.size	main, .-main
	.section	.rodata
.LC44:
	.string	"nobody"
.LC45:
	.string	"iso-8859-1"
.LC46:
	.string	""
.LC47:
	.string	"-V"
.LC48:
	.string	"thttpd/2.26.2 April 4, 2012"
.LC49:
	.string	"-C"
.LC50:
	.string	"-p"
.LC51:
	.string	"-d"
.LC52:
	.string	"-r"
.LC53:
	.string	"-nor"
.LC54:
	.string	"-dd"
.LC55:
	.string	"-s"
.LC56:
	.string	"-nos"
.LC57:
	.string	"-u"
.LC58:
	.string	"-c"
.LC59:
	.string	"-t"
.LC60:
	.string	"-h"
.LC61:
	.string	"-l"
.LC62:
	.string	"-v"
.LC63:
	.string	"-nov"
.LC64:
	.string	"-g"
.LC65:
	.string	"-nog"
.LC66:
	.string	"-i"
.LC67:
	.string	"-T"
.LC68:
	.string	"-P"
.LC69:
	.string	"-M"
.LC70:
	.string	"-D"
	.text
	.type	parse_args, @function
parse_args:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$40, %esp
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
	movl	$.LC44, user
	movl	$.LC45, charset
	movl	$.LC46, p3p
	movl	$-1, max_age
	movl	$1, -12(%ebp)
	jmp	.L109
.L135:
	movl	-12(%ebp), %eax
	sall	$2, %eax
	addl	12(%ebp), %eax
	movl	(%eax), %eax
	movl	$.LC47, 4(%esp)
	movl	%eax, (%esp)
	call	strcmp
	testl	%eax, %eax
	jne	.L110
	movl	$.LC48, (%esp)
	call	puts
	movl	$0, (%esp)
	call	exit
.L110:
	movl	-12(%ebp), %eax
	sall	$2, %eax
	addl	12(%ebp), %eax
	movl	(%eax), %eax
	movl	$.LC49, 4(%esp)
	movl	%eax, (%esp)
	call	strcmp
	testl	%eax, %eax
	jne	.L111
	movl	-12(%ebp), %eax
	addl	$1, %eax
	cmpl	8(%ebp), %eax
	jge	.L111
	addl	$1, -12(%ebp)
	movl	-12(%ebp), %eax
	sall	$2, %eax
	addl	12(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, (%esp)
	call	read_config
	jmp	.L112
.L111:
	movl	-12(%ebp), %eax
	sall	$2, %eax
	addl	12(%ebp), %eax
	movl	(%eax), %eax
	movl	$.LC50, 4(%esp)
	movl	%eax, (%esp)
	call	strcmp
	testl	%eax, %eax
	jne	.L113
	movl	-12(%ebp), %eax
	addl	$1, %eax
	cmpl	8(%ebp), %eax
	jge	.L113
	addl	$1, -12(%ebp)
	movl	-12(%ebp), %eax
	sall	$2, %eax
	addl	12(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, (%esp)
	call	atoi
	movw	%ax, port
	jmp	.L112
.L113:
	movl	-12(%ebp), %eax
	sall	$2, %eax
	addl	12(%ebp), %eax
	movl	(%eax), %eax
	movl	$.LC51, 4(%esp)
	movl	%eax, (%esp)
	call	strcmp
	testl	%eax, %eax
	jne	.L114
	movl	-12(%ebp), %eax
	addl	$1, %eax
	cmpl	8(%ebp), %eax
	jge	.L114
	addl	$1, -12(%ebp)
	movl	-12(%ebp), %eax
	sall	$2, %eax
	addl	12(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, dir
	jmp	.L112
.L114:
	movl	-12(%ebp), %eax
	sall	$2, %eax
	addl	12(%ebp), %eax
	movl	(%eax), %eax
	movl	$.LC52, 4(%esp)
	movl	%eax, (%esp)
	call	strcmp
	testl	%eax, %eax
	jne	.L115
	movl	$1, do_chroot
	movl	$1, no_symlink_check
	jmp	.L112
.L115:
	movl	-12(%ebp), %eax
	sall	$2, %eax
	addl	12(%ebp), %eax
	movl	(%eax), %eax
	movl	$.LC53, 4(%esp)
	movl	%eax, (%esp)
	call	strcmp
	testl	%eax, %eax
	jne	.L116
	movl	$0, do_chroot
	movl	$0, no_symlink_check
	jmp	.L112
.L116:
	movl	-12(%ebp), %eax
	sall	$2, %eax
	addl	12(%ebp), %eax
	movl	(%eax), %eax
	movl	$.LC54, 4(%esp)
	movl	%eax, (%esp)
	call	strcmp
	testl	%eax, %eax
	jne	.L117
	movl	-12(%ebp), %eax
	addl	$1, %eax
	cmpl	8(%ebp), %eax
	jge	.L117
	addl	$1, -12(%ebp)
	movl	-12(%ebp), %eax
	sall	$2, %eax
	addl	12(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, data_dir
	jmp	.L112
.L117:
	movl	-12(%ebp), %eax
	sall	$2, %eax
	addl	12(%ebp), %eax
	movl	(%eax), %eax
	movl	$.LC55, 4(%esp)
	movl	%eax, (%esp)
	call	strcmp
	testl	%eax, %eax
	jne	.L118
	movl	$0, no_symlink_check
	jmp	.L112
.L118:
	movl	-12(%ebp), %eax
	sall	$2, %eax
	addl	12(%ebp), %eax
	movl	(%eax), %eax
	movl	$.LC56, 4(%esp)
	movl	%eax, (%esp)
	call	strcmp
	testl	%eax, %eax
	jne	.L119
	movl	$1, no_symlink_check
	jmp	.L112
.L119:
	movl	-12(%ebp), %eax
	sall	$2, %eax
	addl	12(%ebp), %eax
	movl	(%eax), %eax
	movl	$.LC57, 4(%esp)
	movl	%eax, (%esp)
	call	strcmp
	testl	%eax, %eax
	jne	.L120
	movl	-12(%ebp), %eax
	addl	$1, %eax
	cmpl	8(%ebp), %eax
	jge	.L120
	addl	$1, -12(%ebp)
	movl	-12(%ebp), %eax
	sall	$2, %eax
	addl	12(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, user
	jmp	.L112
.L120:
	movl	-12(%ebp), %eax
	sall	$2, %eax
	addl	12(%ebp), %eax
	movl	(%eax), %eax
	movl	$.LC58, 4(%esp)
	movl	%eax, (%esp)
	call	strcmp
	testl	%eax, %eax
	jne	.L121
	movl	-12(%ebp), %eax
	addl	$1, %eax
	cmpl	8(%ebp), %eax
	jge	.L121
	addl	$1, -12(%ebp)
	movl	-12(%ebp), %eax
	sall	$2, %eax
	addl	12(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, cgi_pattern
	jmp	.L112
.L121:
	movl	-12(%ebp), %eax
	sall	$2, %eax
	addl	12(%ebp), %eax
	movl	(%eax), %eax
	movl	$.LC59, 4(%esp)
	movl	%eax, (%esp)
	call	strcmp
	testl	%eax, %eax
	jne	.L122
	movl	-12(%ebp), %eax
	addl	$1, %eax
	cmpl	8(%ebp), %eax
	jge	.L122
	addl	$1, -12(%ebp)
	movl	-12(%ebp), %eax
	sall	$2, %eax
	addl	12(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, throttlefile
	jmp	.L112
.L122:
	movl	-12(%ebp), %eax
	sall	$2, %eax
	addl	12(%ebp), %eax
	movl	(%eax), %eax
	movl	$.LC60, 4(%esp)
	movl	%eax, (%esp)
	call	strcmp
	testl	%eax, %eax
	jne	.L123
	movl	-12(%ebp), %eax
	addl	$1, %eax
	cmpl	8(%ebp), %eax
	jge	.L123
	addl	$1, -12(%ebp)
	movl	-12(%ebp), %eax
	sall	$2, %eax
	addl	12(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, hostname
	jmp	.L112
.L123:
	movl	-12(%ebp), %eax
	sall	$2, %eax
	addl	12(%ebp), %eax
	movl	(%eax), %eax
	movl	$.LC61, 4(%esp)
	movl	%eax, (%esp)
	call	strcmp
	testl	%eax, %eax
	jne	.L124
	movl	-12(%ebp), %eax
	addl	$1, %eax
	cmpl	8(%ebp), %eax
	jge	.L124
	addl	$1, -12(%ebp)
	movl	-12(%ebp), %eax
	sall	$2, %eax
	addl	12(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, logfile
	jmp	.L112
.L124:
	movl	-12(%ebp), %eax
	sall	$2, %eax
	addl	12(%ebp), %eax
	movl	(%eax), %eax
	movl	$.LC62, 4(%esp)
	movl	%eax, (%esp)
	call	strcmp
	testl	%eax, %eax
	jne	.L125
	movl	$1, do_vhost
	jmp	.L112
.L125:
	movl	-12(%ebp), %eax
	sall	$2, %eax
	addl	12(%ebp), %eax
	movl	(%eax), %eax
	movl	$.LC63, 4(%esp)
	movl	%eax, (%esp)
	call	strcmp
	testl	%eax, %eax
	jne	.L126
	movl	$0, do_vhost
	jmp	.L112
.L126:
	movl	-12(%ebp), %eax
	sall	$2, %eax
	addl	12(%ebp), %eax
	movl	(%eax), %eax
	movl	$.LC64, 4(%esp)
	movl	%eax, (%esp)
	call	strcmp
	testl	%eax, %eax
	jne	.L127
	movl	$1, do_global_passwd
	jmp	.L112
.L127:
	movl	-12(%ebp), %eax
	sall	$2, %eax
	addl	12(%ebp), %eax
	movl	(%eax), %eax
	movl	$.LC65, 4(%esp)
	movl	%eax, (%esp)
	call	strcmp
	testl	%eax, %eax
	jne	.L128
	movl	$0, do_global_passwd
	jmp	.L112
.L128:
	movl	-12(%ebp), %eax
	sall	$2, %eax
	addl	12(%ebp), %eax
	movl	(%eax), %eax
	movl	$.LC66, 4(%esp)
	movl	%eax, (%esp)
	call	strcmp
	testl	%eax, %eax
	jne	.L129
	movl	-12(%ebp), %eax
	addl	$1, %eax
	cmpl	8(%ebp), %eax
	jge	.L129
	addl	$1, -12(%ebp)
	movl	-12(%ebp), %eax
	sall	$2, %eax
	addl	12(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, pidfile
	jmp	.L112
.L129:
	movl	-12(%ebp), %eax
	sall	$2, %eax
	addl	12(%ebp), %eax
	movl	(%eax), %eax
	movl	$.LC67, 4(%esp)
	movl	%eax, (%esp)
	call	strcmp
	testl	%eax, %eax
	jne	.L130
	movl	-12(%ebp), %eax
	addl	$1, %eax
	cmpl	8(%ebp), %eax
	jge	.L130
	addl	$1, -12(%ebp)
	movl	-12(%ebp), %eax
	sall	$2, %eax
	addl	12(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, charset
	jmp	.L112
.L130:
	movl	-12(%ebp), %eax
	sall	$2, %eax
	addl	12(%ebp), %eax
	movl	(%eax), %eax
	movl	$.LC68, 4(%esp)
	movl	%eax, (%esp)
	call	strcmp
	testl	%eax, %eax
	jne	.L131
	movl	-12(%ebp), %eax
	addl	$1, %eax
	cmpl	8(%ebp), %eax
	jge	.L131
	addl	$1, -12(%ebp)
	movl	-12(%ebp), %eax
	sall	$2, %eax
	addl	12(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, p3p
	jmp	.L112
.L131:
	movl	-12(%ebp), %eax
	sall	$2, %eax
	addl	12(%ebp), %eax
	movl	(%eax), %eax
	movl	$.LC69, 4(%esp)
	movl	%eax, (%esp)
	call	strcmp
	testl	%eax, %eax
	jne	.L132
	movl	-12(%ebp), %eax
	addl	$1, %eax
	cmpl	8(%ebp), %eax
	jge	.L132
	addl	$1, -12(%ebp)
	movl	-12(%ebp), %eax
	sall	$2, %eax
	addl	12(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, (%esp)
	call	atoi
	movl	%eax, max_age
	jmp	.L112
.L132:
	movl	-12(%ebp), %eax
	sall	$2, %eax
	addl	12(%ebp), %eax
	movl	(%eax), %eax
	movl	$.LC70, 4(%esp)
	movl	%eax, (%esp)
	call	strcmp
	testl	%eax, %eax
	jne	.L133
	movl	$1, debug
	jmp	.L112
.L133:
	call	usage
.L112:
	addl	$1, -12(%ebp)
.L109:
	movl	-12(%ebp), %eax
	cmpl	8(%ebp), %eax
	jge	.L134
	movl	-12(%ebp), %eax
	sall	$2, %eax
	addl	12(%ebp), %eax
	movl	(%eax), %eax
	movzbl	(%eax), %eax
	cmpb	$45, %al
	je	.L135
.L134:
	movl	-12(%ebp), %eax
	cmpl	8(%ebp), %eax
	je	.L137
	call	usage
.L137:
	leave
	ret
	.size	parse_args, .-parse_args
	.section	.rodata
	.align 4
.LC71:
	.string	"usage:  %s [-C configfile] [-p port] [-d dir] [-r|-nor] [-dd data_dir] [-s|-nos] [-v|-nov] [-g|-nog] [-u user] [-c cgipat] [-t throttles] [-h host] [-l logfile] [-i pidfile] [-T charset] [-P P3P] [-M maxage] [-V] [-D]\n"
	.text
	.type	usage, @function
usage:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$24, %esp
	movl	argv0, %ecx
	movl	$.LC71, %edx
	movl	stderr, %eax
	movl	%ecx, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	fprintf
	movl	$1, (%esp)
	call	exit
	.size	usage, .-usage
	.section	.rodata
.LC72:
	.string	"r"
.LC73:
	.string	" \t\n\r"
.LC74:
	.string	"debug"
.LC75:
	.string	"port"
.LC76:
	.string	"dir"
.LC77:
	.string	"nochroot"
.LC78:
	.string	"data_dir"
.LC79:
	.string	"symlink"
.LC80:
	.string	"nosymlink"
.LC81:
	.string	"symlinks"
.LC82:
	.string	"nosymlinks"
.LC83:
	.string	"user"
.LC84:
	.string	"cgipat"
.LC85:
	.string	"cgilimit"
.LC86:
	.string	"urlpat"
.LC87:
	.string	"noemptyreferers"
.LC88:
	.string	"localpat"
.LC89:
	.string	"throttles"
.LC90:
	.string	"host"
.LC91:
	.string	"logfile"
.LC92:
	.string	"vhost"
.LC93:
	.string	"novhost"
.LC94:
	.string	"globalpasswd"
.LC95:
	.string	"noglobalpasswd"
.LC96:
	.string	"pidfile"
.LC97:
	.string	"charset"
.LC98:
	.string	"p3p"
.LC99:
	.string	"max_age"
	.align 4
.LC100:
	.string	"%s: unknown config option '%s'\n"
	.text
	.type	read_config, @function
read_config:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%ebx
	subl	$10068, %esp
	movl	8(%ebp), %eax
	movl	%eax, -10044(%ebp)
	movl	%gs:20, %eax
	movl	%eax, -12(%ebp)
	xorl	%eax, %eax
	movl	$.LC72, %edx
	movl	-10044(%ebp), %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	fopen
	movl	%eax, -10016(%ebp)
	cmpl	$0, -10016(%ebp)
	jne	.L180
	movl	-10044(%ebp), %eax
	movl	%eax, (%esp)
	call	perror
	movl	$1, (%esp)
	call	exit
.L177:
	movl	$35, 4(%esp)
	leal	-10012(%ebp), %eax
	movl	%eax, (%esp)
	call	strchr
	movl	%eax, -10020(%ebp)
	cmpl	$0, -10020(%ebp)
	je	.L143
	movl	-10020(%ebp), %eax
	movb	$0, (%eax)
.L143:
	leal	-10012(%ebp), %eax
	movl	%eax, -10020(%ebp)
	movl	$.LC73, 4(%esp)
	movl	-10020(%ebp), %eax
	movl	%eax, (%esp)
	call	strspn
	addl	%eax, -10020(%ebp)
	jmp	.L144
.L176:
	movl	$.LC73, 4(%esp)
	movl	-10020(%ebp), %eax
	movl	%eax, (%esp)
	call	strcspn
	addl	-10020(%ebp), %eax
	movl	%eax, -10024(%ebp)
	jmp	.L145
.L146:
	movl	-10024(%ebp), %eax
	movb	$0, (%eax)
	addl	$1, -10024(%ebp)
.L145:
	movl	-10024(%ebp), %eax
	movzbl	(%eax), %eax
	cmpb	$32, %al
	je	.L146
	movl	-10024(%ebp), %eax
	movzbl	(%eax), %eax
	cmpb	$9, %al
	je	.L146
	movl	-10024(%ebp), %eax
	movzbl	(%eax), %eax
	cmpb	$10, %al
	je	.L146
	movl	-10024(%ebp), %eax
	movzbl	(%eax), %eax
	cmpb	$13, %al
	je	.L146
	movl	-10020(%ebp), %eax
	movl	%eax, -10028(%ebp)
	movl	$61, 4(%esp)
	movl	-10028(%ebp), %eax
	movl	%eax, (%esp)
	call	strchr
	movl	%eax, -10032(%ebp)
	cmpl	$0, -10032(%ebp)
	je	.L147
	movl	-10032(%ebp), %eax
	movb	$0, (%eax)
	addl	$1, -10032(%ebp)
.L147:
	movl	$.LC74, 4(%esp)
	movl	-10028(%ebp), %eax
	movl	%eax, (%esp)
	call	strcasecmp
	testl	%eax, %eax
	jne	.L148
	movl	-10032(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-10028(%ebp), %eax
	movl	%eax, (%esp)
	call	no_value_required
	movl	$1, debug
	jmp	.L149
.L148:
	movl	$.LC75, 4(%esp)
	movl	-10028(%ebp), %eax
	movl	%eax, (%esp)
	call	strcasecmp
	testl	%eax, %eax
	jne	.L150
	movl	-10032(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-10028(%ebp), %eax
	movl	%eax, (%esp)
	call	value_required
	movl	-10032(%ebp), %eax
	movl	%eax, (%esp)
	call	atoi
	movw	%ax, port
	jmp	.L149
.L150:
	movl	$.LC76, 4(%esp)
	movl	-10028(%ebp), %eax
	movl	%eax, (%esp)
	call	strcasecmp
	testl	%eax, %eax
	jne	.L151
	movl	-10032(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-10028(%ebp), %eax
	movl	%eax, (%esp)
	call	value_required
	movl	-10032(%ebp), %eax
	movl	%eax, (%esp)
	call	e_strdup
	movl	%eax, dir
	jmp	.L149
.L151:
	movl	$.LC26, 4(%esp)
	movl	-10028(%ebp), %eax
	movl	%eax, (%esp)
	call	strcasecmp
	testl	%eax, %eax
	jne	.L152
	movl	-10032(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-10028(%ebp), %eax
	movl	%eax, (%esp)
	call	no_value_required
	movl	$1, do_chroot
	movl	$1, no_symlink_check
	jmp	.L149
.L152:
	movl	$.LC77, 4(%esp)
	movl	-10028(%ebp), %eax
	movl	%eax, (%esp)
	call	strcasecmp
	testl	%eax, %eax
	jne	.L153
	movl	-10032(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-10028(%ebp), %eax
	movl	%eax, (%esp)
	call	no_value_required
	movl	$0, do_chroot
	movl	$0, no_symlink_check
	jmp	.L149
.L153:
	movl	$.LC78, 4(%esp)
	movl	-10028(%ebp), %eax
	movl	%eax, (%esp)
	call	strcasecmp
	testl	%eax, %eax
	jne	.L154
	movl	-10032(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-10028(%ebp), %eax
	movl	%eax, (%esp)
	call	value_required
	movl	-10032(%ebp), %eax
	movl	%eax, (%esp)
	call	e_strdup
	movl	%eax, data_dir
	jmp	.L149
.L154:
	movl	$.LC79, 4(%esp)
	movl	-10028(%ebp), %eax
	movl	%eax, (%esp)
	call	strcasecmp
	testl	%eax, %eax
	jne	.L155
	movl	-10032(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-10028(%ebp), %eax
	movl	%eax, (%esp)
	call	no_value_required
	movl	$0, no_symlink_check
	jmp	.L149
.L155:
	movl	$.LC80, 4(%esp)
	movl	-10028(%ebp), %eax
	movl	%eax, (%esp)
	call	strcasecmp
	testl	%eax, %eax
	jne	.L156
	movl	-10032(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-10028(%ebp), %eax
	movl	%eax, (%esp)
	call	no_value_required
	movl	$1, no_symlink_check
	jmp	.L149
.L156:
	movl	$.LC81, 4(%esp)
	movl	-10028(%ebp), %eax
	movl	%eax, (%esp)
	call	strcasecmp
	testl	%eax, %eax
	jne	.L157
	movl	-10032(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-10028(%ebp), %eax
	movl	%eax, (%esp)
	call	no_value_required
	movl	$0, no_symlink_check
	jmp	.L149
.L157:
	movl	$.LC82, 4(%esp)
	movl	-10028(%ebp), %eax
	movl	%eax, (%esp)
	call	strcasecmp
	testl	%eax, %eax
	jne	.L158
	movl	-10032(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-10028(%ebp), %eax
	movl	%eax, (%esp)
	call	no_value_required
	movl	$1, no_symlink_check
	jmp	.L149
.L158:
	movl	$.LC83, 4(%esp)
	movl	-10028(%ebp), %eax
	movl	%eax, (%esp)
	call	strcasecmp
	testl	%eax, %eax
	jne	.L159
	movl	-10032(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-10028(%ebp), %eax
	movl	%eax, (%esp)
	call	value_required
	movl	-10032(%ebp), %eax
	movl	%eax, (%esp)
	call	e_strdup
	movl	%eax, user
	jmp	.L149
.L159:
	movl	$.LC84, 4(%esp)
	movl	-10028(%ebp), %eax
	movl	%eax, (%esp)
	call	strcasecmp
	testl	%eax, %eax
	jne	.L160
	movl	-10032(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-10028(%ebp), %eax
	movl	%eax, (%esp)
	call	value_required
	movl	-10032(%ebp), %eax
	movl	%eax, (%esp)
	call	e_strdup
	movl	%eax, cgi_pattern
	jmp	.L149
.L160:
	movl	$.LC85, 4(%esp)
	movl	-10028(%ebp), %eax
	movl	%eax, (%esp)
	call	strcasecmp
	testl	%eax, %eax
	jne	.L161
	movl	-10032(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-10028(%ebp), %eax
	movl	%eax, (%esp)
	call	value_required
	movl	-10032(%ebp), %eax
	movl	%eax, (%esp)
	call	atoi
	movl	%eax, cgi_limit
	jmp	.L149
.L161:
	movl	$.LC86, 4(%esp)
	movl	-10028(%ebp), %eax
	movl	%eax, (%esp)
	call	strcasecmp
	testl	%eax, %eax
	jne	.L162
	movl	-10032(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-10028(%ebp), %eax
	movl	%eax, (%esp)
	call	value_required
	movl	-10032(%ebp), %eax
	movl	%eax, (%esp)
	call	e_strdup
	movl	%eax, url_pattern
	jmp	.L149
.L162:
	movl	$.LC87, 4(%esp)
	movl	-10028(%ebp), %eax
	movl	%eax, (%esp)
	call	strcasecmp
	testl	%eax, %eax
	jne	.L163
	movl	-10032(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-10028(%ebp), %eax
	movl	%eax, (%esp)
	call	no_value_required
	movl	$1, no_empty_referers
	jmp	.L149
.L163:
	movl	$.LC88, 4(%esp)
	movl	-10028(%ebp), %eax
	movl	%eax, (%esp)
	call	strcasecmp
	testl	%eax, %eax
	jne	.L164
	movl	-10032(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-10028(%ebp), %eax
	movl	%eax, (%esp)
	call	value_required
	movl	-10032(%ebp), %eax
	movl	%eax, (%esp)
	call	e_strdup
	movl	%eax, local_pattern
	jmp	.L149
.L164:
	movl	$.LC89, 4(%esp)
	movl	-10028(%ebp), %eax
	movl	%eax, (%esp)
	call	strcasecmp
	testl	%eax, %eax
	jne	.L165
	movl	-10032(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-10028(%ebp), %eax
	movl	%eax, (%esp)
	call	value_required
	movl	-10032(%ebp), %eax
	movl	%eax, (%esp)
	call	e_strdup
	movl	%eax, throttlefile
	jmp	.L149
.L165:
	movl	$.LC90, 4(%esp)
	movl	-10028(%ebp), %eax
	movl	%eax, (%esp)
	call	strcasecmp
	testl	%eax, %eax
	jne	.L166
	movl	-10032(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-10028(%ebp), %eax
	movl	%eax, (%esp)
	call	value_required
	movl	-10032(%ebp), %eax
	movl	%eax, (%esp)
	call	e_strdup
	movl	%eax, hostname
	jmp	.L149
.L166:
	movl	$.LC91, 4(%esp)
	movl	-10028(%ebp), %eax
	movl	%eax, (%esp)
	call	strcasecmp
	testl	%eax, %eax
	jne	.L167
	movl	-10032(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-10028(%ebp), %eax
	movl	%eax, (%esp)
	call	value_required
	movl	-10032(%ebp), %eax
	movl	%eax, (%esp)
	call	e_strdup
	movl	%eax, logfile
	jmp	.L149
.L167:
	movl	$.LC92, 4(%esp)
	movl	-10028(%ebp), %eax
	movl	%eax, (%esp)
	call	strcasecmp
	testl	%eax, %eax
	jne	.L168
	movl	-10032(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-10028(%ebp), %eax
	movl	%eax, (%esp)
	call	no_value_required
	movl	$1, do_vhost
	jmp	.L149
.L168:
	movl	$.LC93, 4(%esp)
	movl	-10028(%ebp), %eax
	movl	%eax, (%esp)
	call	strcasecmp
	testl	%eax, %eax
	jne	.L169
	movl	-10032(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-10028(%ebp), %eax
	movl	%eax, (%esp)
	call	no_value_required
	movl	$0, do_vhost
	jmp	.L149
.L169:
	movl	$.LC94, 4(%esp)
	movl	-10028(%ebp), %eax
	movl	%eax, (%esp)
	call	strcasecmp
	testl	%eax, %eax
	jne	.L170
	movl	-10032(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-10028(%ebp), %eax
	movl	%eax, (%esp)
	call	no_value_required
	movl	$1, do_global_passwd
	jmp	.L149
.L170:
	movl	$.LC95, 4(%esp)
	movl	-10028(%ebp), %eax
	movl	%eax, (%esp)
	call	strcasecmp
	testl	%eax, %eax
	jne	.L171
	movl	-10032(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-10028(%ebp), %eax
	movl	%eax, (%esp)
	call	no_value_required
	movl	$0, do_global_passwd
	jmp	.L149
.L171:
	movl	$.LC96, 4(%esp)
	movl	-10028(%ebp), %eax
	movl	%eax, (%esp)
	call	strcasecmp
	testl	%eax, %eax
	jne	.L172
	movl	-10032(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-10028(%ebp), %eax
	movl	%eax, (%esp)
	call	value_required
	movl	-10032(%ebp), %eax
	movl	%eax, (%esp)
	call	e_strdup
	movl	%eax, pidfile
	jmp	.L149
.L172:
	movl	$.LC97, 4(%esp)
	movl	-10028(%ebp), %eax
	movl	%eax, (%esp)
	call	strcasecmp
	testl	%eax, %eax
	jne	.L173
	movl	-10032(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-10028(%ebp), %eax
	movl	%eax, (%esp)
	call	value_required
	movl	-10032(%ebp), %eax
	movl	%eax, (%esp)
	call	e_strdup
	movl	%eax, charset
	jmp	.L149
.L173:
	movl	$.LC98, 4(%esp)
	movl	-10028(%ebp), %eax
	movl	%eax, (%esp)
	call	strcasecmp
	testl	%eax, %eax
	jne	.L174
	movl	-10032(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-10028(%ebp), %eax
	movl	%eax, (%esp)
	call	value_required
	movl	-10032(%ebp), %eax
	movl	%eax, (%esp)
	call	e_strdup
	movl	%eax, p3p
	jmp	.L149
.L174:
	movl	$.LC99, 4(%esp)
	movl	-10028(%ebp), %eax
	movl	%eax, (%esp)
	call	strcasecmp
	testl	%eax, %eax
	jne	.L175
	movl	-10032(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-10028(%ebp), %eax
	movl	%eax, (%esp)
	call	value_required
	movl	-10032(%ebp), %eax
	movl	%eax, (%esp)
	call	atoi
	movl	%eax, max_age
	jmp	.L149
.L175:
	movl	argv0, %ecx
	movl	$.LC100, %edx
	movl	stderr, %eax
	movl	-10028(%ebp), %ebx
	movl	%ebx, 12(%esp)
	movl	%ecx, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	fprintf
	movl	$1, (%esp)
	call	exit
.L149:
	movl	-10024(%ebp), %eax
	movl	%eax, -10020(%ebp)
	movl	$.LC73, 4(%esp)
	movl	-10020(%ebp), %eax
	movl	%eax, (%esp)
	call	strspn
	addl	%eax, -10020(%ebp)
.L144:
	movl	-10020(%ebp), %eax
	movzbl	(%eax), %eax
	testb	%al, %al
	jne	.L176
	jmp	.L142
.L180:
	nop
.L142:
	movl	-10016(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	$10000, 4(%esp)
	leal	-10012(%ebp), %eax
	movl	%eax, (%esp)
	call	fgets
	testl	%eax, %eax
	jne	.L177
	movl	-10016(%ebp), %eax
	movl	%eax, (%esp)
	call	fclose
	movl	-12(%ebp), %eax
	xorl	%gs:20, %eax
	je	.L179
	call	__stack_chk_fail
.L179:
	addl	$10068, %esp
	popl	%ebx
	popl	%ebp
	ret
	.size	read_config, .-read_config
	.section	.rodata
	.align 4
.LC101:
	.string	"%s: value required for %s option\n"
	.text
	.type	value_required, @function
value_required:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%ebx
	subl	$20, %esp
	cmpl	$0, 12(%ebp)
	jne	.L183
	movl	argv0, %ecx
	movl	$.LC101, %edx
	movl	stderr, %eax
	movl	8(%ebp), %ebx
	movl	%ebx, 12(%esp)
	movl	%ecx, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	fprintf
	movl	$1, (%esp)
	call	exit
.L183:
	addl	$20, %esp
	popl	%ebx
	popl	%ebp
	ret
	.size	value_required, .-value_required
	.section	.rodata
	.align 4
.LC102:
	.string	"%s: no value required for %s option\n"
	.text
	.type	no_value_required, @function
no_value_required:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%ebx
	subl	$20, %esp
	cmpl	$0, 12(%ebp)
	je	.L186
	movl	argv0, %ecx
	movl	$.LC102, %edx
	movl	stderr, %eax
	movl	8(%ebp), %ebx
	movl	%ebx, 12(%esp)
	movl	%ecx, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	fprintf
	movl	$1, (%esp)
	call	exit
.L186:
	addl	$20, %esp
	popl	%ebx
	popl	%ebp
	ret
	.size	no_value_required, .-no_value_required
	.section	.rodata
	.align 4
.LC103:
	.string	"out of memory copying a string"
	.align 4
.LC104:
	.string	"%s: out of memory copying a string\n"
	.text
	.type	e_strdup, @function
e_strdup:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$40, %esp
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	strdup
	movl	%eax, -12(%ebp)
	cmpl	$0, -12(%ebp)
	jne	.L188
	movl	$.LC103, 4(%esp)
	movl	$2, (%esp)
	call	syslog
	movl	argv0, %ecx
	movl	$.LC104, %edx
	movl	stderr, %eax
	movl	%ecx, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	fprintf
	movl	$1, (%esp)
	call	exit
.L188:
	movl	-12(%ebp), %eax
	leave
	ret
	.size	e_strdup, .-e_strdup
	.section	.rodata
.LC105:
	.string	"%d"
.LC106:
	.string	"getaddrinfo %.80s - %.80s"
.LC107:
	.string	"%s: getaddrinfo %s - %s\n"
	.align 4
.LC108:
	.string	"%.80s - sockaddr too small (%lu < %lu)"
	.text
	.type	lookup_hostname, @function
lookup_hostname:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%esi
	pushl	%ebx
	addl	$-128, %esp
	movl	8(%ebp), %eax
	movl	%eax, -92(%ebp)
	movl	16(%ebp), %eax
	movl	%eax, -96(%ebp)
	movl	20(%ebp), %eax
	movl	%eax, -100(%ebp)
	movl	28(%ebp), %eax
	movl	%eax, -104(%ebp)
	movl	%gs:20, %eax
	movl	%eax, -12(%ebp)
	xorl	%eax, %eax
	movl	$32, 8(%esp)
	movl	$0, 4(%esp)
	leal	-76(%ebp), %eax
	movl	%eax, (%esp)
	call	memset
	movl	$0, -72(%ebp)
	movl	$1, -76(%ebp)
	movl	$1, -68(%ebp)
	movzwl	port, %eax
	movzwl	%ax, %edx
	movl	$.LC105, %eax
	movl	%edx, 12(%esp)
	movl	%eax, 8(%esp)
	movl	$10, 4(%esp)
	leal	-22(%ebp), %eax
	movl	%eax, (%esp)
	call	snprintf
	leal	-76(%ebp), %ecx
	leal	-22(%ebp), %edx
	movl	hostname, %eax
	leal	-32(%ebp), %ebx
	movl	%ebx, 12(%esp)
	movl	%ecx, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	getaddrinfo
	movl	%eax, -28(%ebp)
	cmpl	$0, -28(%ebp)
	je	.L191
	movl	-28(%ebp), %eax
	movl	%eax, (%esp)
	call	gai_strerror
	movl	hostname, %edx
	movl	%eax, 12(%esp)
	movl	%edx, 8(%esp)
	movl	$.LC106, 4(%esp)
	movl	$2, (%esp)
	call	syslog
	movl	-28(%ebp), %eax
	movl	%eax, (%esp)
	call	gai_strerror
	movl	hostname, %esi
	movl	argv0, %ebx
	movl	$.LC107, %ecx
	movl	stderr, %edx
	movl	%eax, 16(%esp)
	movl	%esi, 12(%esp)
	movl	%ebx, 8(%esp)
	movl	%ecx, 4(%esp)
	movl	%edx, (%esp)
	call	fprintf
	movl	$1, (%esp)
	call	exit
.L191:
	movl	$0, -40(%ebp)
	movl	$0, -44(%ebp)
	movl	-32(%ebp), %eax
	movl	%eax, -36(%ebp)
	jmp	.L192
.L197:
	movl	-36(%ebp), %eax
	movl	4(%eax), %eax
	cmpl	$2, %eax
	je	.L194
	cmpl	$10, %eax
	jne	.L193
.L195:
	cmpl	$0, -40(%ebp)
	jne	.L206
	movl	-36(%ebp), %eax
	movl	%eax, -40(%ebp)
	jmp	.L193
.L194:
	cmpl	$0, -44(%ebp)
	jne	.L193
	movl	-36(%ebp), %eax
	movl	%eax, -44(%ebp)
	jmp	.L193
.L206:
	nop
.L193:
	movl	-36(%ebp), %eax
	movl	28(%eax), %eax
	movl	%eax, -36(%ebp)
.L192:
	cmpl	$0, -36(%ebp)
	jne	.L197
	cmpl	$0, -40(%ebp)
	jne	.L198
	movl	-104(%ebp), %eax
	movl	$0, (%eax)
	jmp	.L199
.L198:
	movl	-40(%ebp), %eax
	movl	16(%eax), %eax
	cmpl	24(%ebp), %eax
	jbe	.L200
	movl	-40(%ebp), %eax
	movl	16(%eax), %edx
	movl	hostname, %eax
	movl	%edx, 16(%esp)
	movl	24(%ebp), %edx
	movl	%edx, 12(%esp)
	movl	%eax, 8(%esp)
	movl	$.LC108, 4(%esp)
	movl	$2, (%esp)
	call	syslog
	movl	$1, (%esp)
	call	exit
.L200:
	movl	24(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	$0, 4(%esp)
	movl	-100(%ebp), %eax
	movl	%eax, (%esp)
	call	memset
	movl	-40(%ebp), %eax
	movl	16(%eax), %edx
	movl	-40(%ebp), %eax
	movl	20(%eax), %eax
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	-100(%ebp), %eax
	movl	%eax, (%esp)
	call	memmove
	movl	-104(%ebp), %eax
	movl	$1, (%eax)
.L199:
	cmpl	$0, -44(%ebp)
	jne	.L201
	movl	-96(%ebp), %eax
	movl	$0, (%eax)
	jmp	.L202
.L201:
	movl	-44(%ebp), %eax
	movl	16(%eax), %eax
	cmpl	12(%ebp), %eax
	jbe	.L203
	movl	-44(%ebp), %eax
	movl	16(%eax), %edx
	movl	hostname, %eax
	movl	%edx, 16(%esp)
	movl	12(%ebp), %edx
	movl	%edx, 12(%esp)
	movl	%eax, 8(%esp)
	movl	$.LC108, 4(%esp)
	movl	$2, (%esp)
	call	syslog
	movl	$1, (%esp)
	call	exit
.L203:
	movl	12(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	$0, 4(%esp)
	movl	-92(%ebp), %eax
	movl	%eax, (%esp)
	call	memset
	movl	-44(%ebp), %eax
	movl	16(%eax), %edx
	movl	-44(%ebp), %eax
	movl	20(%eax), %eax
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	-92(%ebp), %eax
	movl	%eax, (%esp)
	call	memmove
	movl	-96(%ebp), %eax
	movl	$1, (%eax)
.L202:
	movl	-32(%ebp), %eax
	movl	%eax, (%esp)
	call	freeaddrinfo
	movl	-12(%ebp), %eax
	xorl	%gs:20, %eax
	je	.L205
	call	__stack_chk_fail
.L205:
	subl	$-128, %esp
	popl	%ebx
	popl	%esi
	popl	%ebp
	ret
	.size	lookup_hostname, .-lookup_hostname
	.section	.rodata
.LC109:
	.string	" %4900[^ \t] %ld-%ld"
.LC110:
	.string	" %4900[^ \t] %ld"
	.align 4
.LC111:
	.string	"unparsable line in %.80s - %.80s"
	.align 4
.LC112:
	.string	"%s: unparsable line in %.80s - %.80s\n"
.LC113:
	.string	"|/"
	.align 4
.LC114:
	.string	"out of memory allocating a throttletab"
	.align 4
.LC115:
	.string	"%s: out of memory allocating a throttletab\n"
	.text
	.type	read_throttlefile, @function
read_throttlefile:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%ebx
	subl	$10084, %esp
	movl	8(%ebp), %eax
	movl	%eax, -10044(%ebp)
	movl	%gs:20, %eax
	movl	%eax, -12(%ebp)
	xorl	%eax, %eax
	movl	$.LC72, %edx
	movl	-10044(%ebp), %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	fopen
	movl	%eax, -10016(%ebp)
	cmpl	$0, -10016(%ebp)
	jne	.L208
	movl	-10044(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	$.LC13, 4(%esp)
	movl	$2, (%esp)
	call	syslog
	movl	-10044(%ebp), %eax
	movl	%eax, (%esp)
	call	perror
	movl	$1, (%esp)
	call	exit
.L208:
	movl	$0, 4(%esp)
	leal	-10040(%ebp), %eax
	movl	%eax, (%esp)
	call	gettimeofday
	jmp	.L209
.L223:
	movl	$35, 4(%esp)
	leal	-5012(%ebp), %eax
	movl	%eax, (%esp)
	call	strchr
	movl	%eax, -10020(%ebp)
	cmpl	$0, -10020(%ebp)
	je	.L210
	movl	-10020(%ebp), %eax
	movb	$0, (%eax)
.L210:
	leal	-5012(%ebp), %eax
	movl	%eax, (%esp)
	call	strlen
	movl	%eax, -10024(%ebp)
	jmp	.L211
.L213:
	subl	$1, -10024(%ebp)
	movl	-10024(%ebp), %eax
	movb	$0, -5012(%ebp,%eax)
.L211:
	cmpl	$0, -10024(%ebp)
	jle	.L212
	movl	-10024(%ebp), %eax
	subl	$1, %eax
	movzbl	-5012(%ebp,%eax), %eax
	cmpb	$32, %al
	je	.L213
	movl	-10024(%ebp), %eax
	subl	$1, %eax
	movzbl	-5012(%ebp,%eax), %eax
	cmpb	$9, %al
	je	.L213
	movl	-10024(%ebp), %eax
	subl	$1, %eax
	movzbl	-5012(%ebp,%eax), %eax
	cmpb	$10, %al
	je	.L213
	movl	-10024(%ebp), %eax
	subl	$1, %eax
	movzbl	-5012(%ebp,%eax), %eax
	cmpb	$13, %al
	je	.L213
.L212:
	cmpl	$0, -10024(%ebp)
	je	.L226
.L214:
	movl	$.LC109, %edx
	leal	-5012(%ebp), %eax
	leal	-10028(%ebp), %ecx
	movl	%ecx, 16(%esp)
	leal	-10032(%ebp), %ecx
	movl	%ecx, 12(%esp)
	leal	-10012(%ebp), %ecx
	movl	%ecx, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__isoc99_sscanf
	cmpl	$3, %eax
	je	.L215
	movl	$.LC110, %edx
	leal	-5012(%ebp), %eax
	leal	-10028(%ebp), %ecx
	movl	%ecx, 12(%esp)
	leal	-10012(%ebp), %ecx
	movl	%ecx, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__isoc99_sscanf
	cmpl	$2, %eax
	jne	.L216
	movl	$0, -10032(%ebp)
	jmp	.L215
.L216:
	leal	-5012(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	-10044(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	$.LC111, 4(%esp)
	movl	$2, (%esp)
	call	syslog
	movl	argv0, %ecx
	movl	$.LC112, %edx
	movl	stderr, %eax
	leal	-5012(%ebp), %ebx
	movl	%ebx, 16(%esp)
	movl	-10044(%ebp), %ebx
	movl	%ebx, 12(%esp)
	movl	%ecx, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	fprintf
	jmp	.L209
.L215:
	movzbl	-10012(%ebp), %eax
	cmpb	$47, %al
	jne	.L218
	leal	-10012(%ebp), %eax
	addl	$1, %eax
	movl	%eax, 4(%esp)
	leal	-10012(%ebp), %eax
	movl	%eax, (%esp)
	call	strcpy
	jmp	.L218
.L219:
	movl	-10020(%ebp), %eax
	leal	2(%eax), %edx
	movl	-10020(%ebp), %eax
	addl	$1, %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	strcpy
.L218:
	movl	$.LC113, 4(%esp)
	leal	-10012(%ebp), %eax
	movl	%eax, (%esp)
	call	strstr
	movl	%eax, -10020(%ebp)
	cmpl	$0, -10020(%ebp)
	jne	.L219
	movl	numthrottles, %edx
	movl	maxthrottles, %eax
	cmpl	%eax, %edx
	jl	.L220
	movl	maxthrottles, %eax
	testl	%eax, %eax
	jne	.L221
	movl	$100, maxthrottles
	movl	maxthrottles, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	movl	%eax, (%esp)
	call	malloc
	movl	%eax, throttles
	jmp	.L222
.L221:
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
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	realloc
	movl	%eax, throttles
.L222:
	movl	throttles, %eax
	testl	%eax, %eax
	jne	.L220
	movl	$.LC114, 4(%esp)
	movl	$2, (%esp)
	call	syslog
	movl	argv0, %ecx
	movl	$.LC115, %edx
	movl	stderr, %eax
	movl	%ecx, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	fprintf
	movl	$1, (%esp)
	call	exit
.L220:
	movl	throttles, %ecx
	movl	numthrottles, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ecx,%eax), %ebx
	leal	-10012(%ebp), %eax
	movl	%eax, (%esp)
	call	e_strdup
	movl	%eax, (%ebx)
	movl	throttles, %ecx
	movl	numthrottles, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ecx,%eax), %edx
	movl	-10028(%ebp), %eax
	movl	%eax, 4(%edx)
	movl	throttles, %ecx
	movl	numthrottles, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ecx,%eax), %edx
	movl	-10032(%ebp), %eax
	movl	%eax, 8(%edx)
	movl	throttles, %ecx
	movl	numthrottles, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ecx,%eax), %eax
	movl	$0, 12(%eax)
	movl	throttles, %ecx
	movl	numthrottles, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ecx,%eax), %eax
	movl	$0, 16(%eax)
	movl	throttles, %ecx
	movl	numthrottles, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ecx,%eax), %eax
	movl	$0, 20(%eax)
	movl	numthrottles, %eax
	addl	$1, %eax
	movl	%eax, numthrottles
	jmp	.L209
.L226:
	nop
.L209:
	movl	-10016(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	$5000, 4(%esp)
	leal	-5012(%ebp), %eax
	movl	%eax, (%esp)
	call	fgets
	testl	%eax, %eax
	jne	.L223
	movl	-10016(%ebp), %eax
	movl	%eax, (%esp)
	call	fclose
	movl	-12(%ebp), %eax
	xorl	%gs:20, %eax
	je	.L225
	call	__stack_chk_fail
.L225:
	addl	$10084, %esp
	popl	%ebx
	popl	%ebp
	ret
	.size	read_throttlefile, .-read_throttlefile
	.type	shut_down, @function
shut_down:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$40, %esp
	movl	$0, 4(%esp)
	leal	-24(%ebp), %eax
	movl	%eax, (%esp)
	call	gettimeofday
	leal	-24(%ebp), %eax
	movl	%eax, (%esp)
	call	logstats
	movl	$0, -12(%ebp)
	jmp	.L228
.L231:
	movl	connects, %ecx
	movl	-12(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$5, %eax
	leal	(%ecx,%eax), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	je	.L229
	movl	connects, %ecx
	movl	-12(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$5, %eax
	leal	(%ecx,%eax), %eax
	movl	8(%eax), %eax
	leal	-24(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	httpd_close_conn
.L229:
	movl	connects, %ecx
	movl	-12(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$5, %eax
	leal	(%ecx,%eax), %eax
	movl	8(%eax), %eax
	testl	%eax, %eax
	je	.L230
	movl	connects, %ecx
	movl	-12(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$5, %eax
	leal	(%ecx,%eax), %eax
	movl	8(%eax), %eax
	movl	%eax, (%esp)
	call	httpd_destroy_conn
	movl	connects, %ecx
	movl	-12(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$5, %eax
	leal	(%ecx,%eax), %eax
	movl	8(%eax), %eax
	movl	%eax, (%esp)
	call	free
	movl	httpd_conn_count, %eax
	subl	$1, %eax
	movl	%eax, httpd_conn_count
	movl	connects, %ecx
	movl	-12(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$5, %eax
	leal	(%ecx,%eax), %eax
	movl	$0, 8(%eax)
.L230:
	addl	$1, -12(%ebp)
.L228:
	movl	max_connects, %eax
	cmpl	%eax, -12(%ebp)
	jl	.L231
	movl	hs, %eax
	testl	%eax, %eax
	je	.L232
	movl	hs, %eax
	movl	%eax, -16(%ebp)
	movl	$0, hs
	movl	-16(%ebp), %eax
	movl	40(%eax), %eax
	cmpl	$-1, %eax
	je	.L233
	movl	-16(%ebp), %eax
	movl	40(%eax), %eax
	movl	%eax, (%esp)
	call	fdwatch_del_fd
.L233:
	movl	-16(%ebp), %eax
	movl	44(%eax), %eax
	cmpl	$-1, %eax
	je	.L234
	movl	-16(%ebp), %eax
	movl	44(%eax), %eax
	movl	%eax, (%esp)
	call	fdwatch_del_fd
.L234:
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	httpd_terminate
.L232:
	call	mmc_destroy
	call	tmr_destroy
	movl	connects, %eax
	movl	%eax, (%esp)
	call	free
	movl	throttles, %eax
	testl	%eax, %eax
	je	.L236
	movl	throttles, %eax
	movl	%eax, (%esp)
	call	free
.L236:
	leave
	ret
	.size	shut_down, .-shut_down
	.section	.rodata
.LC116:
	.string	"too many connections!"
	.align 4
.LC117:
	.string	"the connects free list is messed up"
	.align 4
.LC118:
	.string	"out of memory allocating an httpd_conn"
	.text
	.type	handle_newconnect, @function
handle_newconnect:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$40, %esp
	jmp	.L248
.L251:
	nop
.L248:
	movl	num_connects, %edx
	movl	max_connects, %eax
	cmpl	%eax, %edx
	jl	.L238
	movl	$.LC116, 4(%esp)
	movl	$4, (%esp)
	call	syslog
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	tmr_run
	movl	$0, %eax
	jmp	.L239
.L238:
	movl	first_free_connect, %eax
	cmpl	$-1, %eax
	je	.L240
	movl	connects, %ecx
	movl	first_free_connect, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$5, %eax
	leal	(%ecx,%eax), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	je	.L241
.L240:
	movl	$.LC117, 4(%esp)
	movl	$2, (%esp)
	call	syslog
	movl	$1, (%esp)
	call	exit
.L241:
	movl	connects, %ecx
	movl	first_free_connect, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$5, %eax
	leal	(%ecx,%eax), %eax
	movl	%eax, -12(%ebp)
	movl	-12(%ebp), %eax
	movl	8(%eax), %eax
	testl	%eax, %eax
	jne	.L242
	movl	$456, (%esp)
	call	malloc
	movl	%eax, %edx
	movl	-12(%ebp), %eax
	movl	%edx, 8(%eax)
	movl	-12(%ebp), %eax
	movl	8(%eax), %eax
	testl	%eax, %eax
	jne	.L243
	movl	$.LC118, 4(%esp)
	movl	$2, (%esp)
	call	syslog
	movl	$1, (%esp)
	call	exit
.L243:
	movl	-12(%ebp), %eax
	movl	8(%eax), %eax
	movl	$0, (%eax)
	movl	httpd_conn_count, %eax
	addl	$1, %eax
	movl	%eax, httpd_conn_count
.L242:
	movl	-12(%ebp), %eax
	movl	8(%eax), %edx
	movl	hs, %eax
	movl	%edx, 8(%esp)
	movl	12(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	httpd_get_conn
	testl	%eax, %eax
	je	.L245
	cmpl	$2, %eax
	je	.L246
	jmp	.L250
.L245:
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	tmr_run
	movl	$0, %eax
	jmp	.L239
.L246:
	movl	$1, %eax
	jmp	.L239
.L250:
	movl	-12(%ebp), %eax
	movl	$1, (%eax)
	movl	-12(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, first_free_connect
	movl	-12(%ebp), %eax
	movl	$-1, 4(%eax)
	movl	num_connects, %eax
	addl	$1, %eax
	movl	%eax, num_connects
	movl	-12(%ebp), %eax
	movl	%eax, -16(%ebp)
	movl	8(%ebp), %eax
	movl	(%eax), %edx
	movl	-12(%ebp), %eax
	movl	%edx, 68(%eax)
	movl	-12(%ebp), %eax
	movl	$0, 72(%eax)
	movl	-12(%ebp), %eax
	movl	$0, 76(%eax)
	movl	-12(%ebp), %eax
	movl	$0, 92(%eax)
	movl	-12(%ebp), %eax
	movl	$0, 52(%eax)
	movl	-12(%ebp), %eax
	movl	8(%eax), %eax
	movl	448(%eax), %eax
	movl	%eax, (%esp)
	call	httpd_set_ndelay
	movl	-12(%ebp), %eax
	movl	8(%eax), %eax
	movl	448(%eax), %eax
	movl	$0, 8(%esp)
	movl	-12(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	fdwatch_add_fd
	movl	stats_connections, %eax
	addl	$1, %eax
	movl	%eax, stats_connections
	movl	num_connects, %edx
	movl	stats_simultaneous, %eax
	cmpl	%eax, %edx
	jle	.L251
	movl	num_connects, %eax
	movl	%eax, stats_simultaneous
	jmp	.L248
.L239:
	leave
	ret
	.size	handle_newconnect, .-handle_newconnect
	.type	handle_read, @function
handle_read:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%ebx
	subl	$52, %esp
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, -20(%ebp)
	movl	-20(%ebp), %eax
	movl	144(%eax), %edx
	movl	-20(%ebp), %eax
	movl	140(%eax), %eax
	cmpl	%eax, %edx
	jb	.L253
	movl	-20(%ebp), %eax
	movl	140(%eax), %eax
	cmpl	$5000, %eax
	jbe	.L254
	movl	httpd_err400form, %edx
	movl	httpd_err400title, %eax
	movl	$.LC46, 20(%esp)
	movl	%edx, 16(%esp)
	movl	$.LC46, 12(%esp)
	movl	%eax, 8(%esp)
	movl	$400, 4(%esp)
	movl	-20(%ebp), %eax
	movl	%eax, (%esp)
	call	httpd_send_err
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	finish_connection
	jmp	.L273
.L254:
	movl	-20(%ebp), %eax
	movl	140(%eax), %eax
	leal	1000(%eax), %ecx
	movl	-20(%ebp), %eax
	leal	140(%eax), %edx
	movl	-20(%ebp), %eax
	addl	$136, %eax
	movl	%ecx, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	httpd_realloc_str
.L253:
	movl	-20(%ebp), %eax
	movl	140(%eax), %edx
	movl	-20(%ebp), %eax
	movl	136(%eax), %ecx
	movl	-20(%ebp), %eax
	movl	144(%eax), %eax
	addl	%eax, %ecx
	movl	-20(%ebp), %eax
	movl	448(%eax), %eax
	movl	%edx, 8(%esp)
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	call	read
	movl	%eax, -12(%ebp)
	cmpl	$0, -12(%ebp)
	jne	.L256
	movl	httpd_err400form, %edx
	movl	httpd_err400title, %eax
	movl	$.LC46, 20(%esp)
	movl	%edx, 16(%esp)
	movl	$.LC46, 12(%esp)
	movl	%eax, 8(%esp)
	movl	$400, 4(%esp)
	movl	-20(%ebp), %eax
	movl	%eax, (%esp)
	call	httpd_send_err
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	finish_connection
	jmp	.L273
.L256:
	cmpl	$0, -12(%ebp)
	jns	.L257
	call	__errno_location
	movl	(%eax), %eax
	cmpl	$4, %eax
	je	.L275
	call	__errno_location
	movl	(%eax), %eax
	cmpl	$11, %eax
	je	.L276
	call	__errno_location
	movl	(%eax), %eax
	cmpl	$11, %eax
	je	.L277
.L259:
	movl	httpd_err400form, %edx
	movl	httpd_err400title, %eax
	movl	$.LC46, 20(%esp)
	movl	%edx, 16(%esp)
	movl	$.LC46, 12(%esp)
	movl	%eax, 8(%esp)
	movl	$400, 4(%esp)
	movl	-20(%ebp), %eax
	movl	%eax, (%esp)
	call	httpd_send_err
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	finish_connection
	jmp	.L273
.L257:
	movl	-20(%ebp), %eax
	movl	144(%eax), %edx
	movl	-12(%ebp), %eax
	addl	%eax, %edx
	movl	-20(%ebp), %eax
	movl	%edx, 144(%eax)
	movl	12(%ebp), %eax
	movl	(%eax), %edx
	movl	8(%ebp), %eax
	movl	%edx, 68(%eax)
	movl	-20(%ebp), %eax
	movl	%eax, (%esp)
	call	httpd_got_request
	testl	%eax, %eax
	je	.L278
	cmpl	$2, %eax
	jne	.L274
.L262:
	movl	httpd_err400form, %edx
	movl	httpd_err400title, %eax
	movl	$.LC46, 20(%esp)
	movl	%edx, 16(%esp)
	movl	$.LC46, 12(%esp)
	movl	%eax, 8(%esp)
	movl	$400, 4(%esp)
	movl	-20(%ebp), %eax
	movl	%eax, (%esp)
	call	httpd_send_err
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	finish_connection
	jmp	.L273
.L274:
	movl	-20(%ebp), %eax
	movl	%eax, (%esp)
	call	httpd_parse_request
	testl	%eax, %eax
	jns	.L263
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	finish_connection
	jmp	.L273
.L263:
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	check_throttles
	testl	%eax, %eax
	jne	.L264
	movl	-20(%ebp), %eax
	movl	172(%eax), %ecx
	movl	httpd_err503form, %edx
	movl	httpd_err503title, %eax
	movl	%ecx, 20(%esp)
	movl	%edx, 16(%esp)
	movl	$.LC46, 12(%esp)
	movl	%eax, 8(%esp)
	movl	$503, 4(%esp)
	movl	-20(%ebp), %eax
	movl	%eax, (%esp)
	call	httpd_send_err
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	finish_connection
	jmp	.L273
.L264:
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-20(%ebp), %eax
	movl	%eax, (%esp)
	call	httpd_start_request
	testl	%eax, %eax
	jns	.L265
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	finish_connection
	jmp	.L273
.L265:
	movl	-20(%ebp), %eax
	movl	336(%eax), %eax
	testl	%eax, %eax
	je	.L266
	movl	-20(%ebp), %eax
	movl	344(%eax), %edx
	movl	8(%ebp), %eax
	movl	%edx, 92(%eax)
	movl	-20(%ebp), %eax
	movl	348(%eax), %eax
	leal	1(%eax), %edx
	movl	8(%ebp), %eax
	movl	%edx, 88(%eax)
	jmp	.L267
.L266:
	movl	-20(%ebp), %eax
	movl	164(%eax), %eax
	testl	%eax, %eax
	jns	.L268
	movl	8(%ebp), %eax
	movl	$0, 88(%eax)
	jmp	.L267
.L268:
	movl	-20(%ebp), %eax
	movl	164(%eax), %edx
	movl	8(%ebp), %eax
	movl	%edx, 88(%eax)
.L267:
	movl	-20(%ebp), %eax
	movl	452(%eax), %eax
	testl	%eax, %eax
	jne	.L269
	movl	$0, -24(%ebp)
	jmp	.L270
.L271:
	movl	throttles, %ecx
	movl	-24(%ebp), %edx
	movl	8(%ebp), %eax
	movl	12(%eax,%edx,4), %eax
	movl	%eax, %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	addl	%eax, %ecx
	movl	throttles, %ebx
	movl	-24(%ebp), %edx
	movl	8(%ebp), %eax
	movl	12(%eax,%edx,4), %eax
	movl	%eax, %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ebx,%eax), %eax
	movl	16(%eax), %edx
	movl	-20(%ebp), %eax
	movl	168(%eax), %eax
	leal	(%edx,%eax), %eax
	movl	%eax, 16(%ecx)
	addl	$1, -24(%ebp)
.L270:
	movl	8(%ebp), %eax
	movl	52(%eax), %eax
	cmpl	-24(%ebp), %eax
	jg	.L271
	movl	-20(%ebp), %eax
	movl	168(%eax), %edx
	movl	8(%ebp), %eax
	movl	%edx, 92(%eax)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	finish_connection
	jmp	.L273
.L269:
	movl	8(%ebp), %eax
	movl	92(%eax), %edx
	movl	8(%ebp), %eax
	movl	88(%eax), %eax
	cmpl	%eax, %edx
	jl	.L272
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	finish_connection
	jmp	.L273
.L272:
	movl	8(%ebp), %eax
	movl	$2, (%eax)
	movl	12(%ebp), %eax
	movl	(%eax), %edx
	movl	8(%ebp), %eax
	movl	%edx, 64(%eax)
	movl	8(%ebp), %eax
	movl	$0, 80(%eax)
	movl	8(%ebp), %eax
	movl	%eax, -16(%ebp)
	movl	-20(%ebp), %eax
	movl	448(%eax), %eax
	movl	%eax, (%esp)
	call	fdwatch_del_fd
	movl	-20(%ebp), %eax
	movl	448(%eax), %eax
	movl	$1, 8(%esp)
	movl	8(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	fdwatch_add_fd
	jmp	.L273
.L275:
	nop
	jmp	.L273
.L276:
	nop
	jmp	.L273
.L277:
	nop
	jmp	.L273
.L278:
	nop
.L273:
	addl	$52, %esp
	popl	%ebx
	popl	%ebp
	ret
	.size	handle_read, .-handle_read
	.section	.rodata
	.align 4
.LC119:
	.string	"replacing non-null wakeup_timer!"
	.align 4
.LC120:
	.string	"tmr_create(wakeup_connection) failed"
.LC121:
	.string	"write - %m sending %.80s"
	.text
	.type	handle_send, @function
handle_send:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%ebx
	subl	$100, %esp
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, -32(%ebp)
	movl	8(%ebp), %eax
	movl	56(%eax), %eax
	cmpl	$-1, %eax
	jne	.L280
	movl	$1000000000, -12(%ebp)
	jmp	.L281
.L280:
	movl	8(%ebp), %eax
	movl	56(%eax), %eax
	leal	3(%eax), %edx
	testl	%eax, %eax
	cmovs	%edx, %eax
	sarl	$2, %eax
	movl	%eax, -12(%ebp)
.L281:
	movl	-32(%ebp), %eax
	movl	304(%eax), %eax
	testl	%eax, %eax
	jne	.L282
	movl	8(%ebp), %eax
	movl	88(%eax), %edx
	movl	8(%ebp), %eax
	movl	92(%eax), %eax
	movl	%edx, %ecx
	subl	%eax, %ecx
	movl	%ecx, %eax
	movl	%eax, %edx
	movl	-12(%ebp), %eax
	cmpl	%eax, %edx
	cmova	%eax, %edx
	movl	-32(%ebp), %eax
	movl	452(%eax), %ecx
	movl	8(%ebp), %eax
	movl	92(%eax), %eax
	addl	%eax, %ecx
	movl	-32(%ebp), %eax
	movl	448(%eax), %eax
	movl	%edx, 8(%esp)
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	call	write
	movl	%eax, -16(%ebp)
	jmp	.L283
.L282:
	movl	-32(%ebp), %eax
	movl	252(%eax), %eax
	movl	%eax, -56(%ebp)
	movl	-32(%ebp), %eax
	movl	304(%eax), %eax
	movl	%eax, -52(%ebp)
	movl	-32(%ebp), %eax
	movl	452(%eax), %edx
	movl	8(%ebp), %eax
	movl	92(%eax), %eax
	leal	(%edx,%eax), %eax
	movl	%eax, -48(%ebp)
	movl	8(%ebp), %eax
	movl	88(%eax), %edx
	movl	8(%ebp), %eax
	movl	92(%eax), %eax
	movl	%edx, %ecx
	subl	%eax, %ecx
	movl	%ecx, %eax
	movl	%eax, %edx
	movl	-12(%ebp), %eax
	cmpl	%eax, %edx
	cmovbe	%edx, %eax
	movl	%eax, -44(%ebp)
	movl	-32(%ebp), %eax
	movl	448(%eax), %eax
	movl	$2, 8(%esp)
	leal	-56(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	writev
	movl	%eax, -16(%ebp)
.L283:
	cmpl	$0, -16(%ebp)
	jns	.L284
	call	__errno_location
	movl	(%eax), %eax
	cmpl	$4, %eax
	je	.L303
.L284:
	cmpl	$0, -16(%ebp)
	je	.L286
	cmpl	$0, -16(%ebp)
	jns	.L287
	call	__errno_location
	movl	(%eax), %eax
	cmpl	$11, %eax
	je	.L286
	call	__errno_location
	movl	(%eax), %eax
	cmpl	$11, %eax
	jne	.L287
.L286:
	movl	8(%ebp), %eax
	movl	80(%eax), %eax
	leal	100(%eax), %edx
	movl	8(%ebp), %eax
	movl	%edx, 80(%eax)
	movl	8(%ebp), %eax
	movl	$3, (%eax)
	movl	-32(%ebp), %eax
	movl	448(%eax), %eax
	movl	%eax, (%esp)
	call	fdwatch_del_fd
	movl	8(%ebp), %eax
	movl	%eax, -24(%ebp)
	movl	8(%ebp), %eax
	movl	72(%eax), %eax
	testl	%eax, %eax
	je	.L288
	movl	$.LC119, 4(%esp)
	movl	$3, (%esp)
	call	syslog
.L288:
	movl	8(%ebp), %eax
	movl	80(%eax), %eax
	movl	$0, 16(%esp)
	movl	%eax, 12(%esp)
	movl	-24(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	$wakeup_connection, 4(%esp)
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	tmr_create
	movl	8(%ebp), %edx
	movl	%eax, 72(%edx)
	movl	8(%ebp), %eax
	movl	72(%eax), %eax
	testl	%eax, %eax
	jne	.L304
	movl	$.LC120, 4(%esp)
	movl	$2, (%esp)
	call	syslog
	movl	$1, (%esp)
	call	exit
.L287:
	cmpl	$0, -16(%ebp)
	jns	.L290
	call	__errno_location
	movl	(%eax), %eax
	cmpl	$32, %eax
	je	.L291
	call	__errno_location
	movl	(%eax), %eax
	cmpl	$22, %eax
	je	.L291
	call	__errno_location
	movl	(%eax), %eax
	cmpl	$104, %eax
	je	.L291
	movl	-32(%ebp), %eax
	movl	172(%eax), %eax
	movl	%eax, 8(%esp)
	movl	$.LC121, 4(%esp)
	movl	$3, (%esp)
	call	syslog
.L291:
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	clear_connection
	jmp	.L302
.L290:
	movl	12(%ebp), %eax
	movl	(%eax), %edx
	movl	8(%ebp), %eax
	movl	%edx, 68(%eax)
	movl	-32(%ebp), %eax
	movl	304(%eax), %eax
	testl	%eax, %eax
	je	.L292
	movl	-16(%ebp), %edx
	movl	-32(%ebp), %eax
	movl	304(%eax), %eax
	cmpl	%eax, %edx
	jae	.L293
	movl	-32(%ebp), %eax
	movl	304(%eax), %edx
	movl	-16(%ebp), %eax
	movl	%edx, %ecx
	subl	%eax, %ecx
	movl	%ecx, %eax
	movl	%eax, -40(%ebp)
	movl	-40(%ebp), %edx
	movl	-32(%ebp), %eax
	movl	252(%eax), %ecx
	movl	-16(%ebp), %eax
	addl	%eax, %ecx
	movl	-32(%ebp), %eax
	movl	252(%eax), %eax
	movl	%edx, 8(%esp)
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	call	memmove
	movl	-40(%ebp), %edx
	movl	-32(%ebp), %eax
	movl	%edx, 304(%eax)
	movl	$0, -16(%ebp)
	jmp	.L292
.L293:
	movl	-16(%ebp), %edx
	movl	-32(%ebp), %eax
	movl	304(%eax), %eax
	movl	%edx, %ecx
	subl	%eax, %ecx
	movl	%ecx, %eax
	movl	%eax, -16(%ebp)
	movl	-32(%ebp), %eax
	movl	$0, 304(%eax)
.L292:
	movl	8(%ebp), %eax
	movl	92(%eax), %eax
	movl	%eax, %edx
	addl	-16(%ebp), %edx
	movl	8(%ebp), %eax
	movl	%edx, 92(%eax)
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	8(%ebp), %edx
	movl	8(%edx), %edx
	movl	168(%edx), %edx
	addl	-16(%ebp), %edx
	movl	%edx, 168(%eax)
	movl	$0, -36(%ebp)
	jmp	.L294
.L295:
	movl	throttles, %ecx
	movl	-36(%ebp), %edx
	movl	8(%ebp), %eax
	movl	12(%eax,%edx,4), %eax
	movl	%eax, %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	addl	%eax, %ecx
	movl	throttles, %ebx
	movl	-36(%ebp), %edx
	movl	8(%ebp), %eax
	movl	12(%eax,%edx,4), %eax
	movl	%eax, %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ebx,%eax), %eax
	movl	16(%eax), %eax
	addl	-16(%ebp), %eax
	movl	%eax, 16(%ecx)
	addl	$1, -36(%ebp)
.L294:
	movl	8(%ebp), %eax
	movl	52(%eax), %eax
	cmpl	-36(%ebp), %eax
	jg	.L295
	movl	8(%ebp), %eax
	movl	92(%eax), %edx
	movl	8(%ebp), %eax
	movl	88(%eax), %eax
	cmpl	%eax, %edx
	jl	.L296
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	finish_connection
	jmp	.L302
.L296:
	movl	8(%ebp), %eax
	movl	80(%eax), %eax
	cmpl	$100, %eax
	jle	.L297
	movl	8(%ebp), %eax
	movl	80(%eax), %eax
	leal	-100(%eax), %edx
	movl	8(%ebp), %eax
	movl	%edx, 80(%eax)
.L297:
	movl	8(%ebp), %eax
	movl	56(%eax), %eax
	cmpl	$-1, %eax
	je	.L302
	movl	12(%ebp), %eax
	movl	(%eax), %edx
	movl	8(%ebp), %eax
	movl	64(%eax), %eax
	movl	%edx, %ecx
	subl	%eax, %ecx
	movl	%ecx, %eax
	movl	%eax, -28(%ebp)
	cmpl	$0, -28(%ebp)
	jne	.L298
	movl	$1, -28(%ebp)
.L298:
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	168(%eax), %eax
	movl	%eax, %edx
	sarl	$31, %edx
	idivl	-28(%ebp)
	movl	%eax, %edx
	movl	8(%ebp), %eax
	movl	56(%eax), %eax
	cmpl	%eax, %edx
	jle	.L302
	movl	8(%ebp), %eax
	movl	$3, (%eax)
	movl	-32(%ebp), %eax
	movl	448(%eax), %eax
	movl	%eax, (%esp)
	call	fdwatch_del_fd
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	168(%eax), %eax
	movl	8(%ebp), %edx
	movl	56(%edx), %edx
	movl	%edx, -60(%ebp)
	movl	%eax, %edx
	sarl	$31, %edx
	idivl	-60(%ebp)
	subl	-28(%ebp), %eax
	movl	%eax, -20(%ebp)
	movl	8(%ebp), %eax
	movl	%eax, -24(%ebp)
	movl	8(%ebp), %eax
	movl	72(%eax), %eax
	testl	%eax, %eax
	je	.L299
	movl	$.LC119, 4(%esp)
	movl	$3, (%esp)
	call	syslog
.L299:
	cmpl	$0, -20(%ebp)
	jle	.L300
	movl	-20(%ebp), %eax
	imull	$1000, %eax, %eax
	jmp	.L301
.L300:
	movl	$500, %eax
.L301:
	movl	$0, 16(%esp)
	movl	%eax, 12(%esp)
	movl	-24(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	$wakeup_connection, 4(%esp)
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	tmr_create
	movl	8(%ebp), %edx
	movl	%eax, 72(%edx)
	movl	8(%ebp), %eax
	movl	72(%eax), %eax
	testl	%eax, %eax
	jne	.L302
	movl	$.LC120, 4(%esp)
	movl	$2, (%esp)
	call	syslog
	movl	$1, (%esp)
	call	exit
.L303:
	nop
	jmp	.L302
.L304:
	nop
.L302:
	addl	$100, %esp
	popl	%ebx
	popl	%ebp
	ret
	.size	handle_send, .-handle_send
	.type	handle_linger, @function
handle_linger:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$4152, %esp
	movl	8(%ebp), %eax
	movl	%eax, -4124(%ebp)
	movl	12(%ebp), %eax
	movl	%eax, -4128(%ebp)
	movl	%gs:20, %eax
	movl	%eax, -12(%ebp)
	xorl	%eax, %eax
	movl	-4124(%ebp), %eax
	movl	8(%eax), %eax
	movl	448(%eax), %eax
	movl	$4096, 8(%esp)
	leal	-4108(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	read
	movl	%eax, -4112(%ebp)
	cmpl	$0, -4112(%ebp)
	jns	.L306
	call	__errno_location
	movl	(%eax), %eax
	cmpl	$4, %eax
	je	.L311
	call	__errno_location
	movl	(%eax), %eax
	cmpl	$11, %eax
	je	.L312
.L306:
	cmpl	$0, -4112(%ebp)
	jg	.L309
	movl	-4128(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-4124(%ebp), %eax
	movl	%eax, (%esp)
	call	really_clear_connection
	jmp	.L309
.L311:
	nop
	jmp	.L309
.L312:
	nop
.L309:
	movl	-12(%ebp), %eax
	xorl	%gs:20, %eax
	je	.L310
	call	__stack_chk_fail
.L310:
	leave
	ret
	.size	handle_linger, .-handle_linger
	.section	.rodata
	.align 4
.LC122:
	.string	"throttle sending count was negative - shouldn't happen!"
	.text
	.type	check_throttles, @function
check_throttles:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%ebx
	subl	$52, %esp
	movl	8(%ebp), %eax
	movl	$0, 52(%eax)
	movl	8(%ebp), %eax
	movl	$-1, 60(%eax)
	movl	8(%ebp), %eax
	movl	60(%eax), %edx
	movl	8(%ebp), %eax
	movl	%edx, 56(%eax)
	movl	$0, -12(%ebp)
	jmp	.L314
.L324:
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	188(%eax), %ecx
	movl	throttles, %ebx
	movl	-12(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ebx,%eax), %eax
	movl	(%eax), %eax
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	call	match
	testl	%eax, %eax
	je	.L315
	movl	throttles, %ecx
	movl	-12(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ecx,%eax), %eax
	movl	12(%eax), %ecx
	movl	throttles, %ebx
	movl	-12(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ebx,%eax), %eax
	movl	4(%eax), %eax
	addl	%eax, %eax
	cmpl	%eax, %ecx
	jle	.L316
	movl	$0, %eax
	jmp	.L317
.L316:
	movl	throttles, %ecx
	movl	-12(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ecx,%eax), %eax
	movl	12(%eax), %ecx
	movl	throttles, %ebx
	movl	-12(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ebx,%eax), %eax
	movl	8(%eax), %eax
	cmpl	%eax, %ecx
	jge	.L318
	movl	$0, %eax
	jmp	.L317
.L318:
	movl	throttles, %ecx
	movl	-12(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ecx,%eax), %eax
	movl	20(%eax), %eax
	testl	%eax, %eax
	jns	.L319
	movl	$.LC122, 4(%esp)
	movl	$3, (%esp)
	call	syslog
	movl	throttles, %ecx
	movl	-12(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ecx,%eax), %eax
	movl	$0, 20(%eax)
.L319:
	movl	8(%ebp), %eax
	movl	52(%eax), %eax
	movl	8(%ebp), %edx
	movl	-12(%ebp), %ecx
	movl	%ecx, 12(%edx,%eax,4)
	leal	1(%eax), %edx
	movl	8(%ebp), %eax
	movl	%edx, 52(%eax)
	movl	throttles, %ecx
	movl	-12(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ecx,%eax), %eax
	movl	20(%eax), %edx
	addl	$1, %edx
	movl	%edx, 20(%eax)
	movl	throttles, %ecx
	movl	-12(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ecx,%eax), %eax
	movl	4(%eax), %ecx
	movl	throttles, %ebx
	movl	-12(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ebx,%eax), %eax
	movl	20(%eax), %eax
	movl	%eax, -28(%ebp)
	movl	%ecx, %edx
	movl	%edx, %eax
	sarl	$31, %edx
	idivl	-28(%ebp)
	movl	%eax, -16(%ebp)
	movl	8(%ebp), %eax
	movl	56(%eax), %eax
	cmpl	$-1, %eax
	jne	.L320
	movl	8(%ebp), %eax
	movl	-16(%ebp), %edx
	movl	%edx, 56(%eax)
	jmp	.L321
.L320:
	movl	8(%ebp), %eax
	movl	56(%eax), %edx
	movl	-16(%ebp), %eax
	cmpl	%eax, %edx
	cmovg	%eax, %edx
	movl	8(%ebp), %eax
	movl	%edx, 56(%eax)
.L321:
	movl	throttles, %ecx
	movl	-12(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ecx,%eax), %eax
	movl	8(%eax), %eax
	movl	%eax, -16(%ebp)
	movl	8(%ebp), %eax
	movl	60(%eax), %eax
	cmpl	$-1, %eax
	jne	.L322
	movl	8(%ebp), %eax
	movl	-16(%ebp), %edx
	movl	%edx, 60(%eax)
	jmp	.L315
.L322:
	movl	8(%ebp), %eax
	movl	60(%eax), %edx
	movl	-16(%ebp), %eax
	cmpl	%eax, %edx
	cmovl	%eax, %edx
	movl	8(%ebp), %eax
	movl	%edx, 60(%eax)
.L315:
	addl	$1, -12(%ebp)
.L314:
	movl	numthrottles, %eax
	cmpl	%eax, -12(%ebp)
	jge	.L323
	movl	8(%ebp), %eax
	movl	52(%eax), %eax
	cmpl	$9, %eax
	jle	.L324
.L323:
	movl	$1, %eax
.L317:
	addl	$52, %esp
	popl	%ebx
	popl	%ebp
	ret
	.size	check_throttles, .-check_throttles
	.type	clear_throttles, @function
clear_throttles:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$16, %esp
	movl	$0, -4(%ebp)
	jmp	.L327
.L328:
	movl	throttles, %ecx
	movl	-4(%ebp), %edx
	movl	8(%ebp), %eax
	movl	12(%eax,%edx,4), %eax
	movl	%eax, %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ecx,%eax), %eax
	movl	20(%eax), %edx
	subl	$1, %edx
	movl	%edx, 20(%eax)
	addl	$1, -4(%ebp)
.L327:
	movl	8(%ebp), %eax
	movl	52(%eax), %eax
	cmpl	-4(%ebp), %eax
	jg	.L328
	leave
	ret
	.size	clear_throttles, .-clear_throttles
	.section	.rodata
	.align 4
.LC123:
	.string	"throttle #%d '%.80s' rate %ld greatly exceeding limit %ld; %d sending"
	.align 4
.LC124:
	.string	"throttle #%d '%.80s' rate %ld exceeding limit %ld; %d sending"
	.align 4
.LC125:
	.string	"throttle #%d '%.80s' rate %ld lower than minimum %ld; %d sending"
	.text
	.type	update_throttles, @function
update_throttles:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$92, %esp
	movl	$0, -28(%ebp)
	jmp	.L331
.L335:
	movl	throttles, %ecx
	movl	-28(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ecx,%eax), %ebx
	movl	throttles, %ecx
	movl	-28(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ecx,%eax), %eax
	movl	12(%eax), %eax
	leal	(%eax,%eax), %esi
	movl	throttles, %ecx
	movl	-28(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ecx,%eax), %eax
	movl	16(%eax), %eax
	movl	%eax, %edx
	shrl	$31, %edx
	leal	(%edx,%eax), %eax
	sarl	%eax
	leal	(%esi,%eax), %ecx
	movl	$1431655766, %edx
	movl	%ecx, %eax
	imull	%edx
	movl	%ecx, %eax
	sarl	$31, %eax
	movl	%edx, %ecx
	subl	%eax, %ecx
	movl	%ecx, %eax
	movl	%eax, 12(%ebx)
	movl	throttles, %ecx
	movl	-28(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ecx,%eax), %eax
	movl	$0, 16(%eax)
	movl	throttles, %ecx
	movl	-28(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ecx,%eax), %eax
	movl	12(%eax), %ecx
	movl	throttles, %ebx
	movl	-28(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ebx,%eax), %eax
	movl	4(%eax), %eax
	cmpl	%eax, %ecx
	jle	.L332
	movl	throttles, %ecx
	movl	-28(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ecx,%eax), %eax
	movl	20(%eax), %eax
	testl	%eax, %eax
	je	.L332
	movl	throttles, %ecx
	movl	-28(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ecx,%eax), %eax
	movl	12(%eax), %ecx
	movl	throttles, %ebx
	movl	-28(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ebx,%eax), %eax
	movl	4(%eax), %eax
	addl	%eax, %eax
	cmpl	%eax, %ecx
	jle	.L333
	movl	throttles, %ecx
	movl	-28(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ecx,%eax), %eax
	movl	20(%eax), %esi
	movl	throttles, %ecx
	movl	-28(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ecx,%eax), %eax
	movl	4(%eax), %ebx
	movl	throttles, %ecx
	movl	-28(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ecx,%eax), %eax
	movl	12(%eax), %ecx
	movl	throttles, %edi
	movl	-28(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%edi,%eax), %eax
	movl	(%eax), %eax
	movl	%esi, 24(%esp)
	movl	%ebx, 20(%esp)
	movl	%ecx, 16(%esp)
	movl	%eax, 12(%esp)
	movl	-28(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	$.LC123, 4(%esp)
	movl	$5, (%esp)
	call	syslog
	jmp	.L332
.L333:
	movl	throttles, %ecx
	movl	-28(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ecx,%eax), %eax
	movl	20(%eax), %esi
	movl	throttles, %ecx
	movl	-28(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ecx,%eax), %eax
	movl	4(%eax), %ebx
	movl	throttles, %ecx
	movl	-28(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ecx,%eax), %eax
	movl	12(%eax), %ecx
	movl	throttles, %edi
	movl	-28(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%edi,%eax), %eax
	movl	(%eax), %eax
	movl	%esi, 24(%esp)
	movl	%ebx, 20(%esp)
	movl	%ecx, 16(%esp)
	movl	%eax, 12(%esp)
	movl	-28(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	$.LC124, 4(%esp)
	movl	$6, (%esp)
	call	syslog
.L332:
	movl	throttles, %ecx
	movl	-28(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ecx,%eax), %eax
	movl	12(%eax), %ecx
	movl	throttles, %ebx
	movl	-28(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ebx,%eax), %eax
	movl	8(%eax), %eax
	cmpl	%eax, %ecx
	jge	.L334
	movl	throttles, %ecx
	movl	-28(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ecx,%eax), %eax
	movl	20(%eax), %eax
	testl	%eax, %eax
	je	.L334
	movl	throttles, %ecx
	movl	-28(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ecx,%eax), %eax
	movl	20(%eax), %esi
	movl	throttles, %ecx
	movl	-28(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ecx,%eax), %eax
	movl	8(%eax), %ebx
	movl	throttles, %ecx
	movl	-28(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ecx,%eax), %eax
	movl	12(%eax), %ecx
	movl	throttles, %edi
	movl	-28(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%edi,%eax), %eax
	movl	(%eax), %eax
	movl	%esi, 24(%esp)
	movl	%ebx, 20(%esp)
	movl	%ecx, 16(%esp)
	movl	%eax, 12(%esp)
	movl	-28(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	$.LC125, 4(%esp)
	movl	$5, (%esp)
	call	syslog
.L334:
	addl	$1, -28(%ebp)
.L331:
	movl	numthrottles, %eax
	cmpl	%eax, -28(%ebp)
	jl	.L335
	movl	$0, -36(%ebp)
	jmp	.L336
.L343:
	movl	connects, %ecx
	movl	-36(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$5, %eax
	leal	(%ecx,%eax), %eax
	movl	%eax, -40(%ebp)
	movl	-40(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$2, %eax
	je	.L337
	movl	-40(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$3, %eax
	jne	.L338
.L337:
	movl	-40(%ebp), %eax
	movl	$-1, 56(%eax)
	movl	$0, -32(%ebp)
	jmp	.L339
.L342:
	movl	-32(%ebp), %edx
	movl	-40(%ebp), %eax
	movl	12(%eax,%edx,4), %eax
	movl	%eax, -28(%ebp)
	movl	throttles, %ecx
	movl	-28(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ecx,%eax), %eax
	movl	4(%eax), %ecx
	movl	throttles, %ebx
	movl	-28(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ebx,%eax), %eax
	movl	20(%eax), %eax
	movl	%eax, -60(%ebp)
	movl	%ecx, %edx
	movl	%edx, %eax
	sarl	$31, %edx
	idivl	-60(%ebp)
	movl	%eax, -44(%ebp)
	movl	-40(%ebp), %eax
	movl	56(%eax), %eax
	cmpl	$-1, %eax
	jne	.L340
	movl	-40(%ebp), %eax
	movl	-44(%ebp), %edx
	movl	%edx, 56(%eax)
	jmp	.L341
.L340:
	movl	-40(%ebp), %eax
	movl	56(%eax), %edx
	movl	-44(%ebp), %eax
	cmpl	%eax, %edx
	cmovg	%eax, %edx
	movl	-40(%ebp), %eax
	movl	%edx, 56(%eax)
.L341:
	addl	$1, -32(%ebp)
.L339:
	movl	-40(%ebp), %eax
	movl	52(%eax), %eax
	cmpl	-32(%ebp), %eax
	jg	.L342
.L338:
	addl	$1, -36(%ebp)
.L336:
	movl	max_connects, %eax
	cmpl	%eax, -36(%ebp)
	jl	.L343
	addl	$92, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.size	update_throttles, .-update_throttles
	.type	finish_connection, @function
finish_connection:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$24, %esp
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, (%esp)
	call	httpd_write_response
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	clear_connection
	leave
	ret
	.size	finish_connection, .-finish_connection
	.section	.rodata
	.align 4
.LC126:
	.string	"replacing non-null linger_timer!"
	.align 4
.LC127:
	.string	"tmr_create(linger_clear_connection) failed"
	.text
	.type	clear_connection, @function
clear_connection:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$56, %esp
	movl	8(%ebp), %eax
	movl	72(%eax), %eax
	testl	%eax, %eax
	je	.L348
	movl	8(%ebp), %eax
	movl	72(%eax), %eax
	movl	%eax, (%esp)
	call	tmr_cancel
	movl	8(%ebp), %eax
	movl	$0, 72(%eax)
.L348:
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$4, %eax
	jne	.L349
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	%eax, (%esp)
	call	tmr_cancel
	movl	8(%ebp), %eax
	movl	$0, 76(%eax)
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	$0, 356(%eax)
.L349:
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	356(%eax), %eax
	testl	%eax, %eax
	je	.L350
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$3, %eax
	je	.L351
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	448(%eax), %eax
	movl	%eax, (%esp)
	call	fdwatch_del_fd
.L351:
	movl	8(%ebp), %eax
	movl	$4, (%eax)
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	448(%eax), %eax
	movl	$1, 4(%esp)
	movl	%eax, (%esp)
	call	shutdown
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	448(%eax), %eax
	movl	$0, 8(%esp)
	movl	8(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	fdwatch_add_fd
	movl	8(%ebp), %eax
	movl	%eax, -12(%ebp)
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	testl	%eax, %eax
	je	.L352
	movl	$.LC126, 4(%esp)
	movl	$3, (%esp)
	call	syslog
.L352:
	movl	$0, 16(%esp)
	movl	$500, 12(%esp)
	movl	-12(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	$linger_clear_connection, 4(%esp)
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	tmr_create
	movl	8(%ebp), %edx
	movl	%eax, 76(%edx)
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	testl	%eax, %eax
	jne	.L354
	movl	$.LC127, 4(%esp)
	movl	$2, (%esp)
	call	syslog
	movl	$1, (%esp)
	call	exit
.L350:
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	really_clear_connection
.L354:
	leave
	ret
	.size	clear_connection, .-clear_connection
	.type	really_clear_connection, @function
really_clear_connection:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$24, %esp
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	168(%eax), %edx
	movl	stats_bytes, %eax
	leal	(%edx,%eax), %eax
	movl	%eax, stats_bytes
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$3, %eax
	je	.L356
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	448(%eax), %eax
	movl	%eax, (%esp)
	call	fdwatch_del_fd
.L356:
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	12(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	httpd_close_conn
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	clear_throttles
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	testl	%eax, %eax
	je	.L357
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	%eax, (%esp)
	call	tmr_cancel
	movl	8(%ebp), %eax
	movl	$0, 76(%eax)
.L357:
	movl	8(%ebp), %eax
	movl	$0, (%eax)
	movl	first_free_connect, %edx
	movl	8(%ebp), %eax
	movl	%edx, 4(%eax)
	movl	8(%ebp), %edx
	movl	connects, %eax
	movl	%edx, %ecx
	subl	%eax, %ecx
	movl	%ecx, %eax
	sarl	$5, %eax
	imull	$-1431655765, %eax, %eax
	movl	%eax, first_free_connect
	movl	num_connects, %eax
	subl	$1, %eax
	movl	%eax, num_connects
	leave
	ret
	.size	really_clear_connection, .-really_clear_connection
	.section	.rodata
	.align 4
.LC128:
	.string	"%.80s connection timed out reading"
	.align 4
.LC129:
	.string	"%.80s connection timed out sending"
	.text
	.type	idle, @function
idle:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$56, %esp
	movl	$0, -12(%ebp)
	jmp	.L360
.L365:
	movl	connects, %ecx
	movl	-12(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$5, %eax
	leal	(%ecx,%eax), %eax
	movl	%eax, -16(%ebp)
	movl	-16(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$1, %eax
	je	.L362
	cmpl	$1, %eax
	jl	.L361
	cmpl	$3, %eax
	jg	.L361
	jmp	.L367
.L362:
	movl	12(%ebp), %eax
	movl	(%eax), %edx
	movl	-16(%ebp), %eax
	movl	68(%eax), %eax
	movl	%edx, %ecx
	subl	%eax, %ecx
	movl	%ecx, %eax
	cmpl	$59, %eax
	jle	.L368
	movl	-16(%ebp), %eax
	movl	8(%eax), %eax
	addl	$8, %eax
	movl	%eax, (%esp)
	call	httpd_ntoa
	movl	%eax, 8(%esp)
	movl	$.LC128, 4(%esp)
	movl	$6, (%esp)
	call	syslog
	movl	httpd_err408form, %ecx
	movl	httpd_err408title, %edx
	movl	-16(%ebp), %eax
	movl	8(%eax), %eax
	movl	$.LC46, 20(%esp)
	movl	%ecx, 16(%esp)
	movl	$.LC46, 12(%esp)
	movl	%edx, 8(%esp)
	movl	$408, 4(%esp)
	movl	%eax, (%esp)
	call	httpd_send_err
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	finish_connection
	jmp	.L361
.L367:
	movl	12(%ebp), %eax
	movl	(%eax), %edx
	movl	-16(%ebp), %eax
	movl	68(%eax), %eax
	movl	%edx, %ecx
	subl	%eax, %ecx
	movl	%ecx, %eax
	cmpl	$299, %eax
	jle	.L361
	movl	-16(%ebp), %eax
	movl	8(%eax), %eax
	addl	$8, %eax
	movl	%eax, (%esp)
	call	httpd_ntoa
	movl	%eax, 8(%esp)
	movl	$.LC129, 4(%esp)
	movl	$6, (%esp)
	call	syslog
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	clear_connection
	jmp	.L361
.L368:
	nop
.L361:
	addl	$1, -12(%ebp)
.L360:
	movl	max_connects, %eax
	cmpl	%eax, -12(%ebp)
	jl	.L365
	leave
	ret
	.size	idle, .-idle
	.type	wakeup_connection, @function
wakeup_connection:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$40, %esp
	movl	8(%ebp), %eax
	movl	%eax, -12(%ebp)
	movl	-12(%ebp), %eax
	movl	$0, 72(%eax)
	movl	-12(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$3, %eax
	jne	.L371
	movl	-12(%ebp), %eax
	movl	$2, (%eax)
	movl	-12(%ebp), %eax
	movl	8(%eax), %eax
	movl	448(%eax), %eax
	movl	$1, 8(%esp)
	movl	-12(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	fdwatch_add_fd
.L371:
	leave
	ret
	.size	wakeup_connection, .-wakeup_connection
	.type	linger_clear_connection, @function
linger_clear_connection:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$40, %esp
	movl	8(%ebp), %eax
	movl	%eax, -12(%ebp)
	movl	-12(%ebp), %eax
	movl	$0, 76(%eax)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	really_clear_connection
	leave
	ret
	.size	linger_clear_connection, .-linger_clear_connection
	.type	occasional, @function
occasional:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$24, %esp
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	mmc_cleanup
	call	tmr_cleanup
	movl	$1, watchdog_flag
	leave
	ret
	.size	occasional, .-occasional
	.type	show_stats, @function
show_stats:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$24, %esp
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	logstats
	leave
	ret
	.size	show_stats, .-show_stats
	.section	.rodata
	.align 4
.LC130:
	.string	"up %ld seconds, stats for %ld seconds:"
	.text
	.type	logstats, @function
logstats:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$56, %esp
	cmpl	$0, 8(%ebp)
	jne	.L379
	movl	$0, 4(%esp)
	leal	-28(%ebp), %eax
	movl	%eax, (%esp)
	call	gettimeofday
	leal	-28(%ebp), %eax
	movl	%eax, 8(%ebp)
.L379:
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -12(%ebp)
	movl	start_time, %eax
	movl	-12(%ebp), %edx
	movl	%edx, %ecx
	subl	%eax, %ecx
	movl	%ecx, %eax
	movl	%eax, -16(%ebp)
	movl	stats_time, %eax
	movl	-12(%ebp), %edx
	movl	%edx, %ecx
	subl	%eax, %ecx
	movl	%ecx, %eax
	movl	%eax, -20(%ebp)
	cmpl	$0, -20(%ebp)
	jne	.L380
	movl	$1, -20(%ebp)
.L380:
	movl	-12(%ebp), %eax
	movl	%eax, stats_time
	movl	-20(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	$.LC130, 4(%esp)
	movl	$6, (%esp)
	call	syslog
	movl	-20(%ebp), %eax
	movl	%eax, (%esp)
	call	thttpd_logstats
	movl	-20(%ebp), %eax
	movl	%eax, (%esp)
	call	httpd_logstats
	movl	-20(%ebp), %eax
	movl	%eax, (%esp)
	call	mmc_logstats
	movl	-20(%ebp), %eax
	movl	%eax, (%esp)
	call	fdwatch_logstats
	movl	-20(%ebp), %eax
	movl	%eax, (%esp)
	call	tmr_logstats
	leave
	ret
	.size	logstats, .-logstats
	.section	.rodata
	.align 4
.LC131:
	.string	"  thttpd - %ld connections (%g/sec), %d max simultaneous, %lld bytes (%g/sec), %d httpd_conns allocated"
	.text
	.type	thttpd_logstats, @function
thttpd_logstats:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%esi
	pushl	%ebx
	subl	$64, %esp
	cmpl	$0, 8(%ebp)
	jle	.L383
	movl	httpd_conn_count, %esi
	movl	stats_bytes, %eax
	movl	%eax, -12(%ebp)
	fildl	-12(%ebp)
	fildl	8(%ebp)
	fdivrp	%st, %st(1)
	movl	stats_bytes, %eax
	movl	%eax, %edx
	sarl	$31, %edx
	movl	stats_simultaneous, %ebx
	movl	stats_connections, %ecx
	movl	%ecx, -12(%ebp)
	fildl	-12(%ebp)
	fildl	8(%ebp)
	fdivrp	%st, %st(1)
	fxch	%st(1)
	movl	stats_connections, %ecx
	movl	%esi, 40(%esp)
	fstpl	32(%esp)
	movl	%eax, 24(%esp)
	movl	%edx, 28(%esp)
	movl	%ebx, 20(%esp)
	fstpl	12(%esp)
	movl	%ecx, 8(%esp)
	movl	$.LC131, 4(%esp)
	movl	$6, (%esp)
	call	syslog
.L383:
	movl	$0, stats_connections
	movl	$0, stats_bytes
	movl	$0, stats_simultaneous
	addl	$64, %esp
	popl	%ebx
	popl	%esi
	popl	%ebp
	ret
	.size	thttpd_logstats, .-thttpd_logstats
	.ident	"GCC: (GNU) 4.4.7 20120313 (Red Hat 4.4.7-4)"
	.section	.note.GNU-stack,"",@progbits
