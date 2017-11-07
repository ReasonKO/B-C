function Array=BaC_check_fast(Array,N,B,K,BC)
%for 
    A=1000:9999;
 %   if Array(A,5)==1
        Array(A,5)=Array(A,5)&(BC(A,N)==10*B+K);
        %Array(A,5)=and(B_==B,K_==K);
  %  end
%end
end
