function X = InDo(N,d)
if nargin==1
    d=0
end
d;
if N<=14
    X=N*d;
    return
end
K=       [  320
        1280
        1120
         235
           8
           0
           0
           0
           0
           0
         440
         660
         198
           7
           0
           0
           0
           0
           0
           0
         170
          68
           6
           0
           0
           0
           0
           0
           0
           0
          23
           0
           0
           0
           0
           0
           0
           0
           0
           0
           1];
       
       p=zeros(41,1);
p(41)=1;
X{41}=d;
    
for i=40:-1:2
    p(i)=min(floor(K(i)/4536*N),N-sum(p));
    if K(i)~=0 && p(i)==0 && sum(p)<N
        p(i)=1;
    end
    X{i}=InDo(p(i),d+1);
end
    p(1)=max(N-sum(p),0);
    X{1}=InDo(p(1),d+1);
       
end

