function handleStr = createLmkGraphics(Lmk,labelColor,ax)

% CREATELMKGRAPHICS  Crate landmark graphics.
%   CREATELMKGRAPHICS(LMK,LBLCLR) creates the graphics objects for the
%   landmark LMK: a 3-sigma ellipsoid, a mean point, and a label with color
%   LBLCLR.
%
%   CREATELMKGRAPHICS(...,AX) creates the graphics at axes AX.
%
%   HSTR = CREATELMKGRAPHICS returns a structure of handles for the three
%   objects:
%       HSTR.mean     the mean
%       HSTR.ellipse  the 3-sigma ellipsoid
%       HSTR.label    the label.

if nargin < 3
    ax = gca;
end

handleStr.mean = line(...
    'parent',       ax,...
    'xdata',        [],...
    'ydata',        [],...
    'zdata',        [],...
    'linestyle',    'none',...
    'marker',       '.',...
    'visible',      'off');

handleStr.ellipse = line(...
    'parent',       ax,...
    'xdata',        [],...
    'ydata',        [],...
    'zdata',        [],...
    'linestyle',    '-',...
    'marker',       'none',...
    'visible',      'off');

handleStr.label = text(...
    'parent',              ax,...
    'string',              num2str(Lmk.lmk),...
    'color',               labelColor,...
    'fontsize',            10,...
    'fontweight',          'normal',...
    'horizontalalignment', 'center',...
    'visible',             'off');
