//task 1
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
x = [1 2 3 4 5 5 6 7]   
h = [1 4 2]

function [r]=overlap_add_convol(_x, _h)
    xl = length(_x)
    x1 = _x(1:xl / 2)
    x2 = _x(xl / 2 + 1:$)

    final_length = length(_x) + length(_h) - 1
    
    x1f = fourier_convol(x1, _h)
    x2f = fourier_convol(x2, _h)
    
    _x1 = cat(2, x1f, zeros(1, final_length - length(x1f)))
    _x2 = cat(2, zeros(1, final_length - length(x2f)), x2f)
    
    r = _x1 + _x2
endfunction

disp(overlap_add_convol(x, h))
disp(convol(x, h))

//task 3
function [r]=f(_k, _T)
    r= cos(2 * %pi * _k / _T)
endfunction
 
//3.1. y(k)=cos(2pik/4)
T = 4
k = 0:0.1:15
 
subplot(2, 2, 1)
xtitle('y(k)=cos(2*pi*k/4)')
plot(k, f(k, T), '--')
 
subplot(2, 2, 2)
k = 0:15
y = abs(fft(f(k, T)))
xtitle('fft(y(k)=cos(2*pi*k/4))'))
plot2d3(k./16, y)
plot(k./16, y, 'o')
 
subplot(2, 2, 1)
k = 0:15
plot(k, f(k, T), 'o')
plot2d3(k, f(k, T))
 
//3.2. cos(2pik/6)
T = 6
k = 0:0.1:15
y = f(k, T)
Y = fft(y)
 
subplot(2, 2, 3)
xtitle('y(k)=cos(2*pi*k/6)')
plot(k, y, '--')
 
subplot(2, 2, 4)
k = 0:15
xtitle('fft(y(k)=cos(2*pi*k/6))')
y = abs(fft(f(k, T)))
plot2d3(k./16, y)
plot(k./16, y, 'o')
 
subplot(2, 2, 3)
k = 0:15
plot(k, f(k, T), 'o')
plot2d3(k, f(k, T))

//4
subplot(2,1,1)
s = [[1 1 1 1] zeros(1, 26)]
n = 0:29
S = abs(fft(s))
plot(n ./ 30, S, "or")
plot2d3(n ./30, S)

subplot(2,1,1)
s = [1 1 1 1 0 0 0 0 0 0 0 0 0 0 0]
n= 0:14
S = abs(fft(s))
plot(n ./ 15, S, "o")
plot2d3(n ./15, S)
