# News Pulse
<img src="/assets/NewspulsePreview.png">

## About
Simple flutter app for displaying news using the News API.

## Configuration and API Keys

### Handling Sensitive Information
This project uses a `config.dart` file to manage sensitive information like API keys. To ensure security and prevent accidental exposure of sensitive data:

1. **Add `config.dart` to `.gitignore`:** 
   Ensure that `config.dart` is included in the `.gitignore` file. This prevents Git from tracking changes to this file and avoids committing sensitive information to the repository.

    ```
    # .gitignore

    # Exclude config.dart to prevent it from being tracked
    /lib/config.dart
    ```

2. **Create `config_sample.dart`:**
   Provide a `config_sample.dart` file (or similarly named) that contains placeholders or instructions for setting up the necessary configurations. This file should be committed to the repository and serves as a template for developers to create their own `config.dart` file.

   ```dart
   // config_sample.dart

   class Config {
     static const String apiKey = 'YOUR_API_KEY_HERE';
   }

## Licence

```
MIT License

Copyright (c) 2023 Keith Omware

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```