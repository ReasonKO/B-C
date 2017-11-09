% clc
% clear all
%prepare_data_BC
DEBUG=1;
load('BC')
global BC
%Questions=BaC_checkin(3951,1234)
 Questions= [...
        1234           1           1
        1023           1           1]
[out]=BullsAndCowsFast2(Questions)
        BaC_checkin(1025,out)
    return


% 
% 
% %I=zeros(9999,9999);  %[X;Y;B,C,active]
% BC=zeros(9999,9999);
% %C=zeros(9999,9999);
% 
% Array=zeros(9999,5);
% 
% I(1000:9999,1000:9999)=1;
% for i=1000:9999
%     Array(i,1)=mod(floor(i/1000),10);
%     Array(i,2)=mod(floor(i/100),10);
%     Array(i,3)=mod(floor(i/10),10);
%     Array(i,4)=mod(i,10);
%     if Array(i,1)~=Array(i,2) &&...
%        Array(i,1)~=Array(i,3) &&...
%        Array(i,1)~=Array(i,4) &&...
%        Array(i,2)~=Array(i,3) &&...
%        Array(i,2)~=Array(i,4) &&...
%        Array(i,3)~=Array(i,4)
%         Array(i,5)=1;
%     else
%         I(:,i)=0;
%         I(i,:)=0;
%     end
% end
% I=Array(:,5);
% sum(I)
% 
% GENERATE_BC=0;
% if GENERATE_BC
% for i=1:9999
%     i
%     if I(i)
%         for j=i:9999
%             if I(j)
%                     out=BaC_checkin(i,j);
%                     BC(i,j)=out(2)*10+out(3);
%                     BC(j,i)=out(2)*10+out(3);
%             end
%         end
%     end
% end
% save('BC','BC');
% else
%     load('BC');
% end
% 
% for i=1:size(Questions,1)
%     Array=BaC_check(Array,Questions(i,1),Questions(i,2),Questions(i,3));
% end
% 
% if DEBUG
%     Array(Array(:,5)==1,1:4)
% end
% IND=1:9999;
% Arrayout=IND(Array(:,5)==1)'
% I2=Array(:,5);
% 
% sz=sum(Array(:,5))
% B=zeros(sz,1);
% K=zeros(sz,1);
% S=zeros(sz,sz);
% 
% for i=1:sz
%     i
%     Apretendent=Arrayout(i);
%     for j=1:sz
%         Aanswer=Arrayout(j);
%         BCpretendent(i,j)=BC(Apretendent,Aanswer);
%         %BCpretendent(i,j)
%         %pause
%         S(i,j)=sum((BC(Apretendent,:)==BCpretendent(i,j))&(I2'));
%     end
% end
% S
% log(S)/log(5)
% sum(log(S)/log(5))
% [value,ansIND]=min(sum(log(S)/log(5)))
% ANSWER=Arrayout(ansIND)
%  %BCpretendent
% 
% 
% 
