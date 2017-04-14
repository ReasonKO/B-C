function out=BaC_checkin(A,N)
    A1=mod(floor(A/1000),10);
    A2=mod(floor(A/100),10);
    A3=mod(floor(A/10),10);
    A4=mod(A,10);    

    N1=mod(floor(N/1000),10);
    N2=mod(floor(N/100),10);
    N3=mod(floor(N/10),10);
    N4=mod(N,10);    

K=(A1==N2)+(A1==N3)+(A1==N4)+...
  (A2==N1)+(A2==N3)+(A2==N4)+...
  (A3==N1)+(A3==N2)+(A3==N4)+...
  (A4==N1)+(A4==N2)+(A4==N3);
B=(A1==N1)+(A2==N2)+(A3==N3)+(A4==N4);

    out=[N,B,K];
end