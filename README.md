# file_encrypted
As a rule of thumb, when creating files that contain sensitive information such as key values, passwords, iam user's key values and others, we need to apply a leve l of security by encrypting them. The following scripts written in bash can be used for these tasks.
The best and most secure way to encrypt a file using OpenSSL is to use the following steps:

# Generate a strong password. The password should be at least 12 characters long and should include a mix of uppercase and lowercase letters, numbers, and symbols.
Use the openssl enc command to encrypt the file, specifying the following options:
-e: Encrypt the file.
-aes-256-cbc: Use the AES-256-CBC cipher.
-salt: Use a random salt for the encryption.
-in [plaintext_file]: The input file to encrypt.
-out [encrypted_file]: The output file that will contain the encrypted data.
For example, the following command would encrypt the file myfile.txt and save the encrypted file as myfile.txt.enc:

openssl enc -e -aes-256-cbc -salt -in myfile.txt -out myfile.txt.enc
Store the password in a safe place. The password should not be stored in the same file as the encrypted data.

When you need to decrypt the file, you will need to use the same password and the openssl enc command, specifying the following options:

-d: Decrypt the file.
-aes-256-cbc: Use the AES-256-CBC cipher.
-in [encrypted_file]: The input file that contains the encrypted data.
-out [decrypted_file]: The output file that will contain the decrypted data.
For example, the following command would decrypt the file myfile.txt.enc and save the decrypted data as myfile.txt:

openssl enc -d -aes-256-cbc -in myfile.txt.enc -out myfile.txt
The AES-256-CBC cipher is a strong encryption algorithm that is considered to be secure against current attacks. The salt helps to prevent dictionary attacks. By following these steps, you can encrypt your files securely using OpenSSL.

Here are some additional tips for encrypting files securely:

Use a strong password and do not share it with anyone.
Store the password in a safe place.
Encrypt the file in a secure environment, such as a virtual private network (VPN).
Encrypt the file in multiple locations.
Rotate the encryption keys regularly.
By following these tips, you can help to protect your files from unauthorized access.
## How to use

* Create two bash script files (encriptar and desencriptar) with an extension .sh (For instances, you can use whatever the name you want)
* Inside the encriptar.sh / desencriptar.sh write the following:

### encriptar.sh

  ```shell
   #!/bin/bash
    openssl enc -aes-256-cbc -salt -in $1 -out $2 -pbkdf2
  ```
### desencriptar.sh
```shell
  #!/bin/bash
 openssl enc -d -aes-256-cbc -in $1 -out $2 -pbkdf2
```

* When the files have been created so, we need to make them executable:
  ```shell
  chmod +x encriptar.sh desencriptar.sh
  ```
* We can take at look and see if they are executable files by writting
  ```shell
  ls -lar
  ```

### Execute the bash script files
* Encrypting the file
```shell
bash encriptar.sh input_file_name_to_encrypt output_file_name_to_what_ever_extension
Example:
bash encriptar my_file,csv my_file.csv.enc
```
* desencrypting the file
```shell
bash desencriptar.sh input_file_name_to_desencrypt output_file_name_to_what_ever_extension
Example:
bash deseencriptar my_file,csv.enc my_file.txt
```

  
