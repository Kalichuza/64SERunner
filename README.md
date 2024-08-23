# 64SERunner PowerShell Module

## Overview

64SERunner is a PowerShell module designed to encode PowerShell scripts into Base64 format and run those encoded scripts. This can be useful for securely transmitting scripts or storing them in a non-executable form.

## Features

- **Encode-ScriptToBase64**: Encodes a PowerShell script into a Base64 string and saves it as a `.64SE` file.
- **Run-Base64EncodedScript**: Decodes and runs a Base64-encoded PowerShell script.
- **EncodeAndRun-Script**: Encodes a PowerShell script into Base64, saves it as a `.64SE` file, and immediately runs the encoded script.

## Installation

### PowerShell Gallery

You can install 64SERunner directly from the PowerShell Gallery (ensure you have the `64SE` module installed first):

```powershell
Install-Module -Name 64SERunner
