#!/bin/bash

# XMG
docker node update --label-add miner=false bebop.dojo.io
docker node inspect --format '{{ .Spec.Labels }}' bebop.dojo.io
docker node update --label-add miner=false rocks.dojo.io
docker node inspect --format '{{ .Spec.Labels }}' rocks.dojo.io
docker node update --label-add miner=true venus.dojo.io
docker node inspect --format '{{ .Spec.Labels }}' venus.dojo.io
docker node update --label-add miner=true ninja.dojo.io
docker node inspect --format '{{ .Spec.Labels }}' ninja.dojo.io
docker node update --label-add miner=true oroku.dojo.io
docker node inspect --format '{{ .Spec.Labels }}' oroku.dojo.io
