function [codes] = shannonFano(prob)


% storing the original indicies
[prob, idx] = sort(prob, 'descend');

codes = repmat({''}, size(prob));

codes = shannon_fano_recursive(prob, codes, '');

codes(idx) = codes;
end
