﻿# VSTS Coverage Badge [![Go Report Card](https://goreportcard.com/badge/github.com/dwragge/vsts-coverage-badge)](https://goreportcard.com/report/github.com/dwragge/vsts-coverage-badge)
VSTS doesn't provide a way to show Code Coverage for builds on GitHub in a badge form like Coveralls, luckily VSTS has a great API and we can do this ourselves. First project in Go and using AWS and Lambda functions.

## Sample
[![Sample](https://118lmessn7.execute-api.ap-southeast-2.amazonaws.com/dev/vsts-coverage-badge?Tenant=Dymajo&Project=Dymajo%20Transfer)](https://118lmessn7.execute-api.ap-southeast-2.amazonaws.com/dev/vsts-coverage-badge?Tenant=Dymajo&Project=Dymajo%20Transfer)

## Building and Deployment
Requires:
 - Go 1.x
 - [dep](https://github.com/golang/dep)
 - [serverless](https://www.serverless.com)
 - AWS

In order to access VSTS, the environment variable `VSTS_ACCESS_TOKEN` must be set with an access token generated on VSTS.

For local testing comment the lambda function call and uncomment the http listenter in `main.go` then build and run using `go run main.go`. A local http server will be listening on `localhost:8080`.

To deploy, run `make` if on linux/osx, followed by `serverless deploy` to deploy to AWS. Unfortunately, **deployment from Windows is not supported**.

## API Parameters
| Parameter Name | Required | Meaning |
| -------------- | -------- | ------- |
| Tenant         | Yes      | The VSTS tenant name, ie. the part before visualstudio.com |
| Project | Yes | The name of the project to get coverage results for |
| Bucket | No | The name of the S3 bucket in which to put the badge svg file, (requires S3 permissions) |
| Folder | No | The name of the folder to but the badge into, default `badges/`
