x = [1, 2, 4, 8]
h = [2, 3, 4, 5]

function [r]=fourier_convol(_x, _h)
    xl = length(_x)
    hl = length(_h)
    final_length = xl + hl - 1
    
    _x = cat(2, _x, zeros(1, final_length - xl))
    _h = cat(2, _h, zeros(1, final_length - hl))
    
    x_dft = fft(_x, -1)
    h_dft = fft(_h, -1)
    
    r = x_dft .* h_dft

    r = fft(r, 1)
endfunction

disp(fourier_convol(x, h))
disp(convol(x, h))
