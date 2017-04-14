function [Array,i,j,Ver,Psout]=BaC_Nerf(Array)

S=sum(Array(:,5));
P=zeros(10,4);
%Array2=Array;
%Array2(Array(:,5)==1,5)=
for i=1:10
for j=1:4
%    P(i,j)=sum(Array(and(Array(:,5)==1,Array(:,j)==mod(i,10)),5));
    P(i,j)=sum(Array(Array(:,j)==mod(i,10),5));
end
end

Ps=P/S;
Psout=Ps;
Ps(Ps==1)=0;
[V,i]=max(Ps);
[Ver,j]=max(V);
i=i(j);
Array(Array(:,j)~=mod(i,10),5)=0;
end