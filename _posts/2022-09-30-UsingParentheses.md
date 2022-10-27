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



What purpose do parentheses serve in Powershell? Think back to math class when we were taught order of operations,the math in between the `(2+2)` always needs to be done first. Powershell follows this rule the same way, lets start with a few examples.

```powershell
Restart-Computer -Computername (Get-Content -Path 'C:\Computerlist.txt')
```
 Lets say you have a text file containing a multiple computer names you would like to run a command against. `Restart-Computer` looks at the content loaded by the `-Computername` parameter and starts restarting the machines listed in `Computerlist.txt`. 

`Summary of how much time has passed since you were born`
```powershell
(Get-Date) - (Get-Date 02/17/1993)
```
![DateExample](Get-Date-Example-03.png)

`Retrieve all parameters from cmdlet`
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
