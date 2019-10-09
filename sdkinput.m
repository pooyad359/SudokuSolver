function sdk=sdkinput(in)
sdk=zeros(9);
for i=1:9
    for j=1:9
        sdk(i,j)=str2double(in(i,j));
    end
end
