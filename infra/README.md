# Infra

Instructions on how to deploy the NextJS application and how to set up database backup.

## Directory Structure

Here's an overview of the relevant files and directories:

- `./systemd/mat.service`: Service to run the NextJS application.
- `./systemd/database_backup.service`: Service to backup the database.
- `./systemd/database_backup.timer`: Timer that triggers the backup.
- `./mat-env`: Example environment file for the systemd service.
- `./postgrest.example.cfg`: Example configuration file for PostgREST.
- `./nginx/mat.stenberg.io`: Nginx configuration file for the domain mat.stenberg.io.

## Prerequisites

You must have Node 18 installed to run the NextJS application, I recommend using NVM.

You can install NVM using the following command:

```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
```

Then, install Node 18:

```bash
nvm install 18
nvm use 18
```

Install PostgREST following the instructions on the [official website](https://postgrest.org/en/latest/install.html) or using package managers like `apt` or `brew`.

For Ubuntu:

```bash
sudo apt-get install postgrest
```

For macOS:

```bash
brew install postgrest
```

## Deployment Instructions

### 1. NextJS Application

To deploy the NextJS application, follow these steps:

- Copy `./systemd/mat.service` to `/etc/systemd/system/`.
- Copy `./mat-env` to `/etc/mat-env` and edit the values to match your configuration. The `NEXTAUTH_SECRET` must match the `jwt-secret` in `postgrest.cfg`.
- Start the service using `sudo systemctl start mat.service`.
- Enable the service to start on boot using `sudo systemctl enable mat.service`.

### 2. Database Backup Service

To deploy the database backup service, follow these steps:

- Copy `./systemd/database_backup.service` and `./systemd/database_backup.timer` to `/etc/systemd/system/`.
- Enable the timer to start on boot using `sudo systemctl enable database_backup.timer`.

### 3. PostgREST Configuration

- Create a copy of `./infra/postgrest.example.cfg` and name it `./infra/postgrest.cfg`.
- Customize `./infra/postgrest.cfg` as needed for your environment. Add the same secret as in `/etc/mat-env`
- Start PostgREST using the configuration file:

  ```bash
  postgrest ./infra/postgrest.cfg
  ```

### 4. GitHub Workflow for Backup

The existing workflow file for backing up the database and files is located in the GitHub repository under `.github/workflows/backup.yml`. Follow these steps to configure it:

1. **Configure Secrets**: Go to your GitHub repository settings, navigate to the "Secrets" tab, and add the following secrets:

   - `APP_SERVER_SSH_KEY`: The SSH key to access your application server.

2. **Verify the Workflow**: You can manually trigger the workflow or wait for the scheduled run. Check the "Actions" tab in your GitHub repository to monitor the workflow's progress and view logs.

This workflow will automatically back up the specified database and files to your GitHub repository.

---

Happy deploying!
