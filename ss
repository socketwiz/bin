#! /usr/bin/env bash

window_id=$(xwininfo | awk '/Window id: 0x[0-9]/{print $4;}')
shotgun -i ${window_id}
