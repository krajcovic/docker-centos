 #!/bin/bash

 docker run -d -P training/webapp python app.py
 docker run -d -p 5000:5000 training/webapp python app.py