function [f1 f2]=analysisPerAxis(res)

f1=[]; f2=[];
for i=1:size(res,2)
    vals=res(i).vals;
    f1=[f1 vals(1,2)/vals(1,3)];
    f2=[f2 vals(end,2)/vals(end,3)];
end
    