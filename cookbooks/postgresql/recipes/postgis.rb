#
# Cookbook Name:: postgresql
# Recipe:: postgis
#

include_recipe "postgresql"
include_recipe "geos"
include_recipe "proj4"

package "postgresql-#{node["postgresql"]["version"]}-postgis"

bash "create_postgis_template" do
    user "postgres"
    code <<-EOH
        POSTGIS_SQL_PATH=/usr/share/postgresql/9.1/contrib/postgis-1.5

        # Creating the template spatial database.
        createdb --locale=en_US.utf8 -E UTF8 -T template0 template_postgis 
        createlang -d template_postgis plpgsql

        # Allows non-superusers the ability to create from this template
        psql -d postgres -c "UPDATE pg_database SET datistemplate='true' WHERE datname='template_postgis';"
        # Loading the PostGIS SQL routines
        psql -d template_postgis -f $POSTGIS_SQL_PATH/postgis.sql
        psql -d template_postgis -f $POSTGIS_SQL_PATH/spatial_ref_sys.sql
        
        # Enabling users to alter spatial tables.
        psql -d template_postgis -c "GRANT ALL ON geometry_columns TO PUBLIC;"
        psql -d template_postgis -c "GRANT ALL ON geography_columns TO PUBLIC;"
        psql -d template_postgis -c "GRANT ALL ON spatial_ref_sys TO PUBLIC;"
    EOH
end