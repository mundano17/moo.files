#!/bin/bash
# script to get all the dev setup for the upcoming semester or any open source development
# this script will install all the necessary packages for development
# it will also install the necessary tools for development

sudo pacman -Syu
sudo pacman -S --needed git base-devel
# python
sudo pacman -S --needed python python-pip
# jave
# cpp/c
# rust
# nodejs
# mongodb
# docker

# doom emacs
# vscode
# neovim

   