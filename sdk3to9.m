function out=sdk3to9(in)
out=zeros(9);
for i1=1:3
    for i2=1:3
        for j1=1:3
            for j2=1:3
                i=3*(i1-1)+i2;
                j=3*(j1-1)+j2;
                k=in(i1,i2,j1,j2,10);
                out(i,j)=k;
                
            end
        end
    end
end