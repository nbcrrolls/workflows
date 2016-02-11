%
% Rob Swift
% 7/14/2013

%%%%%%%%%%%   Description   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Returns the AUC, confidence intervals and 1-sided p-values of all unique
%ensembles of size k. Confidence intervals are calculated at the 1-alpha
%level. Both confidence intervals and p-values are calculated assuming
%the validity of the central limit thereom using the auc.m script.

% Ensemble scores are calculated using an unweighted average

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%   INPUT variables   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% total is a matrix with rows formatted as follows:
% compound_id  (0/1)  docking_score
% The second column is a 1 if the compound is a binder & 0 if it
% is a non-biner.
% k is the ensemble size
% confidence levels are given at the 1-alpha level. E.g. 95% confidence
% levels are determined by setting alpha to 0.05.
% w is a 1xR vector of weights, where R is the number of receptor
% conformations.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [AUC,CL,p,C]=unweighted(total,k,alpha)

P=sum(total(:,2));                                                         %P is the number of positives
N=size(total,2)-2;                                                         %No of receptor conformations
C=nchoosek(1:1:N,k);                                                       %k is the ensemble size
                                                                           %permutation matrix

parfor i=1:size(C,1)
    index=C(i,:)+2;                                                        %index for score lookup
    scores=horzcat(total(:,index));                                        %extract docking scores from the data
    scores=mean(scores,2);                                                 %process scores
    data=sortrows(horzcat(total(:,1:2),scores),3);                         %sort data by scores
    [AUC(i),CL(i),p(i)]=auc(data,P,alpha);                                 %calculate AUC, confidence interval, and p-value
end
