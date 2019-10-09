function sdkshow(sdk)
fprintf('\n')
for i=1:9
    fprintf('%d %d %d  %d %d %d  %d %d %d\n',sdk(i,:))
    if rem(i,3)==0
        fprintf('\n')
    end
end
fprintf('\n')