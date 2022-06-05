function X = bartelsStewart(A, B, C, D, E)
% AXB^T + CXD^T = E

% Solution will be a m by n matrix.
[m, n] = size(E);
Y = zeros(m, n);

[P, S, Q1, Z1] = qz(A, C);  
[T, R, Q2, Z2] = qz(D, B);
F = Q1*E*Q2.';

% Initialise S*Y and P*Y factors:
PY = zeros(m, n);
SY = zeros(m, n);

% Do a backwards substitution type algorithm to construct the solution.
k = n;

% Construct columns n,n-1,...,3,2,1 of the transformed solution.
while ( k > 0 )
    
    % There are two cases, either the subdiagonal contains a zero, i.e.,
    % T(k,k-1) = 0 and then it is simply a backwards substitution, or T(k,k-1)
    % ~= 0 and we solve a 2mx2m system.
    
    if ( k == 1 || T(k,k-1) == 0 )
        % Simple case (Usually end up here).
        
        jj = (k+1):n;
        rhs = F(:,k) - PY(:,jj)*R(k,jj).' - SY(:,jj)*T(k,jj).';
%         rhs = F(:,k) - PY*R(k,:).' - SY*T(k,:).';
        
        % Find the kth column of the transformed solution.
        tmp = R(k,k)*P + T(k,k)*S;
        Y(:,k) = tmp \ rhs;
        
        % Store S*Y and P*Y factors:
        PY(:,k) = P*Y(:,k);
        SY(:,k) = S*Y(:,k);
        
        % Go to next column:
        k = k - 1;
        
    else

        % This is a straight copy from the Gardiner et al. paper, and just
        % solves for two columns at once. (Works because of quasi-triangular
        % matrices.)
        
        % Operator reduction.
        jj = (k+1):n;
        rhs1 = F(:,k-1) - PY(:,jj)*R(k-1,jj).' - SY(:,jj)*T(k-1,jj).';
        rhs2 = F(:,k)   - PY(:,jj)*R(k,jj).'   - SY(:,jj)*T(k,jj).';

        % 2 by 2 system.
        SM = [R(k-1,k-1)*P + T(k-1,k-1)*S , R(k-1,k)*P + T(k-1,k)*S ;
              T(k,k-1)*S                  , R(k,k)*P + T(k,k)*S     ];
          
        % Solve.
%         UM = SM \ [rhs1 ; rhs2];

        % Solve (permute the columns and rows):
        idx = reshape([(1:m) ; (m+1:2*m)], 2*m, 1);
        rhs = [rhs1 ; rhs2];
        UM = SM(idx,idx) \ rhs(idx);
        UM(idx) = UM;
        
        % Store S*Y and P*Y factors:
        Y(:,k-1:k) = reshape(UM, m, 2);
        PY(:,k-1:k) = P*Y(:,k-1:k);
        SY(:,k-1:k) = S*Y(:,k-1:k);

        % We solved for two columns so go two columns farther.
        k = k - 2;
        
    end
    
end

% We have now computed the transformed solution so we just transform it back.
X = Z1*Y*Z2.';

end