#!/bin/sh 
flatpak-builder --user --install --ccache --force-clean --state-dir state-dir build-dir com.samadadi.Player.json && flatpak run com.samadadi.Player