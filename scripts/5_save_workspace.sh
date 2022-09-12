#! /bin/bash

tar -cvzf workspace.tgz workspace/*
ncftpput -u emilio emiliofederici.myqnapcloud.com Public workspace.tgz
rm workspace.tgz
