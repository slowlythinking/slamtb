function [hmg, HMG_rf, HMG_sf, HMG_sk, HMG_sd, HMG_u, HMG_n] = ...
    retroProjHmgPntFromPinHoleOnRob(Rf, Sf, Sk, Sd, u, n)

% RETROPROJHMGPNTFROMPINHOLEONROB Retro-proj. Hmg pnt from pinhole on rob.
%
%   HMG = RETROPROJIDPPNTFROMPINHOLEONROB(RF, SF, SK, SC, U, N) gives the
%   retroprojected HMG point in World Frame from an observed pixel U. RF
%   and SF are Robot and Sensor Frames, SK and SD are camera calibration
%   and distortion correction parameters. U is the pixel coordinate and N
%   is the non-observable inverse depth. HMG is a 4-vector :
%     HMG = [X Y Z IDepth]'
%
%   [HMG, HMG_RF, HMG_SF, HMG_SK, HMG_SD, HMG_U, HMG_N] = ... returns the
%   Jacobians wrt RF.x, SF.x, SK, SC, U and N.
%
%   See also INVPINHOLEHMG, FROMFRAMEHMG.

%   Copyright 2008-2009 Joan Sola @ LAAS-CNRS.

% Frame World -> Robot  :  Rf
% Frame Robot -> Sensor :  Sf

if(isempty(Sd))
    % In Sensor Frame:
    [hmsen, HMSEN_sk, HMSEN_u, HMSEN_n] = invPinHoleHmg(Sk,u,n) ;
else
    error('??? NYI ''Sd'' for invPinHoleHmg')
end

% In rob Frame
[hmrob, HMROB_sf, HMROB_hmsen] = fromFrameHmg(Sf,hmsen) ;

% In World Frame
[hmg, HMG_rf, HMG_hmrob] = fromFrameHmg(Rf,hmrob) ;



% Jacobians

HMG_sf = HMG_hmrob*HMROB_sf ;
HMG_sk = HMG_hmrob*HMROB_hmsen*HMSEN_sk ;

if(isempty(Sd))
    HMG_sd = Sd ;
else
    error('??? NYI ''Sd'' for invPinHoleHmg')
end

HMG_u = HMG_hmrob*HMROB_hmsen*HMSEN_u ;
HMG_n = HMG_hmrob*HMROB_hmsen*HMSEN_n ;

end





% ========== End of function - Start GPL license ==========


%   # START GPL LICENSE

%---------------------------------------------------------------------
%
%   This file is part of SLAMTB, a SLAM toolbox for Matlab.
%
%   SLAMTB is free software: you can redistribute it and/or modify
%   it under the terms of the GNU General Public License as published by
%   the Free Software Foundation, either version 3 of the License, or
%   (at your option) any later version.
%
%   SLAMTB is distributed in the hope that it will be useful,
%   but WITHOUT ANY WARRANTY; without even the implied warranty of
%   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%   GNU General Public License for more details.
%
%   You should have received a copy of the GNU General Public License
%   along with SLAMTB.  If not, see <http://www.gnu.org/licenses/>.
%
%---------------------------------------------------------------------

%   SLAMTB is Copyright 2007,2008,2009 
%   by Joan Sola, David Marquez and Jean Marie Codol @ LAAS-CNRS.
%   See on top of this file for its particular copyright.

%   # END GPL LICENSE

