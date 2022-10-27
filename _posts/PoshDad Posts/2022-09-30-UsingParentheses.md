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
Parentheses serve numerous purposes in Powershell such as the following
* Arrays and Hash Tables
* `Foreach`, `switch` and `If` constructs/conditional statements
* Methods
* Subexpressions

Lets kick this article off with a few examples :rocket: :rocket: :rocket:

What purpose do parentheses serve in Powershell? Think back to math class when we were taught order of operations,the math in between the `(2+2)` always needs to be done first. Powershell follows this rule the same way, lets start with a few examples.

### *Example 1*
Say that we have a text file named `computers.txt`. This text file contains a few computer names we would like to restart using Powershell.


```powershell
Restart-Computer -Computername (Get-Content -Path 'C:\Computerlist.txt')
```
 Lets say you have a text file containing a multiple computer names you would like to run a command against. `Restart-Computer` looks at the content loaded by the `-Computername` parameter and starts restarting the machines listed in `Computerlist.txt`. 


`Summary of how much time has passed since you were born`
By wrapping the parentheses arount the `Get-Content` cmdlet you are telling Powershell to load that content first, by the time `Restart-Computer` goes to read the data from the `Computername` parameter  the computer names have already been loaded. A nice and easy one liner to perform an action on multiple computers.

### *Example 2*
For the next example, I am going to use the `Get-Date` cmdlet to calculate how many days,hours and even minutes have gone by since I was born.

```powershell
(Get-Date) - (Get-Date 02/17/1993)
```
![DateExample](Get-Date-Example-03.png)
Looks like I have been alive a whopping `10,828` days! This example included loading two different dates using the `Get-Date` command, so how does this happen?
1. The content in the `Get-Date` commands surrounded by `()` get loaded first.
2. We use the `-` operator to subtract the first date from the second. The first date being the current date, the second being my birthday.

### *Example 3*
This example is a trick I use to grab all of the parameters of a command.
```powershell
(Get-command Get-Process).Parameters.Keys
```
![DateExample](Parameter-Example.png)
Here we are using `Get-Command` against the `Get-Process` cmdlet and enclosing it in parentheses. This gives us access to the `parameters` property which also holds a `key` property itself.  For the next section we are going to dive into subexpressions which can come in pretty handy.

Subexpressions are exactly what they sound like, an expression within an expression. What is an expression defined as? You can think of it as anything that we run in our terminal that provides us with an output/result. if you go to powershell right now and type out `2+2` you are using an expression. You could also write out `"Two plus two equals four"` which would also be considered an expression. 

```powershell
"Two plus two equals four" # This would give us output in the terminal exactly as it it written
"2+2" # This would provide us with the value four
```
Both of these expressions would work as they should, but what happens if we try to execute both of them within the same double quotes?
```
"Two plus two equals 2+2"
```

Unfortunately this would not work, Powershell would read this as the text value as is. This is where subexpressions come into play.
```
"Two plus two = $(2+2)"
```
`Output` :computer:
```
Two plus two = four
```
Now thats the output we were looking for, lets look at another example.

I find myself using subexpressions alot with `Get-Date` . Lets create a log file with todays date using a subexpression.

We can start with the contents of the file. I will start by creating a variable containing the value I want to be in the file.

```powershell
$Message = "The dog chased the red ball"
```

Now that we have the content for the logfile, lets create the file itself.

```powershell
 New-Item -Path "C:\Temp\TestLog-$(Get-Date -Format MM-dd-yy).txt" -Value $Message
```
`Output` :computer:
```
Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
-a---          10/27/2022  3:25 PM             27 TestLog-10-27-22.txt
```

Beautiful! The subexpression allowed us to encorporate todays date into the name of our logfile. For fun lets inspect the content of the file using `Get-Content`

```powershell
Get-Content -Path "C:\Temp\TestLog-10-27-22.txt"
```
`Output` :computer:
```
The Dog chased the red ball
```

Perfect, seems like everything is in order. I hope this article helped you acheive a better understanding of parentheses.

PoshDad signing off!