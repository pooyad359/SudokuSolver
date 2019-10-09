function sdktst
sdk=['030900020'
    '800002007'
    '001400600'
    '090040502'
    '000603000'
    '700010080'
    '009004100'
    '200800003'
    '070009000'];
sdk=sdkinput(sdk);
sdkshow(sdk)
sol=sdk9to3(sdk);
sol=sngslv(sol);
fprintf('\n\n')
sdkshow(sdk3to9(sol))