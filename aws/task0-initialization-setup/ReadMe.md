# Initialization Setup

- Create a user `terraform` by navigating _Login to AWS_ ->  _IAM_ -> _Users_ -> _Add User_

![](.ReadMe_images/Add_user_screen.png)

- Create a group `terraform-administrators`

![](.ReadMe_images/group_creation_screen.png)

- Review screen

![](.ReadMe_images/review_screen.png)

- Download the `credentials.csv` containing `Access key ID` and `Secret access key`

- Finally export the values of `Access key ID` and `Secret access key` as showing below in your 
current shell.

```bash
export AWS_ACCESS_KEY_ID=YOUR_ACCESS_KEY_ID
export AWS_SECRET_ACCESS_KEY=YOUR_SECRET_ACCESS_KEY
```