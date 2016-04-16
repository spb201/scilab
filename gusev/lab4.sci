//task 1
_x = [1, 2, 4, 8]
_h = [2, 3, 4, 5]

function [r]=fourier_convol(x, h)
    final_length = length(_x) + length(_h) - 1
    x = zeros(1, final_length)
    h = zeros(1, final_length)
    r = zeros(1, final_length)
    
    for i=1:final_length
        try
            x(i) = _x(i)
            h(i) = _h(i)
        end
    end
    
    x_dft = fft(x, -1)
    h_dft = fft(h, -1)
    
    for i=1:final_length
        r(i) = x_dft(i) * h_dft(i)
    end
    
    r = fft(r, 1)
endfunction

disp(fourier_convol(_x, _h))
disp(convol(_x, _h))
