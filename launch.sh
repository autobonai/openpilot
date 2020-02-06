#!/usr/bin/bash

tmux pipe-pane -o 'cat >/tmp/tmux_out'
PYTHONPATH=/data/openpilot /data/openpilot/selfdrive/test/eon_testing_slave.py &

echo -n 1 > /data/params/d/CommunityFeaturesToggle
echo -n 2 > /data/params/d/HasAcceptedTerms
echo -n "0.2.0" > /data/params/d/CompletedTrainingVersion

export PASSIVE="0"
export FAKEUPLOAD="1"

exec ./launch_chffrplus.sh
