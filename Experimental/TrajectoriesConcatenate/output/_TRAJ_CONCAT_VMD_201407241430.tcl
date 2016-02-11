mol new /home/pieong/Desktop/Concat_test/p53_wt.top type parm7 first 0 last -1 step 1 waitfor all
mol addfile /home/pieong/Desktop/Concat_test/p53_wt_1.dcd type dcd first 0 last -1 step 1 waitfor all 0
mol addfile /home/pieong/Desktop/Concat_test/p53_wt_2.dcd type dcd first 0 last -1 step 1 waitfor all 0
animate write dcd /home/pieong/Desktop/Concat_test/_TRAJ_CONCAT_VMD_201407241430.dcd beg 0 end -1 skip 1 waitfor all 0
quit
