function result = myFunction(input)
  % Check for invalid input
  if input < 0
    error('Input must be non-negative');
  elseif input == 0
    result = inf; % Handle division by zero gracefully
    return; 
  end

  try
    result = someCalculation(input);
  catch ME
    % Handle potential errors from someCalculation
    warning('someCalculation failed: %s', ME.message);
    result = NaN; % Or any other appropriate default value
  end
end

function output = someCalculation(x)
  % Check for potential overflow/underflow
  if abs(x) > 1e10 || abs(x) < 1e-10
    warning('Input is too large or too small, potential numerical instability');
    output = NaN;
    return;
  end
  output = 1/x; 
end