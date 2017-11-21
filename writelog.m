function writelog(HSIName,methodName,time)
fid = fopen('time.txt', 'at');
fprintf(fid,'%s  %s  ',HSIName, methodName);
fprintf(fid, '%f\n  ', time);
fclose(fid);
end