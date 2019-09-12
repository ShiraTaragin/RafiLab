function mat = randomizeMat(mat)
% add noise to each entry in the matrix according to some prefdined sd    
% for i=1:size(mat,1)
%     for j=1:size(mat,2)
%         x = mat(i,j);
        sd = 1*9.5-7.2*exp(-mat/76);
        mat = normrnd(mat, sd);
        
        mat(find(mat<0)) = 0;
