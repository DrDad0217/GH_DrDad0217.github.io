---
layout: post
title:  "Five things I wish I would of learned sooner in Powershell"
date:   2022-08-31 19:03:31 +/-TTTT
categories: Powershell
---
* Snacking with Penny :baby:
* Using Parentheses 
* Customizing user profile
* Alias shortcuts to improve productivity
* Using the help file
* Using Get Member
* Creating reusable tools
* Error handling
* Passing objects through the pipeline Byvalue and Byproperty
* PSCustomobject
* Hash Tables (Nested too?)
* Arrays
* Errors and Exception handling
* Switch

### Using Parentheses

Using parentheses can be helpful in numerous situations, for example have you ever ran something similar to this?
```powershell
$Computers = Get-Content 'C:\Computerlist.txt'
Restart-Computer -Computername $Computers
# We can acheive the same results by using parentheses
Restart-Computer -Computername (Get-Content 'C:\Computerlist.txt')
```
By including the parentheses you are telling Powershell to load the content surrounded by them first, by the time Restart-Computer goes to read the data from the -Computername parameter all of the machine names have already been loaded. Here is an example I run whenever I want to inspect ***Just*** the parameters of the command

```powershell
(Get-command Get-Process).Parameters
```
![alt text](/assets/img/Five-Things-Posh/Parameter-Example.png)

Here is another example I use quite often when want to involve thresholds of time or a specific date. 

```powershell
# Using a variable
$Date = Get-Date
$Date.AddDays(-365)

# Using parenthesis
(Get-date).AddDays(-365)

```

![alt text](/assets/img/Five-Things-Posh/Get-Date-Example-01.png)

Here is a real use case scenario with the previous example
```powershell
# Real Use case scenario
Get-WinEvent -logName 'system' | Where {$_.Timecreated -gt (get-date).AddDays(-1)}
```
![alt text](/assets/img/Five-Things-Posh/Get-Date-Example-02.png)

Wrapping the parenthesis around Get-Date allows me to access the method straight away. My best advice would be to try some combinations out yourself, you would be surprised to find out what you can achieve with less code. In the long run this not only makes your code easier to read and write but also debug as. 










