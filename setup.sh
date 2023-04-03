# No shebang for attempted system independence
echo "Setting up all sup-repositories of the grid"

# install node_modules
echo "Installing node_modules"
npm --prefix ./grid-core install ./grid-core
npm --prefix ./grid-project install ./grid-project
npm --prefix ./grid-server install ./grid-server