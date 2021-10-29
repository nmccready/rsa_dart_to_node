#!/usr/bin/env node
const fs = require("fs");
const crypto = require("crypto");
const path = require("path");

const stdinBuffer = fs.readFileSync(0); // STDIN_FILENO = 0
const encMsgB64 = stdinBuffer.toString();

const key = fs
  .readFileSync(path.join(__dirname, "..", "test", "private_key.pem"))
  .toString();

// NOTE default padding is RSA_PKCS1_OAEP_PADDING
// openssl uses RSA_PKCS1_PADDING
const msg = crypto.privateDecrypt(
  { key, padding: crypto.constants.RSA_PKCS1_PADDING },
  Buffer.from(encMsgB64, "base64")
);
const decryptedMsg = msg.toString("utf8");

console.log(decryptedMsg);
