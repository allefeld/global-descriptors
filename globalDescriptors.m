function gd = globalDescriptors(x, fSamp, N, step)

% compute global descriptors of EEG over a running window
%
% gd = globalDescriptors(x, fSamp, N)
% gd = globalDescriptors(x, fSamp, N, step)
%
% x:        data set (samples x channels)
% fSamp:    sampling frequency of the data
% N:        window size
% step:     step size, default = N
%
% gd:       global descriptors (samples x [Sigma, Phi, Omega])
%
% Copyright (C) 2009 Carsten Allefeld
%
% This program is free software: you can redistribute it and/or modify it
% under the terms of the GNU General Public License as published by the
% Free Software Foundation, either version 3 of the License, or (at your
% option) any later version. This program is distributed in the hope that
% it will be useful, but without any warranty; without even the implied
% warranty of merchantability or fitness for a particular purpose. See the
% GNU General Public License <http://www.gnu.org/licenses/> for more details.

if nargin < 4, step = N; end

[len, m] = size(x);
n = floor((len - N) / step + 1);
gd = nan(n, 3);

for i = 1 : n
    o = (i - 1) * step;
    u = x(o + (1 : N), :);

    M0 = mean(sum(u .^ 2, 2));
    Sigma = sqrt(M0 / m);
    
    lambda = eig(cov(u));
    lambda(lambda <= 0) = [];
    lambda = lambda / sum(lambda);
    Omega = exp(-sum(lambda .* log(lambda)));
    
    u = diff(u);
    M1 = mean(sum(u .^ 2, 2));
    Phi = sqrt(M1 / M0)  * fSamp / (2*pi);
    
    gd(i, :) = [Sigma, Phi, Omega];
end

