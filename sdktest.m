function sdktest
% sdk=['030900020'
%     '800002007'
%     '001400600'
%     '090040502'
%     '000603000'
%     '700010080'
%     '009004100'
%     '200800003'
%     '070009000'];
sdk=['000000000'
    '000003085'
    '001020000'
    '000507000'
    '004000100'
    '090000000'
    '500000073'
    '002010000'
    '000040009']';
sdk=['060084507'
    '000007080'
    '050002000'
    '100000060'
    '700208001'
    '080000009'
    '000100030'
    '020800000'
    '503920040'
    ];
tic
sdk=sdkinput(sdk);
sdkshow(sdk)
sol=sdk9to3(sdk);
sol=sngslv(sol);
sdkshow(sdk3to9(sol))
display(toc)
sol=loopslv(sol);
fprintf('\n\n')
sdkshow(sdk3to9(sol))
display(toc)