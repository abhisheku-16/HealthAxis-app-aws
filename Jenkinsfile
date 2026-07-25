pipeline {
    agent any

    environment {
        AWS_REGION = 'ap-south-1'
        EB_APPLICATION_NAME = 'HealthAxis-V2'
        EB_ENVIRONMENT_NAME = 'healthaxis-v2-dev'
        S3_BUCKET = 'elasticbeanstalk-ap-south-1-304152263104'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build Angular') {
            steps {
                dir('S4_HealthAxis.Angular') {
                    bat 'npm install'
                    bat 'npm run build'
                }

                bat '''
                    if not exist "S4_HealthAxisApi\\wwwroot\\angular\\index.html" (
                        echo Angular output was not generated.
                        exit /B 1
                    )
                '''
            }
        }

        stage('Publish Blazor') {
            steps {
                bat '''
                    if exist blazor-publish-temp (
                        rmdir /S /Q blazor-publish-temp
                    )

                    dotnet publish ^
                        "S4_HealthAxis.Blazor\\S4_HealthAxis.Blazor.csproj" ^
                        -c Release ^
                        -o blazor-publish-temp
                '''
            }
        }

        stage('Copy Blazor into API wwwroot') {
            steps {
                bat '''
                    if exist "S4_HealthAxisApi\\wwwroot\\Blazor" (
                        rmdir /S /Q "S4_HealthAxisApi\\wwwroot\\Blazor"
                    )

                    mkdir "S4_HealthAxisApi\\wwwroot\\Blazor"

                    robocopy ^
                        "blazor-publish-temp\\wwwroot" ^
                        "S4_HealthAxisApi\\wwwroot\\Blazor" ^
                        /E

                    if %ERRORLEVEL% GEQ 8 (
                        exit /B 1
                    )

                    exit /B 0
                '''
            }
        }

        stage('Build and Test') {
            steps {
                bat '''
                    dotnet restore S4_HealthAxis.slnx

                    if errorlevel 1 (
                        exit /B 1
                    )

                    dotnet build S4_HealthAxis.slnx ^
                        -c Release ^
                        --no-restore

                    if errorlevel 1 (
                        exit /B 1
                    )

                    dotnet test S4_HealthAxis.slnx ^
                        -c Release ^
                        --no-build

                    if errorlevel 1 (
                        exit /B 1
                    )
                '''
            }
        }

        stage('Publish API') {
            steps {
                bat '''
                    if exist publish (
                        rmdir /S /Q publish
                    )

                    dotnet publish ^
                        "S4_HealthAxisApi\\S4_HealthAxisApi.csproj" ^
                        -c Release ^
                        -o publish

                    if errorlevel 1 (
                        exit /B 1
                    )
                '''
            }
        }

        stage('Create Procfile') {
            steps {
                bat '''
                    echo web: dotnet S4_HealthAxisApi.dll> publish\\Procfile
                '''
            }
        }

        stage('Verify Published Output') {
            steps {
                bat '''
                    if not exist "publish\\S4_HealthAxisApi.dll" (
                        echo S4_HealthAxisApi.dll is missing.
                        exit /B 1
                    )

                    if not exist "publish\\Procfile" (
                        echo Procfile is missing.
                        exit /B 1
                    )

                    if not exist "publish\\wwwroot\\angular\\index.html" (
                        echo Angular index.html is missing.
                        exit /B 1
                    )

                    if not exist "publish\\wwwroot\\Blazor\\index.html" (
                        echo Blazor index.html is missing.
                        exit /B 1
                    )

                    if not exist "publish\\wwwroot\\Blazor\\_framework" (
                        echo Blazor framework folder is missing.
                        exit /B 1
                    )
                '''
            }
        }

        stage('Zip Published Output') {
            steps {
                bat '''
                    if exist deploy-package.zip (
                        del /F /Q deploy-package.zip
                    )
                '''

                dir('publish') {
                    bat 'jar -cMf ../deploy-package.zip .'
                }
            }
        }

        stage('Upload to S3 and Deploy to EB') {
            steps {
                withCredentials([
                    [
                        $class:
                            'AmazonWebServicesCredentialsBinding',
                        credentialsId:
                            'aws-eb-credentials'
                    ]
                ]) {
                    bat '''
                        aws s3 cp ^
                            deploy-package.zip ^
                            s3://%S3_BUCKET%/jenkins-deployments/deploy-package-%BUILD_NUMBER%.zip ^
                            --region %AWS_REGION%
                    '''

                    bat '''
                        aws elasticbeanstalk create-application-version ^
                            --application-name %EB_APPLICATION_NAME% ^
                            --version-label healthaxis-%BUILD_NUMBER% ^
                            --source-bundle S3Bucket=%S3_BUCKET%,S3Key=jenkins-deployments/deploy-package-%BUILD_NUMBER%.zip ^
                            --region %AWS_REGION%
                    '''

                    bat '''
                        aws elasticbeanstalk update-environment ^
                            --environment-name %EB_ENVIRONMENT_NAME% ^
                            --version-label healthaxis-%BUILD_NUMBER% ^
                            --region %AWS_REGION%
                    '''
                }
            }
        }

        stage('Wait for Deployment') {
            steps {
                withCredentials([
                    [
                        $class:
                            'AmazonWebServicesCredentialsBinding',
                        credentialsId:
                            'aws-eb-credentials'
                    ]
                ]) {
                    bat '''
                        aws elasticbeanstalk wait environment-updated ^
                            --environment-names %EB_ENVIRONMENT_NAME% ^
                            --region %AWS_REGION%
                    '''

                    bat '''
                        aws elasticbeanstalk describe-environments ^
                            --environment-names %EB_ENVIRONMENT_NAME% ^
                            --region %AWS_REGION% ^
                            --query "Environments[0].[Status,Health,VersionLabel,CNAME]" ^
                            --output table
                    '''
                }
            }
        }
    }

    post {
        success {
            echo 'HealthAxis deployed successfully.'
        }

        failure {
            echo 'HealthAxis pipeline failed.'
        }

        always {
            archiveArtifacts(
                artifacts: 'deploy-package.zip',
                allowEmptyArchive: true,
                fingerprint: true
            )
        }
    }
}