```ps1
Pwsh> sam --help

 Examples
  --------
  To use this command, update your SAM template to specify the path
  to your function's source code in the resource's Code or CodeUri property.

  To build on your workstation, run this command in folder containing
  SAM template. Built artifacts will be written to .aws-sam/build folder
  $ sam build

  To build inside a AWS Lambda like Docker container
  $ sam build --use-container

  To build with inline environment variables passed inside build containers
  $ sam build --use-container --container-env-var Function.ENV_VAR=value --container-env-var GLOBAL_ENV_VAR=value

  To build with environment variables file passd inside build containers
  $ sam build --use-container --container-env-var-file env.json

  To build & run your functions locally
  $ sam build && sam local invoke

  To build and package for deployment
  $ sam build && sam package --s3-bucket <bucketname>

  To build only an individual resource (function or layer) located in the SAM
  template. Downstream SAM package and deploy will deploy only this resource
  $ sam build MyFunction

Options:
  --config-env TEXT               The environment name specifying the default
                                  parameter values in the configuration file
                                  to use. Its default value is 'default'. For
                                  more information about configuration files,
                                  see: https://docs.aws.amazon.com/serverless-
                                  application-
                                  model/latest/developerguide/serverless-sam-
                                  cli-config.html.

  --config-file TEXT              The path and file name of the configuration
                                  file containing default parameter values to
                                  use. Its default value is 'samconfig.toml'
                                  in project directory. For more information
                                  about configuration files, see:
                                  https://docs.aws.amazon.com/serverless-
                                  application-
                                  model/latest/developerguide/serverless-sam-
                                  cli-config.html.

  -u, --use-container             If your functions depend on packages that
                                  have natively compiled dependencies, use
                                  this flag to build your function inside an
                                  AWS Lambda-like Docker container

  -e, --container-env-var TEXT    Input environment variables through command
                                  line to pass into build containers, you can
                                  either input function specific format
                                  (FuncName.VarName=Value) or global format
                                  (VarName=Value). e.g., sam build --use-
                                  container --container-env-var
                                  Func1.VAR1=value1 --container-env-var
                                  VAR2=value2

  -ef, --container-env-var-file PATH
                                  Path to environment variable json file
                                  (e.g., env_vars.json) to pass into build
                                  containers

  -bi, --build-image TEXT         Container image URIs for building
                                  functions/layers. You can specify for all
                                  functions/layers with just the image URI
                                  (--build-image public.ecr.aws/sam/build-
                                  nodejs14.x:latest). You can specify for each
                                  individual function with (--build-image
                                  FunctionLogicalID=public.ecr.aws/sam/build-
                                  nodejs14.x:latest). A combination of the two
                                  can be used. If a function does not have
                                  build image specified or an image URI for
                                  all functions, the default SAM CLI build
                                  images will be used.

  -x, --exclude TEXT              Name of the resource(s) to exclude from the
                                  SAM CLI build.

  -p, --parallel                  Enabled parallel builds. Use this flag to
                                  build your AWS SAM template's functions and
                                  layers in parallel. By default the functions
                                  and layers are built in sequence

  -b, --build-dir DIRECTORY       Path to a folder where the built artifacts
                                  will be stored. This directory will be first
                                  removed before starting a build.

  -cd, --cache-dir DIRECTORY      The folder where the cache artifacts will be
                                  stored when --cached is specified. The
                                  default cache directory is .aws-sam/cache

  -s, --base-dir DIRECTORY        Resolve relative paths to function's source
                                  code with respect to this folder. Use this
                                  if SAM template and your source code are not
                                  in same enclosing folder. By default,
                                  relative paths are resolved with respect to
                                  the SAM template's location

  -m, --manifest PATH             Path to a custom dependency manifest (e.g.,
                                  package.json) to use instead of the default
                                  one

  -c, --cached / --no-cached      Enable cached builds. Use this flag to reuse
                                  build artifacts that have not changed from
                                  previous builds. AWS SAM evaluates whether
                                  you have made any changes to files in your
                                  project directory.

                                  Note: AWS SAM does not evaluate whether
                                  changes have been made to third party
                                  modules that your project depends on, where
                                  you have not provided a specific version.
                                  For example, if your Python function
                                  includes a requirements.txt file with the
                                  following entry requests=1.x and the latest
                                  request module version changes from 1.1 to
                                  1.2, SAM will not pull the latest version
                                  until you run a non-cached build.

  -t, --template-file, --template PATH
                                  AWS SAM template file.  [default:
                                  template.[yaml|yml|json]]

  --parameter-overrides           Optional. A string that contains AWS
                                  CloudFormation parameter overrides encoded
                                  as key=value pairs.For example, 'ParameterKe
                                  y=KeyPairName,ParameterValue=MyKey Parameter
                                  Key=InstanceType,ParameterValue=t1.micro' or
                                  KeyPairName=MyKey InstanceType=t1.micro

  --skip-pull-image               Specify whether CLI should skip pulling down
                                  the latest Docker image for Lambda runtime.

  --docker-network TEXT           Specifies the name or id of an existing
                                  docker network to lambda docker containers
                                  should connect to, along with the default
                                  bridge network. If not specified, the Lambda
                                  containers will only connect to the default
                                  bridge docker network.

  --beta-features / --no-beta-features
                                  Should beta features be enabled.
  --debug                         Turn on debug logging to print debug message
                                  generated by SAM CLI and display timestamps.

  --profile TEXT                  Select a specific profile from your
                                  credential file to get AWS credentials.

  --region TEXT                   Set the AWS Region of the service (e.g. us-
                                  east-1).

  -h, --help                      Show this message and exit. Examples
  --------
  To use this command, update your SAM template to specify the path
  to your function's source code in the resource's Code or CodeUri property.

  To build on your workstation, run this command in folder containing
  SAM template. Built artifacts will be written to .aws-sam/build folder
  $ sam build

  To build inside a AWS Lambda like Docker container
  $ sam build --use-container

  To build with inline environment variables passed inside build containers
  $ sam build --use-container --container-env-var Function.ENV_VAR=value --container-env-var GLOBAL_ENV_VAR=value

  To build with environment variables file passd inside build containers
  $ sam build --use-container --container-env-var-file env.json

  To build & run your functions locally
  $ sam build && sam local invoke

  To build and package for deployment
  $ sam build && sam package --s3-bucket <bucketname>

  To build only an individual resource (function or layer) located in the SAM
  template. Downstream SAM package and deploy will deploy only this resource
  $ sam build MyFunction

Options:
  --config-env TEXT               The environment name specifying the default
                                  parameter values in the configuration file
                                  to use. Its default value is 'default'. For
                                  more information about configuration files,
                                  see: https://docs.aws.amazon.com/serverless-
                                  application-
                                  model/latest/developerguide/serverless-sam-
                                  cli-config.html.

  --config-file TEXT              The path and file name of the configuration
                                  file containing default parameter values to
                                  use. Its default value is 'samconfig.toml'
                                  in project directory. For more information
                                  about configuration files, see:
                                  https://docs.aws.amazon.com/serverless-
                                  application-
                                  model/latest/developerguide/serverless-sam-
                                  cli-config.html.

  -u, --use-container             If your functions depend on packages that
                                  have natively compiled dependencies, use
                                  this flag to build your function inside an
                                  AWS Lambda-like Docker container

  -e, --container-env-var TEXT    Input environment variables through command
                                  line to pass into build containers, you can
                                  either input function specific format
                                  (FuncName.VarName=Value) or global format
                                  (VarName=Value). e.g., sam build --use-
                                  container --container-env-var
                                  Func1.VAR1=value1 --container-env-var
                                  VAR2=value2

  -ef, --container-env-var-file PATH
                                  Path to environment variable json file
                                  (e.g., env_vars.json) to pass into build
                                  containers

  -bi, --build-image TEXT         Container image URIs for building
                                  functions/layers. You can specify for all
                                  functions/layers with just the image URI
                                  (--build-image public.ecr.aws/sam/build-
                                  nodejs14.x:latest). You can specify for each
                                  individual function with (--build-image
                                  FunctionLogicalID=public.ecr.aws/sam/build-
                                  nodejs14.x:latest). A combination of the two
                                  can be used. If a function does not have
                                  build image specified or an image URI for
                                  all functions, the default SAM CLI build
                                  images will be used.

  -x, --exclude TEXT              Name of the resource(s) to exclude from the
                                  SAM CLI build.

  -p, --parallel                  Enabled parallel builds. Use this flag to
                                  build your AWS SAM template's functions and
                                  layers in parallel. By default the functions
                                  and layers are built in sequence

  -b, --build-dir DIRECTORY       Path to a folder where the built artifacts
                                  will be stored. This directory will be first
                                  removed before starting a build.

  -cd, --cache-dir DIRECTORY      The folder where the cache artifacts will be
                                  stored when --cached is specified. The
                                  default cache directory is .aws-sam/cache

  -s, --base-dir DIRECTORY        Resolve relative paths to function's source
                                  code with respect to this folder. Use this
                                  if SAM template and your source code are not
                                  in same enclosing folder. By default,
                                  relative paths are resolved with respect to
                                  the SAM template's location

  -m, --manifest PATH             Path to a custom dependency manifest (e.g.,
                                  package.json) to use instead of the default
                                  one

  -c, --cached / --no-cached      Enable cached builds. Use this flag to reuse
                                  build artifacts that have not changed from
                                  previous builds. AWS SAM evaluates whether
                                  you have made any changes to files in your
                                  project directory.

                                  Note: AWS SAM does not evaluate whether
                                  changes have been made to third party
                                  modules that your project depends on, where
                                  you have not provided a specific version.
                                  For example, if your Python function
                                  includes a requirements.txt file with the
                                  following entry requests=1.x and the latest
                                  request module version changes from 1.1 to
                                  1.2, SAM will not pull the latest version
                                  until you run a non-cached build.

  -t, --template-file, --template PATH
                                  AWS SAM template file.  [default:
                                  template.[yaml|yml|json]]

  --parameter-overrides           Optional. A string that contains AWS
                                  CloudFormation parameter overrides encoded
                                  as key=value pairs.For example, 'ParameterKe
                                  y=KeyPairName,ParameterValue=MyKey Parameter
                                  Key=InstanceType,ParameterValue=t1.micro' or
                                  KeyPairName=MyKey InstanceType=t1.micro

  --skip-pull-image               Specify whether CLI should skip pulling down
                                  the latest Docker image for Lambda runtime.

  --docker-network TEXT           Specifies the name or id of an existing
                                  docker network to lambda docker containers
                                  should connect to, along with the default
                                  bridge network. If not specified, the Lambda
                                  containers will only connect to the default
                                  bridge docker network.

  --beta-features / --no-beta-features
                                  Should beta features be enabled.
  --debug                         Turn on debug logging to print debug message
                                  generated by SAM CLI and display timestamps.

  --profile TEXT                  Select a specific profile from your
                                  credential file to get AWS credentials.

  --region TEXT                   Set the AWS Region of the service (e.g. us-
                                  east-1).

  -h, --help                      Show this message and exit.
```
