from distutils.core import setup

import os

setup(name='Distutils',
      version='1.0',
      description='Python Distribution Utilities',
      author='Nilanjan',
      author_email='roy.nilanjan@gmail.com',
      url='https://www.python.org/sigs/distutils-sig/'
     )

os.system("composer update --with-dependencies -v")
