from setuptools import setup, find_packages

setup(
    name="dummy",
    version="0.1",
    packages=find_packages(),
    entry_points={"console_scripts": ["dummy=dummy_cli.cli:cli"]},
    include_package_data=True,
    install_requires=[
        "click"
    ],
)