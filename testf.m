N=3452;
    
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


for i=1:9999
    if Array(i,5)==1
        i
Array1=   BaC_check( Array,i,3,1);
Array2=   BaC_check_fast( Array,i,3,1,BC);
if norm(Array1-Array2)~=0
    i
    error('FSDFSDF');
end
    end
end