#!/usr/bin/env bash

set -eux -o pipefail

USERNAME=${USERNAME:-"devcontainer"}
SSHAUTHORIZEDKEYSURL=${SSHAUTHORIZEDKEYSURL:-"none"}
DOTFILESREPO=${DOTFILESREPO:-"none"}

if [ "$(id -u)" -ne 0 ]; then
    echo -e 'Script must be run as root. Use sudo, su, or add "USER root" to your Dockerfile before running this script.'
    exit 1
fi

if ! id -u "$USERNAME" > /dev/null 2>&1; then
    echo -e "The user $USERNAME does not exist. Please create the user and re-run this script."
    exit 1
fi

if [ "$DOTFILESREPO" != "none" ]; then
  echo "Cloning dotfiles to /home/$USERNAME/.dotfiles"
  git clone "$DOTFILESREPO" "/home/$USERNAME/.dotfiles"
fi

if [ -f "/home/$USERNAME/.dotfiles/install.sh" ]; then
  # Remove the default zshenv file from nix, as it will be replaced by the dotfiles install script
  rm -f "/home/$USERNAME/.zshenv"
  echo "Running dotfiles install script"
  sudo -u "$USERNAME" /home/"$USERNAME"/.dotfiles/install.sh
  echo "Setting default shell to nix zsh"
  sudo -u "$USERNAME" chsh -s "/home/$USERNAME/.nix-profile/bin/zsh" "$USERNAME"
fi

if [ "$SSHAUTHORIZEDKEYSURL" != "none" ]; then
  echo "Enabling SSH access for $USERNAME"
  mkdir -p "/home/$USERNAME/.ssh"
  curl -fsSL "$SSHAUTHORIZEDKEYSURL" > "/home/$USERNAME/.ssh/authorized_keys"
  chown -R "$USERNAME" "/home/$USERNAME/.ssh"
  chmod 700 "/home/$USERNAME/.ssh"
  chmod 600 "/home/$USERNAME/.ssh/authorized_keys"
  echo "Enabled access for these keys:"
  cat "/home/$USERNAME/.ssh/authorized_keys"
fi

echo "Creating entrypoint script"
tee /usr/local/share/entrypoint.sh > /dev/null \
<< 'EOF'
#!/usr/bin/env bash

set -eu -o pipefail

/usr/local/share/ssh-init.sh
echo "Started sshd in the background"
sleep infinity
EOF
chmod +x /usr/local/share/entrypoint.sh

echo "Done!"