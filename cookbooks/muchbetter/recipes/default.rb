package "gdal-bin"
package "python-dev"
package "libxslt-dev"
package "libxml2-dev"
package "memcached"
package "libmemcached-dev"

bash "create_virtualenv" do
    user "vagrant"
    code <<-EOH
        virtualenv /home/vagrant/.env
        source /home/vagrant/.env/bin/activate
        pip install -r /src/requirements.txt 
    EOH
end