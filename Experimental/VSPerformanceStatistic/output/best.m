%
% Rob Swift
% 7/14/2013

%%%%%%%%%%%   Description   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Returns the AUC, confidence intervals and 1-sided p-values of all unique
%ensembles of size k. Confidence intervals are calculated at the 1-alpha
%level. Both confidence intervals and p-values are calculated assuming
%the validity of the central limit thereom using the auc.m script.

% Ensemble scores are calculated using the best score, i.e. min{scores}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%   INPUT variables   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% total is a matrix with rows formatted as follows:
% compound_id  (0/1)  docking_score
% The second column is a 1 if the compound is a binder & 0 if it
% is a non-biner.
% k is the ensemble size
% confidence levels are given at the 1-alpha level. E.g. 95% confidence
% levels are determined by setting alpha to 0.05.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function [AUC,CL,p,C]=best(total,k,alpha)

P=sum(total(:,2));
N=size(total,2)-2;
C=nchoosek(1:1:N,k);

parfor i=1:size(C,1)
    index=C(i,:)+2;
    scores=sort(total(:,index),2);
    data=sortrows(horzcat(total(:,1:2),scores(:,1)),3);
    [AUC(i),CL(i),p(i)]=auc(data,P,alpha);
end
