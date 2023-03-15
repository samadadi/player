#!/bin/sh 
flatpak-builder --ccache --force-clean --state-dir state-dir build-dir com.samadadi.Player.json
