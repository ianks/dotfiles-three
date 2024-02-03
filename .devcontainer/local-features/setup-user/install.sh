#!/usr/bin/env bash

set -eux -o pipefail

USERNAME=${USERNAME:-"devcontainer"}
GITHUBUSERNAME=${GITHUBUSERNAME:-"unknown"}

if [ "$GITHUBUSERNAME" = "unknown" ]; then
    echo -e 'The GITHUB_USERNAME environment variable must be set to the GitHub username of the user you want to enable SSH access for.'
    exit 1
fi

if [ "$(id -u)" -ne 0 ]; then
    echo -e 'Script must be run as root. Use sudo, su, or add "USER root" to your Dockerfile before running this script.'
    exit 1
fi

if ! id -u "$USERNAME" > /dev/null 2>&1; then
    echo -e "The user $USERNAME does not exist. Please create the user and re-run this script."
    exit 1
fi

echo "Enabling SSH access for $GITHUBUSERNAME on user $USERNAME..."
mkdir -p "/home/$USERNAME/.ssh"
curl -fsSL "https://github.com/$GITHUBUSERNAME.keys" > "/home/$USERNAME/.ssh/authorized_keys"
chown -R "$USERNAME" "/home/$USERNAME/.ssh"
chmod 700 "/home/$USERNAME/.ssh"
chmod 600 "/home/$USERNAME/.ssh/authorized_keys"
echo "Enabled access for these keys:"
cat "/home/$USERNAME/.ssh/authorized_keys"

# Write out a scripts that can be referenced as an ENTRYPOINT to auto-start sshd and fix login environments
tee /usr/local/share/entrypoint.sh > /dev/null \
<< 'EOF'
#!/usr/bin/env bash

set -eu -o pipefail

echo "Starting SSH..."
/usr/local/share/ssh-init.sh
echo "Starting SSH...Done!"
echo "You can now connect to this container using SSH using the following command:"
echo "    $ ssh -p ${SSHD_PORT} -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -o GlobalKnownHostsFile=/dev/null ${USERNAME}@localhost"
echo "Any SSH keys you have associated with your GitHub account will be accepted for SSH access."
sleep infinity

EOF

chmod +x /usr/local/share/entrypoint.sh

echo "Done!"