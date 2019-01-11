from setuptools import setup


setup(
    name='Intel Display Backlight Adjuster',
    version='0.1',
    py_modules=['backlight'],
    install_requires=[
        'Click',
    ],
    entry_points='''
        [console_scripts]
        backlight=backlight:backlight
    ''',
    author='Joseph Knight',
)
