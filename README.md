# Wavelet-Transform-Denoising
This Project is The SEU-CSE's Digital Image Processing class(Dr. Jiang)'s course experiment.

## 项目结构

* WaveletDenosing.m 该脚本是采用两种小波对带噪声信号进行去噪的演示
* Db10DecAndRec.m 该脚本是对带噪声信号进行5层分解后，分别利用每一级的低频系数以及高频系数进行重构的演示
* ComparisionWithFFT.m 该脚本是将小波变换（采用sln阈值模式以及mln模式）与采用低通滤波的快速傅里叶变换进行的演示