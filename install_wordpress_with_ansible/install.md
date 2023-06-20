# Docker Compose with WordPress and phpMyAdmin

This Ansible playbook automates the installation of Docker Compose along with WordPress and phpMyAdmin on a target host.

## Prerequisites

- Ansible installed on the control machine.
- Access to the target host(s) via SSH.

## Usage

1. Clone this repository or copy the playbook and template files to your local machine.

2. Update the `inventory.ini` file with the IP or hostname of your target host(s) under the `[all]` group.

3. Modify the variables in the `playbook.yml` file to suit your requirements:

   - `wordpress_dir`: The directory where the WordPress application will be installed.
   - `mysql_root_password`: The root password for the MySQL database.
   - `wordpress_db_password`: The password for the WordPress database user.

4. Customize the `templates/docker-compose.yml.j2` file if needed. This is the template for the Docker Compose configuration.

5. Run the playbook using the following command:


6. Ansible will execute the playbook tasks on the target host, installing Docker Compose, creating the necessary directory, generating the Docker Compose file, and starting the WordPress and phpMyAdmin services.

7. Access the WordPress site by navigating to `http://<target_host_ip>:8080` in your web browser.

8. Access phpMyAdmin by navigating to `http://<target_host_ip>:8181` in your web browser.

## Folder Structure

The folder structure of this repository is as follows:


├── playbook.yml
├── inventory.ini
└── templates
└── docker-compose.yml.j2



- `playbook.yml`: The main Ansible playbook file.
- `inventory.ini`: The inventory file containing the target host(s).
- `templates/docker-compose.yml.j2`: The Jinja2 template file for generating the Docker Compose configuration.

## License

This project is licensed under the [MIT License](LICENSE).
Feel free to modify the content of the README.md file to fit your specific needs and add any additional information or instructions that you find necessary.