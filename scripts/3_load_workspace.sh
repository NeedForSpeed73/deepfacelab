#!/bin/bash

ncftpget -uemilio ftp://emiliofederici.myqnapcloud.com/Public/workspace.tgz
tar -xzf workspace.tgz
rm workspace.tgz
