VERSION="5.0"
POINTVERSION="5.0"
REVISION=""
BUILDOUTCACHE=buildout-cache
if [ ! -d "$BUILDOUTCACHE" ]; then
wget -O /tmp/unifiedinstaller.tgz https://launchpad.net/plone/${VERSION}/${POINTVERSION}/+download/Plone-${POINTVERSION}${REVISION}-UnifiedInstaller.tgz
cd ..
tar xfz /tmp/unifiedinstaller.tgz
tar xfj Plone-${POINTVERSION}${REVISION}-UnifiedInstaller/packages/buildout-cache.tar.bz2 
fi
sudo pip install -U setuptools
virtualenv --python=python2.7 venv
venv/bin/pip install -r requirements.txt
wget https://bootstrap.pypa.io/bootstrap-buildout.py -O bootstrap.py
venv/bin/python bootstrap.py --buildout-version=2.5
./bin/buildout