%
% Rob Swift
% 7/14/2013

%%%%%%%%%%%   Description   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Returns the AUC, confidence intervals and 1-sided p-values of all unique
%ensembles of size k. Confidence intervals are calculated at the 1-alpha
%level. Both confidence intervals and p-values are calculated assuming
%the validity of the central limit thereom using the auc.m script.

% Ensemble scores are calculated using a weighted average

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


function [AUC,CL,p]=weighted(total,k,alpha,w)

P=sum(total(:,2));                                                         %P is the no. of positives
N=size(total,2)-2;                                                         %N is the no. of receptor conformations
NC=size(total,1);                                                          %NC is the no. of compounds
C=nchoosek(1:1:N,k);                                                       %permutation matrix

parfor i=1:size(C,1)
    index=C(i,:)+2;                                                        %index for score lookup
    w=repmat(w(C(i,:)),NC,1);                                              %generate a matrix of weights
    scores=w.*total(:,index);                                              %extract docking scores from the data
    scores=mean(scores,2);                                                 %process the scores
    data=sortrows(horzcat(total(:,1:2),scores(:,1)),3);                    %sort data by scores
    [AUC(i),CL(i),p(i)]=auc(data,P,alpha);                                 %calculate AUC, confidence interval, and p-value
end
