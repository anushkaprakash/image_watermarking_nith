%function [PSNR] = psnr_def(cover,output)
cover = im2double(imread('lena.png'));
wmi = im2double(imread('wm_image.png'));
    PSNR = psnr(cover,wmi)