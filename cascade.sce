//By: VINAY KUMAR
//ROLL NO: PH20MSCST11001
//OPTICS ASSIGNMENT 3

//A-1

clear
clc

//Taking inputs about the system of lenses from the user
n=input("Enter the number of sequential elements(lenses) ");

disp("Enter the focal lengths of sequential elements in order");
for i=1:n
f(i)=input("");
end

alpha_in=input("Enter the input angle(in radian)");
x_in=input("Enter the input height");
s_in=input("Enter the object distance");

disp("Enter the distance between lenses in order")
for i=1:n-1
z(i)=input("");
end

in_vect=[alpha_in ; x_in]

//for generating the lens matrices
function lens_mat=genlen(n)
lens_mat(1,1)=1;
lens_mat(1,2)=-1/f(n);
lens_mat(2,1)=0;
lens_mat(2,2)=1;
endfunction

disp("The lens matrices are")
for i=1:n
disp(genlen(i))
end

//using the imaging condition
function img_dist=give(s0, t)
img_dist=(s0*f(t))/(s0-f(t))
endfunction

//calculating and storing the image distance and object
distance
ob(1)=s_in
for i=1:n
im(i)=give(ob(i),i)
if length(z)>=i then
ob(i+1)=z(i)-im(i)
else
ob(i+1)=0
disp("The image distance from the last lens of cascade is")
disp(im(i))
end
end

//for generating the image distance matrices
function img_mat=genimg(b)
img_mat(1,1)=1
img_mat(1,2)=0
img_mat(2,1)=im(b)
img_mat(2,2)=1
endfunction

disp("The image matrices are")
for i=1:n
disp(genimg(i))
end

//for generating the object distance matrices
function dis_mat=genobj(a)
dis_mat(1,1)=1
dis_mat(1,2)=0
dis_mat(2,1)=ob(a)
dis_mat(2,2)=1
endfunction

disp("The object distance matrices are")
for i=1:n
disp(genobj(i))
end

//Generating the composite matrix
mat_prod=[1 0;0 1]
for i=1:n
fg=genimg(i)*genlen(i)*genobj(i)
mat_prod=fg*mat_prod
end
disp("The composite matrix for whole cascade of lenses")
disp(mat_prod)

//displaying the results
disp("Angular Magnification by cascade of lenses is")
disp(mat_prod(1,1))
disp("Spatial Magnification by cascade of lenses is")
disp(mat_prod(2,2))

out_vect=mat_prod*in_vect

disp("alpha_out is")
disp(out_vect(1))
disp("x_out is")
disp(out_vect(2))
