# Crt.sh


A Bash script to extract unique subdomains from crt.sh JSON output.

## Usage

Only JSON format will work

Dependency:

```bash
sudo apt install jq or brew install jq
```


1. Clone the repository:
   ```bash
   https://github.com/ashique-thaha/Crt.sh.git
   cd Crt.sh
   ```
   
2. Make the script executable:
   ```bash
   chmod +x Crt.sh
   ```
   
3. Run the script:
   ```bash
   ./Crt.sh input_file output_file [-v]
   ```
   
4. Verbose
   ```bash
   ./Crt.sh input.json output.txt -v
   ```
