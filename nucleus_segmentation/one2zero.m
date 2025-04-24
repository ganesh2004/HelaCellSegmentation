function [BW] = one2zero(BW)
    
    [u,v] = size(BW);
    vmax = max(max(BW));
    
    for i=1:u
        for j=1:v
            if BW(i,j) == vmax
                BW(i,j) = 0;
            else
                BW(i,j) = vmax;
            end
        end
    end
end