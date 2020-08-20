# github-action-aws-copilot-deploy
Deploy service to AWS ECS x Fargate using AWS Copilot.

# Usage

## Inputs

### `svc`

**required** Your *Copliot* service name.

### `tag`

**required** Your container image tag.

## Example

Please use [configure-aws-credentials](https://github.com/aws-actions/configure-aws-credentials)  to mask the AWS account in the log.

```yaml
    - name: Configure AWS Credentials
      uses: aws-actions/configure-aws-credentials@v1
      with:
        aws-access-key-id: ${{ secrets.AWS_ACCESS_KEY_ID }}
        aws-secret-access-key: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
        aws-region: ap-northeast-1

    - name: Deploy Container
      uses: otajisan/github-action-aws-copilot-deploy@v1
      id: deploy-container
      with:
        svc: "aws-copilot-app-example-service"
        tag: "v0.0.1"
```