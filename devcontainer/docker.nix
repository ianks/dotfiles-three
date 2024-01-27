{ pkgs, homeConfiguration }:

let
  # Define the user environment by using home-manager's switch-to-configuration script.
  # This will apply the home-manager configuration to the Docker image.
  userEnv = pkgs.runCommandNoCC "user-environment" { } ''
    mkdir -p $out
    ${homeConfiguration.activationPackage}/activate > $out/activate
  '';

in
pkgs.dockerTools.buildLayeredImage {
  name = "ianks-devcontainer";
  tag = "latest";

  # Include the user environment as a layer in the Docker image.
  contents = [ userEnv ];

  # Set user-related configuration.
  config = {
    User = "ianks"; # Replace with your desired username.
    # Other Docker configuration options go here.
  };

  # You can customize the image by specifying more settings here.
  # For example, if you want to include additional packages directly
  # in the image, you can do so.
  extraCommands = ''
    # Add extra configuration commands here, if needed.
  '';
}
