function [x]=foo(a, b)
  x = 4*exp(-3*a) + b^(2*%pi)
endfunction

printf("%f", foo(8, 3.9))
