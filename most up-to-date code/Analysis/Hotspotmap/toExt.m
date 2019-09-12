function toExt(fileIndx)

fid = fopen('exp desc.txt','a')
fprintf (fid, '%s\n\n', ' ')

str=ls([num2str(fileIndx) '*.txt'])
fprintf (fid, '%s\n', str(1,:))
str=ls([num2str(fileIndx) '*.DAT1'])
fprintf (fid, '%s\n', str(1,:))
fclose(fid)
