function [out, c]=loopslv(in)
for n=1:82
    if n>81
        out=in;
        c=1;
        return
    end
    j=floor((n-1)/9)+1;
    i=n-9*(j-1);
    i1=floor((i-1)/3)+1;
    i2=i-3*(i1-1);
    j1=floor((j-1)/3)+1;
    j2=j-3*(j1-1);
    if in(i1,i2,j1,j2,10)==0
        break
    end
    
end
v=in(i1,i2,j1,j2,1:9);
for k=9:-1:1
    if v(k)==0
        v(k)=[];
    else
        v(k)=k;
    end
end
if isempty(v)
    c=0;
    out=in;
    return
else
    for k=1:length(v)
        out=in;
        nv=v(k);
        out(i1,i2,j1,j2,10)=nv;
        out(i1,i2,:,:,nv)=0;
        out(:,:,j1,j2,nv)=0;
        out(i1,:,j1,:,nv)=0;
        out(i1,i2,j1,j2,nv)=1;
        [out, c]=loopslv(out);
        if c==1
            return
        end
    end
end
