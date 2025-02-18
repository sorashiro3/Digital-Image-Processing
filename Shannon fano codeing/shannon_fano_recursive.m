function codes = shannon_fano_recursive(prob, codes, prefix)

n = length(prob);
    if n == 1
        codes{1} = prefix;
        return;
    end
 % Find partition index where cumulative probability is closest to half
    total = sum(prob);
    cumulative = cumsum(prob);
    [~, split] = min(abs(cumulative - total / 2));

    % Assign '0' to first half, '1' to second half
    for i = 1:split
        codes{i} = strcat(prefix, '0');
    end
    for i = split+1:n
        codes{i} = strcat(prefix, '1');
    end

    % Recursive calls for both halves
    codes(1:split) = shannon_fano_recursive(prob(1:split), codes(1:split), strcat(prefix, '0'));
    codes(split+1:end) = shannon_fano_recursive(prob(split+1:end), codes(split+1:end), strcat(prefix, '1'));
end