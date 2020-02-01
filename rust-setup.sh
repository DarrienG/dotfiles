#!/usr/bin/env bash

echo "\trust"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

RUST_PACKAGES="typeracer cargo-update exa topgrade zrs"
echo "\t$RUST_PACKAGES"
cargo install "$RUST_PACKAGES"
