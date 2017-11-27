clc
clear all
prepare_data_BC

IND=1:9999; aAnswers=IND(Array_init(:,5)==1);     

getI=@(b,c)c+b*5+1;
getIbc=@(bc)getI(floor(bc/10),mod(bc,10));
A=zeros(25,1)
Am=zeros(41,1);

% for B=0:4
% for C=0:4
%     if ~isnan(FAST_ANSWERS(B+1,C+1))        
%         A(getI(B,C))=FAST_ANSWERS(B+1,C+1)
%     end
% end
% end

IND=1:9999; aAnswers=IND(Array_init(:,5)==1);     
for i=1:4536
    i
    for j=1:4536
%        A(getIbc(BC(aAnswers(i),aAnswers(j))))=A(getIbc(BC(aAnswers(i),aAnswers(j))))+1;       
        c=BC(aAnswers(i),aAnswers(j));
        Am(c+1)=Am(c+1)+1;
%         aAnswers(i)
%         aAnswers(j)
    end
end

round(Am/4536)
FAST_ANSWERS

for i=1:41
%X(
end

X=InDo(4536,1)
S=insum(X)
S/4536



myAns=[aAnswers(randi(4536));
    aAnswers(randi(4536));
    aAnswers(randi(4536));
    aAnswers(randi(4536));
    aAnswers(randi(4536));]