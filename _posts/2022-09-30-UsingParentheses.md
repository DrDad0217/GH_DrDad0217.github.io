---
layout: post
title:  "Cleaning up your code with Parentheses"
date:   2022-08-31 20:03:31 +/-TTTT
categories: Powershell
image:
  path: Halloween.png
  width: 1000   # in pixels
  height: 400   # in pixels
  alt: It's the most wonderful time of the year!
tags: Beginner
img_path: /assets/img/
toc: false
---



<span style="color:white;font-weight:500;font-size:22">
When I first discovered the shortcuts you can take with parentheses it opened up my eyes to new levels of creativity with Powershell.
<span>
```powershell
$Computers = Get-Content 'C:\Computerlist.txt'
Restart-Computer -Computername $Computers
# We can acheive the same results by using parentheses
Restart-Computer -Computername (Get-Content 'C:\Computerlist.txt')
```
<span style="color:white;font-weight:500;font-size:22">
By including the parentheses you are telling Powershell to load the content surrounded by them first, by the time Restart-Computer goes to read the data from the -Computername parameter all of the machine names have already been loaded. Here is an example I run whenever I want to inspect ***Just*** the parameters of the command
<span>
```powershell
(Get-command Get-Process).Parameters
```
![ParamExample](Parameter-Example.png)
<span style="color:white;font-weight:500;font-size:22">
Here is another example I use quite often when want to involve thresholds of time or a specific date. 
</span>

```powershell
# Using a variable
$Date = Get-Date
$Date.AddDays(-365)

# Using parenthesis
(Get-date).AddDays(-365)

```

![DateExample](Get-Date-Example-01.png){: w="800" h="400" }




```powershell
# Real Use case scenario
Get-WinEvent -logName 'system' | Where {$_.Timecreated -gt (get-date).AddDays(-1)}
```
![DateExample](Get-Date-Example-02.png){: .left }



<span style="color:white;font-weight:500;font-size:22">
Wrapping the parenthesis around Get-Date allows me to access the method straight away. My best advice would be to try some combinations out yourself, you would be surprised to find out what you can achieve with less code. In the long run this not only makes your code easier to read and write but also debug. 
</span>




