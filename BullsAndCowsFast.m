function out=BullsAndCows(Questions)

 

%Questions
Qln=size(Questions,1);


%% Компановка массива вариантов
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

%% Выборка лучшего предложения
ArrayIN=Array;
ArrayOUT=BaC_Nerf(ArrayIN);
ArrayOUT1=ArrayOUT(ArrayOUT(:,5)==1,1:4);


ArrayIN=ArrayOUT;
ArrayOUT=BaC_Nerf(ArrayIN);
ArrayOUT2=ArrayOUT(ArrayOUT(:,5)==1,1:4);


ArrayIN=ArrayOUT;
ArrayOUT=BaC_Nerf(ArrayIN);
ArrayOUT3=ArrayOUT(ArrayOUT(:,5)==1,1:4);


ArrayIN=ArrayOUT;
ArrayOUT=BaC_Nerf(ArrayIN);
ArrayOUT4=ArrayOUT(ArrayOUT(:,5)==1,1:4);


%sum(Array(Array(:,5)==1,5))

if ~isempty(ArrayOUT4)
    OUT=ArrayOUT4;
elseif ~isempty(ArrayOUT3)
    OUT=ArrayOUT3;
elseif ~isempty(ArrayOUT2)
    OUT=ArrayOUT2;
elseif ~isempty(ArrayOUT1)
    OUT=ArrayOUT1;
else
    temp=Array(Array(:,5)==1,1:4);
    OUT=temp(1,:);
end


if isempty(OUT)
out=NaN;
else
OUT2=OUT(1)*1000+OUT(2)*100+OUT(3)*10+OUT(4);
out=OUT2;
end
end