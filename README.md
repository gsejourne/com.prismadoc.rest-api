# com.prismadoc.rest-api

## How to use


### Integrate REST API specialization in DITA-OT

The REST API specialization is shipped as a DITA-OT plugin, which needs
to be installed in DITA-OT:

> The plugin has been tested against versin 2.0 and 2.1 of DITA-OT.

1. Navigate to your DITA-OT installation directory (`/opt/DITA-OT` for example).
2. Navigate to the `plugins` directory.
3. Clone or unzip the REST-API plugin in this directory.
> You should now have a `./DITA-OT/plugins/com.prismadoc.rest-api` directory.
4. Navigate to the `DITA-OT` directory, and run 
	ant -f integrator.xml
	
> The plugin is now installed and ready to use.

#### Build samples to test the installation

1. Within the DITA-OT directory, run:
	dita -f xhtml -i plugins/com.prismadoc.rest-api/samples/sample.dita
	
### Integrate REST API Specialization in Oxygen XML Editor


