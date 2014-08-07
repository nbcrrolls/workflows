%
% Rob Swift
% 5/8/2012
%
%Calculates the AUC of data. Returns a confidence interval, CL, at the
%1-alpha level, and a one-sided p-value: uses the central limit theorem for
%both.

%The rows of data should be formatted as follows:

% compound_id  (0/1)  docking_score

%The second column is a 1 if the compound is a binder (positive) & 0 if it
%is a non-biner (negative).

%The calculations roughly follow the ref: "Ensemble Docking into Multiple
%Cyrstallographically Derived Protein Structures: An Evaluation Based on
%the Statistical Analysis of Enrichments," Craig IR,Essex JW,Spiegel K.
%JCIM, 2010:511-524

function [AUC,CL,p]=auc(data,P,alpha)

Ncompounds=size(data,1);  %number of compounds
np=0;                     %number of positives at threshold
nn=0;                     %number of negatives at threshold
P=P;                      %total number of positives (binders)
N=Ncompounds-P;           %total number of negatives (non-binders)
tprTemp=0;                %initial true positive rate
fprTemp=0;                %initial false positive rate
alpa=alpha;               %confidence value. E.G. set to 0.05 for 95% level

%calculate tpr(decoy) (Nx1) & fpr(active) (Px1)
j=1;k=1;
for i=1:Ncompounds
    if data(i,2)==1
        np=np+1;
        tprTemp=np/P;
        fpr(j)=fprTemp;
        j=j+1;
    elseif data(i,2)==0
        nn=nn+1;
        fprTemp=nn/N;
        tpr(k)=tprTemp;
        k=k+1;
    end
end

%AUC: eqn 2 from ref.
AUC=mean(tpr);

%Variance calculation: eqns 4 & 5 from the ref.
varn=mean((tpr-mean(tpr)).^2);
varp=mean((fpr-mean(fpr)).^2);

%Standard error: eqn 6 from the ref.
SE=sqrt(varp/P+varn/N);

%Confidence intervals
erfinvIn=1-alpha;
CL=sqrt(2)*erfinv(erfinvIn)*SE;

%One-sided p-value
erfIN=(AUC-0.5)/(sqrt(2)*SE);
p=1-(0.5+0.5*erf(erfIN));
