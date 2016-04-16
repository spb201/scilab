//task1
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

//task 2
x = [1 2 3 4 5 5]   
h = [1 4 2]

function [r]=overlap_add_convol(_x, _h)
    xl = length(_x)
    x1 = _x(1:ceil(xl / 2))
    x2 = _x(floor(xl / 2) + 1:$)

    final_length = length(_x) + length(_h) - 1
    
    x1f = fourier_convol(x1, _h)
    x2f = fourier_convol(x2, _h)
    
    _x1 = cat(2, x1f, zeros(1, final_length - length(x1f)))
    _x2 = cat(2, zeros(1, final_length - length(x2f)), x2f)
    
    r = _x1 + _x2
endfunction

disp(overlap_add_convol(x, h))
disp(convol(x, h))
