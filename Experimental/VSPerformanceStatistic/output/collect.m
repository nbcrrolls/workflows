%
function a = collect
    xxhigh = load('all_conformations_high.csv','-ascii');
    xxzeros = load('all_conformations_zeros.csv','-ascii');
    %N=size(xxzeros,2)-2;
    N=3;
    a = zeros(N,1);
    parfor i=1:N
        t=cputime;
        [gibbs_auc,gibbs_cl,gibbs_p,gibbs_protconfs] = gibbs(xxhigh,i,0.05);
        [gibbs_auc_max,gibbs_index] = max(gibbs_auc);
        a(i) = gibbs_auc_max;
        [best_auc,best_cl,best_p,best_protconfs] = best(xxhigh,i,0.05);
        [best_auc_max,best_index] = max(best_auc);
        [unweighted_auc,unweighted_cl,unweighted_p,unweighted_protconfs] = unweighted(xxzeros,i,0.05);
        [unweighted_auc_max,unweighted_index] = max(unweighted_auc);
        calctime = cputime-t;
        strINIT1 = ['Results with ', num2str(i), ' protein conformations in each set'];
        strINIT2 = ['Best AUC results for each method, with 95% confidence, and p-values'];
        strScoreG1 = ['Maximal Score is ', num2str(gibbs_auc_max), ' based on Gibbs'];
        strScoreG2 = ['Confidence on the maximal score is ', num2str(gibbs_cl(gibbs_index)), ' with p-value ', num2str(gibbs_p(gibbs_index)), ' based on Gibbs'];
        strScoreB1 = ['Maximal Score is ', num2str(best_auc_max), ' based on best'];
        strScoreB2 = ['Confidence on the maximal score is ', num2str(best_cl(best_index)), ' with p-value ', num2str(best_p(best_index)), ' based on Best'];
        strScoreU1 = ['Maximal Score is ', num2str(unweighted_auc_max), ' based on Unweighted Avgerage'];
        strScoreU2 = ['Confidence on the maximal score is ', num2str(unweighted_cl(unweighted_index)), ' with p-value ', num2str(unweighted_p(unweighted_index)), ' based on Unweighted Avgerage'];
        strConfsG = ['Protein Conformations ', num2str(gibbs_protconfs(gibbs_index,:)), ' is/are optimal based on Gibbs ', ];
        strConfsB = ['Protein Conformations ', num2str(best_protconfs(best_index,:)), ' is/are optimal based on Best ', ];
        strConfsU = ['Protein Conformations ', num2str(unweighted_protconfs(unweighted_index,:)), ' is/are optimal based on Unweighted Avgerage ', ];
        strTIME = ['Time to calculate this set ', num2str(calctime),'s'];
        disp(strINIT1)
        disp(strINIT2)
        disp('   ')
        disp(strScoreG1)
        disp(strScoreB1)
        disp(strScoreU1)
        disp('   ')
        disp(strScoreG2)
        disp(strScoreB2)
        disp(strScoreU2)
        disp('   ')
        disp(strConfsG)
        disp(strConfsB)
        disp(strConfsU)
        disp('   ')
        disp(strTIME)
        disp('   ')
        disp('############################')
        disp('   ')
        %ensembles(i) = factorial(N)/(factorial(i)*factorial(N-i));
    end
%totalensemblesize = sum(ensembles);
disp('############################')
disp('   ')
%strENSsize = ['Total number of ensembles considered ', num2str(totalensemblesize)];
%disp(strENSsize)
disp('   ')
disp('############################')
