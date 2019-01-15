BEGIN{
cbr_send=0;
cbr_recv=0;
tcp_send=0;
tcp_recv=0;
}

{
if($1=="+" && $3==3 && $4==0 && $5=="cbr"){cbr_send++}
if($1=="r" && $3==1 && $4==5 && $5=="cbr"){cbr_recv++}
if($1=="+" && $3==2 && $4==0 && $5=="tcp"){tcp_send++}
if($1=="r" && $3==1 && $4==4 && $5=="tcp"){tcp_recv++}
}
END {
printf("sent_packets CBR\t %d\n",cbr_send);
printf("recv_packets CBR\t %d\n",cbr_recv);	
printf("sent_packets TCP\t %d\n",tcp_send);	
printf("recv_packets TCP\t %d\n",tcp_recv);		

}
