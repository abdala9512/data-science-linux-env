# data-science-linux-env
Simple Data Science environemnt setup for  linux distributions (Debian and RedHat based for now). With a couple of commands you will have a ready-to-use data science work environment in case you're working on a new computer or remote server.

The setup includes:
- Python with their most popular modules for data science (pandas, numpy, scikit-learn, tensforflow, etc)
- Git - Latest version
- Docker - Latest version
- Spark (optional)
- AWS and GCP tools in python
- Heroku CLI
- Visualization and webApp modules (Matplotlib, plotly, dash, streamlit, etc..)


# download
```
wget https://github.com/abdala9512/data-science-linux-env/blob/main/<selected-configuration>.sh
```

# Permissions
```
chmod +x <selected-configuration>.sh
```

# Run
Try to run the bash script in /home to avoid possible issues
```
cd
./ds_simple_setup.sh
```
