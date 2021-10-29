1;
## Function : find_equilibrium_points()
## ----------------------------------------------------
## Input:   x1_dot, x2_dot (Both are symbolic functions defined in terms of x1 
##          and x2)
## Output:  eqbm_points ( Solution in form of a matrix in which each entry is a 
##          solution)
## Purpose: This function takes the symbolic functions x1_dot and x2_dot and 
##          converts them into equations where x1_dot = 0  and x2_dot = 0. Then 
##          it proceeds to solve the equation (by calling the solve() function
##          in octave) and returns all possible values of x1 and x2 in form of a 
##          matrix.
function [x_1,x_2] = find_equilibrium_points(x1_dot, x2_dot)
  x1_dot == 0;
  x2_dot == 0;
  ################## ADD YOUR CODE HERE ######################
  [x_1,x_2]=solve(x1_dot,x2_dot)
  ############################################################  
  x_1=double(x_1);
  x_2=double(x_2);
endfunction

## Function : find_jacobian_matrices()
## ----------------------------------------------------
## Input:   eqbm_points, x1_dot, x2_dot (eqbm_points is matrix generated in 
##          find_equilibrium_points() function.
## Output:  jacobian_matrices
## Purpose: This function takes the eqbm_points and x1_dot and x2_dot as input. 
##          It computes the jacobian matrix for x1_dot and x2_dot (It should be 
##          (2x2 symbolic array). Then it substitutes the calculated values of 
##          x1 and x2 for each of the equilibrium_points (stored in eqbm_points 
##          variable). The jacobian_matrices variable is a cell array in which 
##          each element is a 2x2 J matrix calculated for each of the corresponding
##          equilibrium_points.
## Hint:    It might be helpful to look up jacobian() and subs() function in octave.
function jacobian_matrices = find_jacobian_matrices(x_1, x_2, x1_dot, x2_dot)
  syms x1 x2
  solutions = [x_1, x_2];
  jacobian_matrices = {};
  ################## ADD YOUR CODE HERE ######################
  jacobians=jacobian([x1_dot;x2_dot])
  for k = 1:size(solutions, 1)
   jacobian_matrices{k} = double(subs(jacobians, {x1 x2}, [x_1(k,1) x_2(k,1)]));
  endfor
  ############################################################  
endfunction

## Function : check_eigen_values()
## ----------------------------------------------------
## Input:   eqbm_points, jacobian_matrices
## Output:  eigen_values , stability
## Purpose: This function takes the eqbm_points and jacobian_matrices as input. 
##          For each jacobian matrix stored in jacobian_matrices, the eigen values
##          of matrix are calculated and stored in the cell array eigen_values.
##          Subsequently the eigen values are checked in this function. If for any
##          jacobian matrix the eigen values have positive real part, the system is
##          unstable at the corresponding equilibrium point. If all eigen values
##          have negative real part, the system is stable at the corresponding
##          equilibrium point.
## Hint:    It might be helpful to look up eig() function in octave
function [eigen_values stability] = check_eigen_values(x_1, x_2, jacobian_matrices)
  stability = {};
  eigen_values = {};
  for k = 1:length(jacobian_matrices)
    matrix = jacobian_matrices{k};
    flag = 1;
    ################## ADD YOUR CODE HERE ######################
    eigen_values{k}=eig(matrix);
    for j = 1:length(eigen_values{k})
      if (real(eigen_values{k}(j))>0)
        flag=0;
        break;
      endif
     endfor
    ############################################################
    if flag == 1
      fprintf("The system is stable for equilibrium point (%d, %d) \n",double(x_1(k)),double(x_2(k)));
      stability{k} = "Stable";
    else
      fprintf("The system is unstable for equilibrium point (%d, %d) \n",double(x_1(k)),double(x_2(k)));
      stability{k} = "Unstable";
    endif
  endfor
endfunction

## Function : main_function()
## ----------------------------------------------------
## Input:   x1_dot, x2_dot
## Output:  equilibrium_points, jacobian_matrices, eigen_values , stability
## Purpose: It takes x1_dot and x2_dot as argument. First the equilibrium points
##          are calculated. For each equilibrium point, the jacobian matrix is 
##          calculated. Then the stability for each equilibrium point is determined 
##          by computing the eigen_values and checking the real parts of eigen 
##          values.
##          This equation returns equilibrium_points, jacobians, eigen_values, 
##          stability. Each of these is a cell array.
##          YOU ARE NOT ALLOWED TO MAKE ANY CHANGES TO THIS FUNCTION
function [x_1 x_2 jacobians eigen_values stability] = main_function(x1_dot, x2_dot)
  pkg load symbolic      # Load the octave symbolic library
  syms x1 x2             # Define symbolic variables x1 and x1
  [x_1,x_2] = find_equilibrium_points(x1_dot, x2_dot);
  jacobians = find_jacobian_matrices(x_1, x_2, x1_dot, x2_dot);
  [eigen_values stability] = check_eigen_values(x_1, x_2, jacobians); 
endfunction
