# PS-LambdaPublish
Quick PowerShell Utility for publishing to AWS Lambda

This utility is intended for quick updating of AWS Lambda functions so that you can quickly update and test while developing.

##Installation
(This assumes you have the [AWS Tools for Windows PowerShell](https://aws.amazon.com/powershell/) installed
Add lambda-push.ps1 to a folder which is listed in your PATH environment variable (or create a new one)
## Usage
Run lambda-push from your function's local directory.
The Lambda function must already be created for this to work.
### Parameters
| Name  | Description |
| --- | --- |
| -name | This will be the name of the zip file (e.g. *-name myfunc* will result in *myfunc.zip*) |
| -lambda | Name of the AWS Lambda function |
### Example
```Powershell
PS> lambda-push -name myfuncname -lambda myfuncDEV
```
