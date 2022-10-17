import requests
import pathlib
from bs4 import BeautifulSoup
import logging
import pandas as pd

logging.basicConfig(
    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s',
    level=logging.INFO
)
logger = logging.getLogger('Process Data')

def get_files_url(url_site):
    page = requests.get(url_site)
    soup = BeautifulSoup(page.content, "html.parser")
    result = soup.find_all('a', class_='filename')
    return result

def download_xl_file(save_directory, href_list, url_site):
    this_file_path = pathlib.Path(__file__).parent.resolve()
    logger.debug(f'{this_file_path}')
    parent_path = this_file_path.parent
    logger.debug(f'{parent_path}')
    downloads_path = parent_path.joinpath(save_directory) 
    logger.debug(f'{downloads_path}')
    downloads_path.mkdir(exist_ok=True)   
    for href in href_list:
        url_download = f"{url_site}{href['href']}"
        file_name = href.text.strip().replace(" ", "_")
        file = requests.get(url_download)
        with open(downloads_path.joinpath(file_name), "wb") as output:
            output.write(file.content)
        logger.debug(f'{downloads_path.joinpath(file_name)}')
        logger.info(f"{file_name} downloaded")



