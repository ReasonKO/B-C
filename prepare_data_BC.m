%clear all
% close all
% clc

GENERATE_ANSWERS=0;
GENERATE_BC=0;
GENERATE_Array=0;

global BC
if GENERATE_BC
    BC=zeros(9999,9999);
    for i=1:9999
        i
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

global FAST_ANSWERS
if GENERATE_ANSWERS
FAST_ANSWERS=zeros(5,5);
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


global Array_init
if GENERATE_Array
    Array_init=zeros(9999,5);
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