# No shebang for attempted system independence
echo "Setting up all sub-repositories of the grid"

# install node_modules
echo "Installing node_modules"
npm install
npm --prefix ./grid-core install ./grid-core
npm --prefix ./grid-project install ./grid-project
npm --prefix ./grid-server install ./grid-server