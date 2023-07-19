Here's the updated README.md file that includes the steps to create an EC2 instance in AWS and how to SSH into it:

# Static Application Deployment on EC2 Instance

This repository contains a bash shell script to automate the deployment of a static application on an EC2 instance. The script installs Apache HTTP server, Git, and clones a static website from a GitHub repository to the `/var/www/html` directory. It then starts the Apache HTTP server to serve the website.

## Prerequisites

Before running the deployment script, ensure that you have the following:

1. An AWS account with access to the EC2 service.
2. An EC2 instance running a Linux-based operating system (e.g., Amazon Linux, CentOS, Ubuntu).
3. Internet access on the EC2 instance to download packages and clone the repository from GitHub.

## Step-by-Step Deployment

### Step 1: Create an EC2 Instance

1. Sign in to your AWS Management Console.
2. Navigate to the EC2 Dashboard.
3. Click on the "Launch Instance" button to start the instance creation process.

#### Step 1.1: Choose an Amazon Machine Image (AMI)

- Select an AMI based on your requirements. For example, you can choose "Amazon Linux 2" or any other supported Linux distribution.

#### Step 1.2: Choose an Instance Type

- Select the instance type that suits your needs. The default instance type is usually sufficient for testing and small applications.

#### Step 1.3: Configure Instance Details

- Set the desired number of instances, network settings, and other configuration options. You can leave most of the options as default for a basic setup.

#### Step 1.4: Add Storage

- Configure the instance's root volume size and add additional volumes if required. You can adjust the size as per your application needs.

#### Step 1.5: Add Tags

- Optionally, add tags to the instance to help identify it later.

#### Step 1.6: Configure Security Group

- Create a new security group or select an existing one. Make sure to allow SSH (port 22) access to your instance from your IP address or a specific IP range.

#### Step 1.7: Review and Launch

- Review your instance configuration and click on "Launch" if everything looks correct.

#### Step 1.8: Choose an existing key pair or create a new key pair

- If you already have an existing key pair, select it. Otherwise, create a new key pair, download the private key (e.g., `your-key.pem`), and keep it in a safe location. You'll need this key to SSH into your instance.

### Step 2: SSH into the EC2 Instance

1. Open a terminal or command prompt on your local machine.

2. Navigate to the directory containing the downloaded private key file (`your-key.pem`).

3. Set the correct permissions on the private key file:

   ```bash
   chmod 400 your-key.pem
   ```

4. SSH into the EC2 instance using the public IP or DNS name and the private key:

   ```bash
   ssh -i your-key.pem ec2-user@public_ip_or_dns
   ```

   Replace `your-key.pem` with the actual name of your private key file and `public_ip_or_dns` with the public IP address or DNS name of your EC2 instance.

5. If you are using a different user other than `ec2-user`, adjust the SSH command accordingly.

You are now logged into your EC2 instance via SSH and can begin executing commands and deploying applications as needed. Remember to keep your private key secure and do not share it with others.

## Deployment Steps

To deploy the static application on your EC2 instance, follow these steps:

1. **SSH into your EC2 Instance**: Connect to your EC2 instance using SSH and log in as a user with `sudo` privileges.

2. **Download the Deployment Script**: You can either copy the script directly into your terminal or create a new file (e.g., `deploy.sh`) on your EC2 instance and paste the script content.

3. **Give Execute Permissions**: Make the script executable by running the following command:

   ```bash
   chmod +x deploy.sh
   ```

4. **Run the Deployment Script**: Execute the script with the following command:

   ```bash
   ./deploy.sh
   ```

   The script will perform the following actions:

   - Update the system packages using `yum update`.
   - Install Apache HTTP server (`httpd`) and Git using `yum install`.
   - Change the working directory to `/var/www/html`.
   - Clone the static website repository from GitHub using `git clone`.
   - Copy the content of the repository to the `/var/www/html` directory.
   - Remove the cloned repository to keep the web server root clean.
   - Enable and start the Apache HTTP server using `systemctl`.

5. **Access the Static Website**: Once the script execution completes successfully, the static website will be available on your EC2 instance's public IP or DNS. You can access it using a web browser.

## Repository Content

The repository includes the following files:

- `deploy.sh`: The bash shell script to automate the deployment of the static application.
- `README.md`: This file, providing instructions for using the script.

## License

This project is licensed under the [MIT License](LICENSE). Feel free to modify and use the script according to your needs.

## Acknowledgments

We acknowledge the contributions from the open-source community and the developers of the static website hosted on GitHub (https://github.com/obinnaaliogor/techmax.git).
