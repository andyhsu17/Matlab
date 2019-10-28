function rv = hchord( spec, dur, cont)
  % produce a sampled signal for a chord of duration
  % 'dur' from a specification 'spec', which is a list
  % of notes
  % Input row vector 'cont' gives the percent contribution of volume for each
  % harmonic increasing. For example, an input in cont of [.7, .3] will
  % play the input signal at 70% volume for the base chord, and 30%
  % volume for the first harmonic.

  % obtain number of notes in chord
  [N, width] = size(spec);
  if width ~= 2
    error('malformed input')
  end
  
  % number of harmonics to be played
  [a, M] = size(cont);
  if a ~= 1
      error('malformed input')
  end
  % sample times
  t = (0:8192*dur-1)/8192;
  % initialize signal and accumulate notes into it
  rv = zeros(1, length(t));
  
  % play each chord at varying volumes with an increase of 'f' in frequency
  % for each harmonic requested in input
  for m = 1:M
     for n = 1:N
    f =  m * 440 * 2^(spec(n,1) + spec(n,2)/12);
    rv = rv + (cont(1, m) .* sin(2*pi*f*t));
     end
  end
  
      
  % scale the signal to within (-1,1)
  rv = rv/N * 0.999;  
  
  %plot 5 periods of resulting harmonic chord frequency
  plot(t(1:(5 * 8192 / 440)),rv(1:(5 * 8192 / 440)));
end


