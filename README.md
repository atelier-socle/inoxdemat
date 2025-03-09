# Digital Documentation Update Process

## Context
This documentation describes the process for updating digital documents for the squads within the squad. It details the necessary steps to process Excel and PDF files to ensure compliance and proper integration into the Swift Package Manager (SPM) package.

## Overview
This project provides a **Swift Package Manager (SPM) package** with a **shell setup script** that initializes your Mac’s configuration. It also includes a **script to process an Excel file**, which updates the digital documentation for the "ECV" and "ARE" projects.

## Prerequisites
Before running the scripts, ensure that:
- Your system is running **macOS 15.0**.
- You have installed **Swift 6**.
- You have placed the required files in the correct directories.

## Using the Scripts

### 1. Setup Script
To initialize the Mac configuration for the first time, navigate to the `.scripts/` directory and run the setup script:

```sh
cd .scripts/
sh setup.sh
```

### 2. Excel File Processing
This script converts an **Excel file** provided by the product team into a format compliant with the package requirements. It performs the following tasks:
- Validates and adjusts the Excel file to meet the package's technical requirements.
- Updates the `Documents.json` reference file in the package resources.
- Replaces and updates the **Gherkin (.feature) files** used for functional BDD tests.
- Cleans up and updates **PDF files** within the repository.

#### Steps to Execute the Script

1. **Place the required files** in the appropriate directories:
   - **Excel file:** Move it to `.scripts/sources/excel/`
   - **PDF files:** Place `Excelium` and `Ma Retraite` PDF files in the dedicated folders:
     - `.scripts/sources/pdfs/Excelium/`
     - `.scripts/sources/pdfs/MaRetraite/`
2. **Navigate to the `.scripts/` directory:**

   ```sh
   cd .scripts/
   ```
3. **Run the script, specifying the Excel file path:**

   ```sh
   sh run.sh "sources/excel/repository.xlsx"
   ```

### 3. Post-Execution Steps
After the script completes:
- The **PDF files, `Documents.json`, and Gherkin (.feature) files** will be updated.
- Open **`Package.swift`** in **Xcode**, then **run the tests (CMD + U)** to verify they pass.
- If tests fail, **discard all Git changes and restart the process**.
- If tests pass:
  - Run `swiftformat .`
  - **Commit and create a pull request** to update the remote repository.

## 🚨 Important Notes for the Product Team
The provided **Excel file must strictly comply with the following technical requirements**:

✅ **Excel File Structure**:
- **Do not modify** table headers or keys.
- **Strictly adhere** to the predefined cell format from the example template.
- **All fields must be filled** – no empty fields allowed.
- **No duplicate rows** (same `id` value) are permitted.
- **Do not add empty rows or columns**.

📌 **Excel File Content**:
- The file **must include all CURRENT and UPCOMING documents**.
- **All PDF files must be provided and correctly referenced**:
  - **File names** must be free of special characters, accents, and **should not include the `.pdf` extension**.

💡 **Failure to meet these requirements**: Any errors in the file structure may cause the script execution to fail. Ensure the file is fully compliant before submitting it to the technical team.

## 📂 Azure DevOps Repository References
For more information and access to the project source code, refer to the following repositories:
- [InovDematerialisation SPM](https://www.google.com)
- [DigitalDocsCLI SPM](https://www.apple.com)

