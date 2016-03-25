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

The REST API specialization provides templates that can be used by Oxygen 
to provide a REST-API topic type in the "New Document" wizard:

1. Navigate to the Oxygen DITA-OT installation directory (`/opt/Oxygen/frameworks/dita/DITA-OT` for example).
2. Navigate to the `plugins` directory.
3. Clone or unzip the REST-API plugin in this directory.
> You should now have a `./DITA-OT/plugins/com.prismadoc.rest-api` directory.
4. Open the Oxygen XML editor, and click `Window > Show View > Transformation Scenarios`.
5. In the Transformation scenario tab, click the `Gear` icon and select `Show all`.
6. Find the `Run DITA OT Integrator` entry, and double-click it to run.
> The plugin is now installed and ready to use.

#### Using REST API Topic type in Oxygen

1. Click `File > New`.
2. Type `api` in the Filter text.
> The dialog should display the DITA "REST API" topic type.
3. Click the REST API template.
4. Start editing.
