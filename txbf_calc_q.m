% 收到相位信息计算V和Q

% SU CB=1, bphi=6, bpsi=4
% kphi = 0, 1, ..., 2^6-1  kpsi=0, 1, ..., 2^4-1
% phi=(k*pi)/(2^(6-1)) + pi/2^6
% psi=(k*pi)/(2^(4+1)) + pi/2^(4+2)

bphi = 6;
bpsi = 4;
kphi = [16 21 25 30 35 39 42 51 57 62 3 7 11 15 19 25 29 34 39 42 51 ...
    56 60 1 6 9 20 24 30 33 38 41 50 56 61 0 5 9 15 19 24 28 32 37 ...
    40 49 55 59 0 4 9 13];
kpsi = [11 11 11 11 11 11 11 12 11 10 11 11 11 11 11 11 11 11 11 10 ...
    11 11 10 11 11 11 10 11 11 11 11 10 11 11 10 11 11 11 11 10 10 ...
    10 11 10 10 11 10 10 10 10 10 10];

phi = (kphi*pi)/(2^(bphi-1)) + pi/(2^bphi);
psi = (kpsi*pi)/(2^(bpsi+1)) + pi/(2^(bpsi+2));

% Nc=Nr=2, V = D G^T
v11 = exp(1j*phi).*cos(psi);
v12 = -exp(1j*phi).*sin(psi);
v21 = sin(psi);
v22 = cos(psi);

% -28 -21 -7  0  +7  +21  +28
%   7   13   6   6  13  7
%  1  8   22  29  36  50  57
V11 = [1 1 1 1 v11(1:7) 1 v11(8:20) 1 v11(21:26) 1 v11(27:32) 1 v11(33:45) 1 v11(46:52) 1 1 1];
V12 = [1 1 1 1 v12(1:7) 1 v12(8:20) 1 v12(21:26) 1 v12(27:32) 1 v12(33:45) 1 v12(46:52) 1 1 1];
V21 = [1 1 1 1 v21(1:7) 1 v21(8:20) 1 v21(21:26) 1 v21(27:32) 1 v21(33:45) 1 v21(46:52) 1 1 1];
V22 = [1 1 1 1 v22(1:7) 1 v22(8:20) 1 v22(21:26) 1 v22(27:32) 1 v22(33:45) 1 v22(46:52) 1 1 1];

% Q = V/V^HV
V = zeros(64,2,2);
V(:,1,1) =V11;
V(:,1,2) =V12;
V(:,2,1) =V21;
V(:,2,2) =V22;

for ii = 1:64
    h = squeeze(V(ii,:,:));
    Q(ii,:,:) = h/(h'*h); 
end

a = squeeze(V(5,:,:));

S11 = [0 0 0 0 826+16824i -7203+15227i -12482+11311i ...
    -16340+4091i -16340-4094i -13529-10036i -10034-13531i -3315-13561i ...
    3404-13589i 12481-11312i 18934-4741i 16339+4092i 13529+10034i 8659+14447i ...
    2471+16661i -4094+16339i -12482+11311i -15861+5673i -16662-2473i ...
    -13529-10036i -11626-15679i -3766-16010i 4094-16340i 11313-12481i ...
    17645-8344i 16824+826i 14447+8659i 11311+12481i 0+0i -6576+18377i ...
    -11313+12480i -16340+4091i -16824-828i -14448-8661i -13107-14463i ...
    -5318-15563i 2472-16662i 11313-12481i 18378-6574i 16824-825i 15227+7202i ...
    11311+12481i 2471+16661i -4743+18933i -13109+14461i -17646+8344i ...
    -16825+825i -17644-8346i -14462-13109i -6818-14967i 827-16824i ...
    11628-15677i 16742-10033i 19495-956i 18377+6575i 13107+14462i ...
    6575+18377i 0 0 0] ./ 32768;

S21 = [0+0i 0+0i 0+0i 0+0i 28105+0i 28105+0i 28105+0i 28105+0i 28105+0i ...
    28105+0i 28105+0i 28862+0i 29621+0i 28105+0i 26319+0i 28105+0i 28105+0i ...
    28105+0i 28105+0i 28105+0i 28105+0i 28105+0i 28105+0i 28105+0i 26319+0i ...
    27211+0i 28105+0i 28105+0i 26319+0i 28105+0i 28105+0i 28105+0i 0+0i 26319+0i ...
    28105+0i 28105+0i 28105+0i 28105+0i 26319+0i 27211+0i 28105+0i 28105+0i ...
    26319+0i 28105+0i 28105+0i 28105+0i 28105+0i 26319+0i 26319+0i 26319+0i ...
    28105+0i 26319+0i 26319+0i 27211+0i 28105+0i 26319+0i 26319+0i 26319+0i ...
    26319+0i 26319+0i 26319+0i 0+0i 0+0i 0+0i] ./ 30800;




