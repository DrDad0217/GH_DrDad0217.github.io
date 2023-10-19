---
layout: post
title:  "Managing my blog with Jekyll and Github Pages"
date:   2023-10-18 +/-TTTT
categories: Documentation
image:
  path: Halloween.png
  width: 1000   # in pixels
  height: 400   # in pixels
  alt: It's the most wonderful time of the year!
tags: Beginner
img_path: /assets/img/
toc: false
---

After my fourth time of having to setting this up, I have finally decided to document the process. Here are the tools I am using to run my blog along with additional links. 

<img 
    align="left" 
    width="100" 
    height="100" 
    src="Get-Date-Example-01.png">

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

In my case, I already have a repo set up on Github with the Chirpy theme and have cloned it locally to my machine. I used the [Chirpy starter guide](https://github.com/cotes2020/chirpy-starter) to get started. 
While in the root of my repo, I will run the following command to install the gems:

```powershell
bundle install
```
```



    