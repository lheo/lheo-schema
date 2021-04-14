import os

from setuptools import setup, find_packages

#here = os.path.abspath(os.path.dirname(__file__))
#with open(os.path.join(here, 'README.txt')) as f:
#    README = f.read()
#with open(os.path.join(here, 'CHANGES.txt')) as f:
#    CHANGES = f.read()

requires = [
    'lxml',
  	'cssselect',
    'sphinx',
    'sphinx-rtd-theme'
]

setup(name='reference',
      version='0.0',
      description='reference',
      #long_description=README + '\n\n' + CHANGES,
	  long_description='',
      classifiers=[
        "Programming Language :: Python",
        ],
      author='',
      author_email='',
      url='',
      keywords='',
      packages=find_packages(),
      include_package_data=True,
      zip_safe=False,
      install_requires=requires,
      tests_require=requires,
      test_suite="reference",
      )
