function out=BaC_checkin_fast(A,N,BC)
%    global BC
    bc=BC(A,N);    
    out=[N,floor(bc/10),mod(bc,10)];
end