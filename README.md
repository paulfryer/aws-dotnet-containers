# aws-dotnet-containers
A CI/CD pipeline to build and deploy .Net application Docker images to managed container services in AWS.

1) Download or copy this repository source code.
2) Create a CodePipeline that uses this code as the source trigger. That can be done via Github, CodeCommit, or S3 Zip.
3) Configure the build step of the pipeline to use a CodeBuild project. That project should use the .Net Core 2.0 build image. It should also have advanced permission because you are building a Docker image. You also need to ensure the IAM Role used by the build server has access to ECR, you can use ECR:* for the access policy. Set the REPOSITORY_URI and CONTAINER_NAME evironment variables on the build project.
4) Configure the deploy step of the Pipeline to ECS, set the Cluster and Serice name. For the input file name use: imagedefinitions.json
