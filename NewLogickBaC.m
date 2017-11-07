clc
DEBUG=1;

Questions =...
 [       1234           0           3
        2145           2           0
        2346           1           1];
    
    
Array=zeros(9999,5);

for i=1000:9999
    Array(i,1)=mod(floor(i/1000),10);
    Array(i,2)=mod(floor(i/100),10);
    Array(i,3)=mod(floor(i/10),10);
    Array(i,4)=mod(i,10);
    if Array(i,1)~=Array(i,2) &&...
       Array(i,1)~=Array(i,3) &&...
       Array(i,1)~=Array(i,4) &&...
       Array(i,2)~=Array(i,3) &&...
       Array(i,2)~=Array(i,4) &&...
       Array(i,3)~=Array(i,4)
        Array(i,5)=1;
    end
end

for i=1:size(Questions,1)
    Array=BaC_check(Array,Questions(i,1),Questions(i,2),Questions(i,3));
end

if DEBUG
    Array(Array(:,5)==1,1:4)
end


ArrayIN=Array;
[ArrayOUT,N,Pos,Ver]=BaC_Nerf(ArrayIN);
ArrayOUT1=ArrayOUT(ArrayOUT(:,5)==1,1:4);
if DEBUG
    fprintf('\n\nSTEP 1------------\n\n')
    [N;Pos;Ver]
    sum(ArrayOUT(:,5)==1)
%    ArrayOUT1
end

IND=1:9999;
Arrayout=IND(Array(:,5)==1)'

sz=sum(Array(:,5))
B=zeros(sz,1);
K=zeros(sz,1);
S=zeros(sz,sz);
for i=1:sz
    for j=1:sz
        Arrayout(i)        
        out=BaC_checkin(Arrayout(i),Arrayout(j))
        B(i,j)=out(2);
        K(i,j)=out(3);
        temp=BaC_check(Array,Arrayout(i),B(i,j),K(i,j));
        temp(temp(:,5)==1,:)
        S(i,j)=sum(temp(:,5)==1);
    end
end

B
K
S
%S(S==1)=0
S_log=log(S)/log(5)
[v,ind]=min(sum(S_log'))
Arrayout(ind)
% 
% ArrayIN=ArrayOUT;
% [ArrayOUT,N,Pos,Ver]=BaC_Nerf(ArrayIN);
% ArrayOUT2=ArrayOUT(ArrayOUT(:,5)==1,1:4);
% if DEBUG
%     fprintf('\n\nSTEP 2------------\n\n')
%     [N;Pos;Ver]
%     sum(ArrayOUT(:,5)==1)
%     ArrayOUT2
% end