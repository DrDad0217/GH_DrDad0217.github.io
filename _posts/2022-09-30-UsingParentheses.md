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

### What exactly do parentheses do in Powershell? 
Parentheses serve a few purposes in Powershell such as the following
* Arrays and Hash Tables
* `Foreach`, `switch` and `If` constructs/conditional statements
* Methods
* Subexpressions

Lets kick this article off with a few examples :rocket: :rocket: :rocket:





```powershell
Restart-Computer -Computername (Get-Content 'C:\Computerlist.txt')
```

By including the parentheses you are telling Powershell to load the content enclosed in the parentheses, by the time `Restart-Computer` goes to read the data from the `Computername` parameter  the computer names have already been loaded. A simple one liner to perform an action on multiple computers.

#### How much time has passed since you were born? :clock10:
```powershell
(Get-Date) - (Get-Date 02/17/1993)
```
![DateExample](Get-Date-Example-03.png)
Looks like I have been alive a whopping `10,828` days! This example included loading two different dates using the `Get-Date` command, so how does this happen?
1. The content in the `Get-Date` commands surrounded by `()` get loaded first.
2. We use the `-` operator to subtract the first date from the second. The first date being the current date, the second being my birthday.
#### Retrieve all parameters from cmdlet
```powershell
(Get-command Get-Process).Parameters
```
![DateExample](Parameter-Example.png)


`Get system event logs within the last 24 hours`

```powershell
Get-WinEvent -logName 'system' | Where {$_.Timecreated -gt (get-date).AddDays(-1)}
```


### Subexpression Examples

```powershell
$UserInfo = [PSCustomObject]@{
    
    UserName = 'PoshDad'
    Email = 'PoshDad@ThePoshDad.Com'
    Company = 'PoshDadInc'

}

"Hi im the $($UserInfo.Username), I work for $($UserInfo.Company), You can reach me at $($UserInfo.Email)"

```

```powershell
"The first process in the list is $(Get-service | select -ExpandProperty Name -First 1)"
```

```powershell
"Two Plus Two is equal to $(2+2)"
"If I ran Get-Process, the first Process in the list would be $(Get-Process)[0].name"
```
In the employee separation script I created, there is a logfile generated stating the removal process and what took place. The logfile includes the users name and the date, I will provide an example using a subexpression to accomplish this. 

First I need to capture user information in a variable, I went ahead and created a fake user in Active Directory named 'Tanner Schmidt'

![AD User Name And Display Name](User-Log-File-Example-01.png)

Since we are creating a log file, I will create a message as the value that will be populating inside the log file. Once the message is created, we are going to pipe the value inside the `$Message` variable to the `Out-File` Cmdlet. `Out-File` receives the information from the `$Message` variable and creates a new file using the content we provided for the `-Path` parameter.  


```powershell
$Message = "The Employee Separation Script has successfully ran against the user account for $($User.SamAccountName)"
$Message | Out-File -Path "C:\Temp\$($User.SamAccountName)-$(Get-Date -Format MM-dd-yy).txt"
```
> By default, if there is no filename that matches the name of the logfile you are trying to create `Out-File` will do it automatically, if the name does match and you want to overwrite the file completely you can supply the `-Force` parameter
{: .prompt-info }
Now lets fetch the results, after navigating to `C:\temp`{: .filepath} I opened up the logfile we created.
![](User-Log-File-Example-02.png)
As shown in the screenshot above we achieved the desired results. 
