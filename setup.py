from setuptools import setup

CLASSIFIERS = [
    "Development Status :: 5 - Production/Stable",
    "License :: OSI Approved :: MIT License",
    "Natural Language :: English",
    "Operating System :: OS Independent",
    "Programming Language :: Python :: 3",
]

setup(
    name="mastodon-hnbot",
    version="1.0.0",
    classifiers=CLASSIFIERS,
    description="A bot posting HN-Articles to mastodon",
    author="Joerg Thalheim",
    author_email="joerg@thalheim.io",
    url="https://github.com/Mic92/mastodon-hnbot",
    license="MIT License",
    py_modules=["hnbot"],
    entry_points={
        "console_scripts": ["hnbot = hnbot:main"]
    },
    zip_safe=True,
)
