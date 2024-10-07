# Use Ubuntu as the base image
FROM ubuntu:24.04

# Set environment variables to prevent user interaction during install
ENV DEBIAN_FRONTEND=noninteractive

# Install sudo and other necessary packages
RUN apt-get update && \
    apt-get install -y sudo

# Add a user with sudo privileges
RUN useradd -ms /bin/bash nedelcu && echo "nedelcu ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/nedelcu

# Copy the dotfiles repo to the container while still as root
COPY . /home/nedelcu/dotfiles

# Change permissions of the copied files so that the user can modify them
RUN chown -R nedelcu:nedelcu /home/nedelcu/dotfiles

# Make the install.sh script executable (as root)
RUN chmod +x /home/nedelcu/dotfiles/install.sh

# Switch to the non-root user
USER nedelcu
WORKDIR /home/nedelcu/dotfiles

# Run the installation script with sudo
RUN ./install.sh

# Default command to keep the container running or provide a shell
CMD ["/bin/bash"]

