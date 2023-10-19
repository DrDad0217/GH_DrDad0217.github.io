---
layout: post
title:  "Managing my blog with Jekyll and Github Pages"
date:   2023-10-18 +/-TTTT
categories: Documentation
image:
  path: Jack-O-Lantern.jpg
  width: 1000   # in pixels
  height: 400   # in pixels
  alt: It's the most wonderful time of the year!
tags: Beginner
img_path: /assets/img/
toc: false
---

After my fourth time of having to setting this up, I have finally decided to document the process. Here are the tools I am using to run my blog along with additional links. 

- [Jekyll Install](https://jekyllrb.com/docs/installation/)
- [Github Pages](https://pages.github.com/)
- [Visual Studio Code](https://code.visualstudio.com/)
- [Chirpy Theme](https://chirpy.cotes.page/)

## Jekyll Install
In my case, I am running Windows 10, I will be following the instructions for Windows from Jekyll's [website](https://jekyllrb.com/docs/installation/windows/). 

To start, I will need to install Ruby. I will be using the  [Installer](https://rubyinstaller.org/downloads/)from Ruby's website to get Ruby+Devkit 3.2.2-1 (x64) version with it being the latest release. 

Following the documentation, we leave the *ridk install option* ticked and click *Finish*. This will open a command prompt window and ask us to press enter to continue.


![Ruby Install](/Ruby_Install_01.png){: .normal width="300" height="300"}

After hitting finish, command prompt will run asking us to choose an option. We will choose option 3 to install MSYS2 and MINGW development toolchain.

![Ruby Install](/Ruby_Install_02.png){: .normal width="300" height="300"}

Now we will run a new command propmt window and run the following command to install Jekyll and Bundler:

```powershell
gem install jekyll bundler
```

In my case, I already have a repo set up on Github with the Chirpy theme and will be cloning it locally to my machine. I used the [Chirpy starter guide](https://github.com/cotes2020/chirpy-starter) to get started. 

```powershell
git clone myrepo
```
This actually failed providing me with this error: *fatal: unable to access 'https://github.com/DrDad0217/myrepo.git/': SSL certificate problem: self-signed certificate in certificate chain*

I found [This](https://confluence.atlassian.com/bbkb/ssl-certificate-problem-self-signed-certificate-in-certificate-chain-error-in-git-1224773006.html#:~:text=The%20error%20message%20%22self%2Dsigned,by%20an%20untrusted%20certificate%20authority.) article which was helpful in configuring a Windows system to use the schannel library built into Windows to handle the SSL backend for HTTP communication.

To do this, I ran the following command in VScode's terminal:

```powershell
git config --global http.sslBackend schannel
```
After doing so, I was able to clone my repo with no issues.

Since I already have my gemfile configured, I am going to run a command that will start my local server and allow me to view my blog locally. 

```powershell
Bundle exec jekyll serve
```
The output has a lot of information, but the important part is the last line which tells me that my server is running locally on port 4000.

That's great and everything, but I want to have the site automatically refresh every time I make a change in in my editor and save it. I can apply this by adding the livereload 
flag to my command.

```powershell
Bundle exec jekyll serve --livereload
```
Here's a big thank you from future me to now me for documenting this process. :star:




    