#!/usr/bin/perl -w
#code modifikasi carilubang v1.3
#gunakan perintah: ./carilubang.pl <kepekaan 1-50> <nama folder>
use strict;
use File::Find;
my $colek = shift  || 10;
my $folder = shift || './';
find(\&lubang, "$folder");
sub lubang {
    if ((/\.(php|txt)/)){
       open (my $IN,"<$_") || die "tidak bisa di bongkar $File::Find::name: $!";
       my @file =  <$IN>;
       #tikus tanah
       my $intip = grep (/function_exists\(|phpinfo\(|safe_?mode|shell_exec\(|popen\(|passthru\(|system\(|myshellexec\(|exec\(|getpwuid\(|getgrgid  \(|fileperms\(/i,@file);
       #tikus tanah
       my $cangkul = grep(/\`\$\_(post|request|get).{0,20}\`|(include|require|eval|system|passthru|shell_exec).{0,10}\$\_(post|request|get)|eval.{0,10}base64_decode|back_connect|backdoor|b374k|1n73ction|Ani-Shell|r57|PHPJackal|PhpSpy|GiX|Fx29SheLL|w4ck1ng|milw0rm|PhpShell|k1r4|FeeLCoMz|FaTaLisTiCz|Ve_cENxShell|UnixOn|C99madShell|Spamfordz|Locus7s|c100|c99|x2300|cgitelnet|webadmin|cybershell|STUNSHELL|Pr!v8|PHPShell|KaMeLeOn|S4T|oRb|tryag|sniper|noexecshell|\/etc\/passwd|revengans/i, @file);
       $intip +=  50 *  $cangkul;
       print "$intip - Tidak ada pintu belakang : $File::Find::name\n" if ($intip > $colek-1 );
       close $IN;
  }elsif((/\.(jpg|jpeg|gif|bmp|png|tar|zip|gz|rar|pdf)/)){
       open (my $IN,"<$_") || (print "tidak bisa di bongkar $File::Find::name: $!" && next);
       print "5000 - Tidak ada pintu belakang (php dalam file bukan php): $File::Find::name\n" if grep /(\<\?php|include(\ |\())/i, <$IN>;
       close $IN;
  }
}