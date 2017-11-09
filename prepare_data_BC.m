%clear all
% close all
% clc

GENERATE_ANSWERS=1;
GENERATE_BC=0;
GENERATE_Array=0;

global BC FAST_ANSWERS Array_init
    BC=zeros(9999,9999);
    FAST_ANSWERS=zeros(5,5);
    Array_init=zeros(9999,5);
    
if GENERATE_BC
    for i=1:9999
        if I(i)
            for j=i:9999
                if I(j)
                        out=BaC_checkin(i,j);
                        BC(i,j)=out(2)*10+out(3);
                        BC(j,i)=out(2)*10+out(3);
                end
            end
        end
    end
    save('BC','BC');  
else
    load('BC');
end

if GENERATE_Array
    for i=1000:9999
        Array_init(i,1)=mod(floor(i/1000),10);
        Array_init(i,2)=mod(floor(i/100),10);
        Array_init(i,3)=mod(floor(i/10),10);
        Array_init(i,4)=mod(i,10);
        if Array_init(i,1)~=Array_init(i,2) &&...
           Array_init(i,1)~=Array_init(i,3) &&...
           Array_init(i,1)~=Array_init(i,4) &&...
           Array_init(i,2)~=Array_init(i,3) &&...
           Array_init(i,2)~=Array_init(i,4) &&...
           Array_init(i,3)~=Array_init(i,4)
            Array_init(i,5)=1;
        end
    end
    save('Array_init','Array_init');
else
    load('Array_init');
end

if GENERATE_ANSWERS
for i=0:4
    for j=0:4         
        Questions =[      1234           i           j  ];
        if FAST_ANSWERS(i+1,j+1)==0
                FAST_ANSWERS(i+1,j+1)=BullsAndCowsFast2(Questions);
        end
    end
end
    save('FAST_ANSWERS','FAST_ANSWERS');
else
    load('FAST_ANSWERS');
end

