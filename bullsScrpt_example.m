%EXAMPLE
Question=[];
Question(1,:)=[1234,0,2];
Question(2,:)=[4235,0,1];
Question(3,:)=[7589,0,1];
Question(4,:)=[8519,1,1];
Question(5,:)=[2354,0,1];
Question(6,:)=[3816,1,2];
Question(6,:)=[6418,0,4];
% Question=[4560 0 2
% 5671 0 2
%  8256           0           1
% 6947           1           1
% 6949           1           0]
% N=9135
% Question=[...
% BaC_checkin(N,7890);...
% BaC_checkin(N,9123);...
% BaC_checkin(N,9134);...
% %BaC_checkin(N,8256);...
% %BaC_checkin(N,6947);...
% %BaC_checkin(N,6045);...
% %BaC_checkin(N,6075);...
% ]
BullsAndCows('sad',Question)
Question
%or 
%BullsAndCows([1234,2,0],[1256,2,0],[1278,1,0],[1936,3,0])
